package org.dongtian.sys.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.dongtian.sys.entity.Menu;
import org.dongtian.sys.entity.Resource;

/**
 * 
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年8月25日 下午7:44:00
 */
public interface ResourceMapper {

	/**
	 * 
	 * @param roleId
	 * @param resourceState
	 * @return
	 */
	List<Resource> findResourceListByRoleId(@Param("roleId")Integer roleId, @Param("resourceState")Integer resourceState,@Param("systemType")String systemType);

	/***
	 * 获取所有权限资源
	 * @author gaoyuandong
	 * @param state
	 * @return
	 */
	List<Resource> findResourceList(@Param("state")Integer state);

	/***
	 * 新增权限资源
	 * @author gaoyuandong
	 * @date 2015年10月26日 上午11:51:55
	 * @param resource
	 */
	void addResource(Resource resource);

	/***
	 * 根据权限资源id获取权限资源
	 * @author gaoyuandong
	 * @date 2015年10月27日 下午2:06:32
	 * @param resourceId
	 * @return
	 */
	Resource findResourceListById(Integer resourceId);

	void updateResource(Resource resource);

	List<Resource> findResourceListByParentId(Integer id);

	void deleteResourceById(Integer id);
	/***
	 * 删除角色与权限资源的关联关系
	 * @author gaoyuandong
	 * @date 2015年10月29日 下午4:21:30
	 * @param roleId
	 */
	void deleteRoleResourceByRoleId(Integer roleId);
	/****
	 * 绑定角色与权限资源关联关系
	 * @author gaoyuandong
	 * @date 2015年10月29日 下午4:26:11
	 * @param roleId
	 * @param resourceIdList
	 */
	void addRoleResource(@Param("roleId")Integer roleId, @Param("resourceIdList")List<Integer> resourceIdList);
	
	public List<Menu> findTopMenuListByUserId(@Param("userId")Integer userId,@Param("code")String code);
	/***
	 * 
	 * @author gaoyuandong
	 * @date 2015年11月9日 下午3:48:49
	 * @param resourceId
	 * @return
	 */
	List<Menu> findMenuListByParentId(Integer resourceId);

}
