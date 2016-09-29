package org.dongtian.sys.mapper;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.dongtian.sys.entity.Role;

/**
 * 
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年8月25日 下午7:44:00
 */
public interface RoleMapper {

	/***
	 * 
	 * @param userId
	 * @param roleState
	 * @return
	 */
	List<Role> findRoleListByUserId(@Param("userId")Integer userId,@Param("roleState")Integer roleState);

	List<Role> findRoleList(@Param("roleName")String roleName,@Param("startTime")Date startTime,@Param("endTime")Date endTime);

	int findRoleCount(@Param("roleName")String roleName,@Param("startTime")Date startTime,@Param("endTime")Date endTime);
	/***
	 * 新增角色
	 * @author gaoyuandong
	 * @param role
	 */
	void addRole(Role role);
	
	Role findRoleByRoleId(Integer roleId);

	/***
	 * 更新角色
	 * @author gaoyuandong
	 * @param role
	 */
	void updateRole(Role role);

	/***
	 * 删除角色
	 * @author gaoyuandong
	 * @param roleId
	 */
	void deleteRoleByRoleId(Integer roleId);

	/***
	 * 解除用户和角色的绑定关系
	 * @author gaoyuandong
	 * @date 2015年10月29日 下午1:26:23
	 * @param userId
	 */
	void deleteUserRoleByUserId(@Param("userId")Integer userId);

	/***
	 * 添加用户和角色的关联关系
	 * @author gaoyuandong
	 * @date 2015年10月29日 下午1:33:01
	 * @param userId
	 * @param roleIds
	 */
	void addUserRoles(@Param("userId")Integer userId, @Param("roleIds")List<Integer> roleIds);
	
	

}
