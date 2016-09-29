package org.dongtian.sys.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.dongtian.sys.entity.Role;
import org.dongtian.sys.mapper.RoleMapper;
import org.dongtian.sys.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年8月31日 下午2:57:42
 */
@Service
@Transactional
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;
	
	public List<Role> findRoleListByUserId(Integer userId, Integer roleState) {
		return this.roleMapper.findRoleListByUserId(userId, roleState);
	}
	public List<Role> findRoleList(String roleName,Date startTime,Date endTime) {
		return this.roleMapper.findRoleList(roleName,startTime,endTime);
	}
	public int findRoleCount(String roleName,Date startTime,Date endTime) {
		return this.roleMapper.findRoleCount(roleName,startTime,endTime);
	}
	public void addRole(Role role) {
		this.roleMapper.addRole(role);
	}
	public Role findRoleByRoleId(Integer roleId) {
		return this.roleMapper.findRoleByRoleId(roleId);
	}
	public void updateRole(Role role) {
		this.roleMapper.updateRole(role);
	}
	public void deleteRoleByRoleId(Integer roleId) {
		
		this.roleMapper.deleteRoleByRoleId(roleId);
	}
	
	public void settingRole(Integer userId, String roleIdStr) {
		
		//解除用户和角色的关联关系
		this.roleMapper.deleteUserRoleByUserId(userId);
		
		//重新添加用户和角色的关联关系
		
		if(StringUtils.isBlank(roleIdStr)) {
			return ;
		}  
		String[] roleIdList =roleIdStr.split(",");
		if(roleIdList == null || roleIdList.length == 0) {
			return ;
		} else {
			
			List<Integer> roleIds = new ArrayList<Integer>();
			
			for (int i = 0; i < roleIdList.length; i++) {
				roleIds.add(Integer.valueOf(roleIdList[i]));
			}
			
			this.roleMapper.addUserRoles(userId,roleIds);
			
		}
		
		
		
	}

}
