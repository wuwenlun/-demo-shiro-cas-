package org.dongtian.sys.service;

import java.util.List;

import org.dongtian.sys.entity.Resource;
import org.dongtian.sys.entity.Role;
import org.dongtian.sys.entity.User;

/**
 * 
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年8月31日 下午1:52:17
 */
public interface AccountService {
	
	/***
	 * 根据用户名登录
	 * @param userName 用户名
	 * @return
	 */
	User login(String userName);
	/***
	 * 根据用户名查询角色集合
	 * @param userId
	 * @param roleState
	 * @return
	 */
	List<Role> findRoleListByUserId(Integer userId, Integer roleState);
	/***
	 * 
	 * @param roleId
	 * @param resourceStateDelete
	 * @return
	 */
	List<Resource> findResourceListByRoleId(Integer roleId, Integer resourceStateDelete,String systemType);

}
