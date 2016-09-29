package org.dongtian.sys.service;

import java.util.List;

import org.dongtian.sys.entity.Menu;
import org.dongtian.sys.entity.Resource;

/**
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年9月6日 上午11:04:52
 */
public interface ResourceService {

	/**
	 * 
	 * @param roleId
	 * @param resourceState
	 * @return
	 */
	List<Resource> findResourceListByRoleId(Integer roleId, Integer resourceState,String systemType);

	/***
	 * 查询所有权限资源
	 * @author gaoyuandong
	 * @param state
	 * @return
	 */
	List<Resource> findResourceList(Integer state);
	/***
	 * 新增权限资源
	 * @author gaoyuandong
	 * @date 2015年10月26日 上午11:51:26
	 * @param resource
	 */
	void addResource(Resource resource);
	/***
	 * 根据主键获取权限资源
	 * @author gaoyuandong
	 * @date 2015年10月27日 下午2:05:57
	 * @param resourceId
	 * @return
	 */
	Resource findResourceListById(Integer resourceId);
	/***
	 * 修改权限资源
	 * @author gaoyuandong
	 * @date 2015年10月27日 下午2:08:40
	 * @param resource
	 */
	void updateResource(Resource resource);

	List<Resource> findResourceListByParentId(Integer id);

	void deleteResourceById(Integer id);
	
	/***
	 * 绑定角色与权限资源关联关系
	 * @author gaoyuandong
	 * @date 2015年10月29日 下午4:20:10
	 * @param roleId
	 * @param resourceIdStr
	 */
	void settingResource(Integer roleId, String resourceIdStr);

	List<Menu> findTopMenuByUserId(Integer userId, String code);
	/***
	 * 获取左侧菜单列表
	 * @author gaoyuandong
	 * @date 2015年11月9日 下午3:47:52
	 * @param resourceId
	 * @return
	 */
	List<Menu> findMenuListByParentId(Integer resourceId);

}
