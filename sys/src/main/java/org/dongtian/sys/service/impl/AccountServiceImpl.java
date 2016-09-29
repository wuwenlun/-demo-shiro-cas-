package org.dongtian.sys.service.impl;

import java.util.List;

import org.dongtian.sys.entity.Resource;
import org.dongtian.sys.entity.Role;
import org.dongtian.sys.entity.User;
import org.dongtian.sys.mapper.UserMapper;
import org.dongtian.sys.service.AccountService;
import org.dongtian.sys.service.ResourceService;
import org.dongtian.sys.service.RoleService;
import org.dongtian.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * 用户账户服务类
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年8月31日 下午1:52:56
 */
@Service
@Transactional
public class AccountServiceImpl implements AccountService {
	
	@Autowired
	private UserService userService;
	@Autowired
	private RoleService roleService;
	@Autowired
	private ResourceService resourceService;
	
	public User login(String userName) {
		
		return userService.login(userName);
	}
	public List<Role> findRoleListByUserId(Integer userId, Integer roleStateNormal) {
		return this.roleService.findRoleListByUserId(userId, roleStateNormal);
	}
	public List<Resource> findResourceListByRoleId(Integer roleId, Integer resourceState,String systemType) {
		return this.resourceService.findResourceListByRoleId(roleId,resourceState,systemType);
	}

}
