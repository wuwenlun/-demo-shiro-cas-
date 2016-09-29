package org.dongtian.sys.security.realm;

import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.CollectionUtils;
import org.dongtian.sys.entity.Resource;
import org.dongtian.sys.entity.Role;
import org.dongtian.sys.entity.User;
import org.dongtian.sys.exception.PasswordNotFoundException;
import org.dongtian.sys.exception.PasswordNullException;
import org.dongtian.sys.exception.UserNameNullException;
import org.dongtian.sys.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/***
 * 数据库认证与授权服务类
 * @see 
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年8月20日 上午9:19:25
 */
@Service
@Deprecated
public class DatabaseAuthorizingRealm extends AuthorizingRealm {

	@Autowired
	private AccountService accountService;
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		
		User user = (User) principals.fromRealm(getName()).iterator().next();
		if(user != null) {
			List<Role> roleList = this.accountService.findRoleListByUserId(user.getUserId(),Role.ROLE_STATE_NORMAL);
			if(!CollectionUtils.isEmpty(roleList)){
				for (Role role : roleList) {
					
					List<Resource> resourceList = this.accountService.findResourceListByRoleId(role.getRoleId(),Resource.RESOURCE_STATE_DELETE,Resource.SYSTEM_TYPE_CORE);
				}
			}
		}
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		UsernamePasswordToken t =  (UsernamePasswordToken) token;
		String userName = t.getUsername();
		
		if(StringUtils.isBlank(userName)) {
			throw new UserNameNullException("用户名不能为空!");
		} 
		if(t.getPassword() == null) {
			throw new PasswordNullException("密码不能为空!");
		}
		String pwd = new String(t.getPassword());
		User user = accountService.login(userName);
		if(user == null) {
			throw new UnknownAccountException("用户名 "+userName +"密码" + pwd + "不存在 ！");
		} else if(user.getState() == 1) {
			throw new LockedAccountException("用户名 "+userName +"密码" + pwd + "已被锁定！");
		} else if(!StringUtils.equals(user.getPassword(), pwd)) {
			
			throw new PasswordNotFoundException("密码 " + pwd +"错误 ");
			
		}else if(StringUtils.equals(user.getPassword(), pwd)) {
			SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(user, null, "databaseRealm");
			return authenticationInfo;
		}
		return null;
	}

}
