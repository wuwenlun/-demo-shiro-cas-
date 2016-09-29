package org.dongtian.sys.service;

import java.util.Date;
import java.util.List;

import org.dongtian.sys.entity.Role;

/**
 * 角色相关服务类
 * @author gaoyuandong
 * @mail   466862016@qq.com
 * @date 2015年10月20日 下午2:58:11
 */
public interface RoleService {

	/**
	 * 
	 * @param userId
	 * @param roleState
	 * @return
	 */
	List<Role> findRoleListByUserId(Integer userId, Integer roleState);
	/***
	 * 根据角色名称获取角色列表
	 * @author gaoyuandong
	 * @param roleName
	 * @return
	 */
	List<Role> findRoleList(String roleName,Date startTime,Date endTime);
	/***
	 * 获取总数
	 * @author gaoyuandong
	 * @date 2015年10月29日 下午1:24:56
	 * @param roleName
	 * @param startTime
	 * @param endTime
	 * @return
	 */
	int findRoleCount(String roleName,Date startTime,Date endTime);

	/***
	 * 新增角色
	 * @author gaoyuandong
	 * @param role
	 */
	void addRole(Role role);

	/***
	 * 根据角色id获取角色信息
	 * @author gaoyuandong
	 * @param roleId
	 * @return
	 */
	Role findRoleByRoleId(Integer roleId);
	/***
	 * 修改角色信息
	 * @author gaoyuandong
	 * @param role
	 */
	void updateRole(Role role);
	/***
	 * 删除用户
	 * @author gaoyuandong
	 * @param roleId
	 */
	void deleteRoleByRoleId(Integer roleId);
	/***
	 * 根据主键设置用户角色
	 * @author gaoyuandong
	 * @date 2015年10月29日 下午1:24:31
	 * @param userId
	 * @param roleIdStr
	 */
	void settingRole(Integer userId, String roleIdStr);

}
