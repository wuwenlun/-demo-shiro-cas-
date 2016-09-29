package org.dongtian.sys.security.realm;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.cas.CasAuthenticationException;
import org.apache.shiro.cas.CasRealm;
import org.apache.shiro.cas.CasToken;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.SimplePrincipalCollection;
import org.apache.shiro.util.CollectionUtils;
import org.apache.shiro.util.StringUtils;
import org.dongtian.sys.constant.RedisConstant;
import org.dongtian.sys.entity.Menu;
import org.dongtian.sys.entity.Resource;
import org.dongtian.sys.entity.Role;
import org.dongtian.sys.entity.User;
import org.dongtian.sys.service.AccountService;
import org.dongtian.sys.service.ResourceService;
import org.dongtian.sys.service.RoleService;
import org.dongtian.sys.util.JsonUtils;
import org.jasig.cas.client.authentication.AttributePrincipal;
import org.jasig.cas.client.validation.Assertion;
import org.jasig.cas.client.validation.TicketValidationException;
import org.jasig.cas.client.validation.TicketValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;

import com.alibaba.fastjson.JSON;

public class CasAuthorizingRealm extends CasRealm {
	 private static Logger log = LoggerFactory.getLogger(CasAuthorizingRealm.class);
	@Autowired
	private AccountService accountService;
	@Autowired
	private ResourceService resourceService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private StringRedisTemplate redisTemplate;
	
	
	/***
	 * 单点认证方法
	 */
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		 CasToken casToken = (CasToken) token;
	        if (token == null) {
	            return null;
	        }
	        
	        String ticket = (String)casToken.getCredentials();
	        if (!StringUtils.hasText(ticket)) {
	            return null;
	        }
	        
	        TicketValidator ticketValidator = ensureTicketValidator();

	        try {
	            // contact CAS server to validate service ticket
	            Assertion casAssertion = ticketValidator.validate(ticket, getCasService());
	            // get principal, user id and attributes
	            AttributePrincipal casPrincipal = casAssertion.getPrincipal();
	            String userId = casPrincipal.getName();
	            log.debug("Validate ticket : {} in CAS server : {} to retrieve user : {}", new Object[]{
	                    ticket, getCasServerUrlPrefix(), userId
	            });

	            Map<String, Object> attributes = casPrincipal.getAttributes();
	            // refresh authentication token (user id + remember me)
	            casToken.setUserId(userId);
	            String rememberMeAttributeName = getRememberMeAttributeName();
	            String rememberMeStringValue = (String)attributes.get(rememberMeAttributeName);
	            boolean isRemembered = rememberMeStringValue != null && Boolean.parseBoolean(rememberMeStringValue);
	            if (isRemembered) {
	                casToken.setRememberMe(true);
	            }
	            // create simple authentication info
	           // List<Object> principals = CollectionUtils.asList(userId, attributes);
	            User user = this.accountService.login(attributes.get("userName").toString());
	            
	            //获取当前系统所对应的左侧菜单集合
	            List<Menu> menuList = new ArrayList<Menu>();
	           List<Menu> topMeunList =  this.resourceService.findTopMenuByUserId(user.getUserId(),null);
	           if(!org.springframework.util.CollectionUtils.isEmpty(topMeunList)) {
	        	   
	        	   for (Menu menu : topMeunList) {
	        		   List<Menu> menus = this.resourceService.findMenuListByParentId(menu.getMenuId());
	        		   if(!org.springframework.util.CollectionUtils.isEmpty(menus)) {
	        			   List<Menu> menusOne = new ArrayList<Menu>();
	        			   for (Menu menu2 : menus) {
	        				   List<Menu> menuss = this.resourceService.findMenuListByParentId(menu2.getMenuId());
	        				   menu2.setChildMenuList(menuss);
	        				   menusOne.add(menu2);
						}
	        			   
	        			  menuList.addAll(menusOne);
	        		   }
	        	   }
	        	   user.setMenuList(menuList);
	           }
	           
	            PrincipalCollection principalCollection = new SimplePrincipalCollection(user, getName());
	            redisTemplate.delete(RedisConstant.ROLE_AUTHORIZATION_LIST_KEY + user.getUserId());
				redisTemplate.delete(RedisConstant.RESOURCE_AUTHORIZATION_LIST_KEY + user.getUserId());
	            return new SimpleAuthenticationInfo(principalCollection, ticket);
	        } catch (TicketValidationException e) { 
	            throw new CasAuthenticationException("Unable to validate ticket [" + ticket + "]", e);
	        }
	}

	/****
	 * 授权方法
	 */
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		User user = (User) principals.fromRealm(getName()).iterator().next();
		if(user != null) {
			
			List<Role> roleList = this.accountService.findRoleListByUserId(user.getUserId(),Role.ROLE_STATE_NORMAL);
			if(!CollectionUtils.isEmpty(roleList)){
				List<String> roleNameList = new ArrayList<String>();
				Set<String> permissionList = new HashSet<String>();
				for (Role role : roleList) {
					roleNameList.add(role.getRoleName());
					List<Resource> resourceList = this.accountService.findResourceListByRoleId(role.getRoleId(),Resource.RESOURCE_STATE_NOARMAL,null);
					if(!org.springframework.util.CollectionUtils.isEmpty(resourceList)){
						
						for (Resource resource : resourceList) {
							System.err.println("permission "+ resource.getPermission());
							permissionList.add(resource.getPermission());
						}
					}
				}
				
				SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo(new HashSet<String>(roleNameList));
				authorizationInfo.setStringPermissions(permissionList);
				this.redisTemplate.opsForValue().set(RedisConstant.ROLE_AUTHORIZATION_LIST_KEY + user.getUserId(),JSON.toJSONString(roleNameList));
				if(!CollectionUtils.isEmpty(permissionList)) {
					this.redisTemplate.opsForValue().set(RedisConstant.RESOURCE_AUTHORIZATION_LIST_KEY + user.getUserId(),JSON.toJSONString(permissionList));
				}
				return authorizationInfo;
			}
			
		}
		
		return null;
	}
	

	
}
