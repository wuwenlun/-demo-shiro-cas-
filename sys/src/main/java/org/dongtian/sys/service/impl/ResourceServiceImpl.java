package org.dongtian.sys.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.dongtian.sys.entity.Menu;
import org.dongtian.sys.entity.Resource;
import org.dongtian.sys.mapper.ResourceMapper;
import org.dongtian.sys.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年9月6日 上午11:05:17
 */
@Service
@Transactional
public class ResourceServiceImpl implements ResourceService {

	@Autowired
	private ResourceMapper resourceMapper;
	
	public List<Resource> findResourceListByRoleId(Integer roleId, Integer resourceState,String systemType) {
		return this.resourceMapper.findResourceListByRoleId(roleId, resourceState,systemType);
	}

	public List<Resource> findResourceList(Integer state) {
		return this.resourceMapper.findResourceList(state);
	}

	public void addResource(Resource resource) {
		this.resourceMapper.addResource(resource);
	}

	public Resource findResourceListById(Integer resourceId) {
		return this.resourceMapper.findResourceListById(resourceId);
	}

	public void updateResource(Resource resource) {
		this.resourceMapper.updateResource(resource);
	}

	public List<Resource> findResourceListByParentId(Integer id) {
		return this.resourceMapper.findResourceListByParentId(id);
	}

	public void deleteResourceById(Integer id) {
		this.resourceMapper.deleteResourceById(id);
	}

	public void settingResource(Integer roleId, String resourceIdStr) {
		
		//删除角色与权限资源关联关系
		this.resourceMapper.deleteRoleResourceByRoleId(roleId);
		if(StringUtils.isBlank(resourceIdStr)) {
			return ;
		}
		
		String[] resourceIds = resourceIdStr.split(",");
		
		if(resourceIds == null || resourceIds.length == 0) {
			return ;
		}
		
		List<Integer> resourceIdList = new ArrayList<Integer>();
		for (int i = 0; i < resourceIds.length; i++) {
			
			resourceIdList.add(Integer.valueOf(resourceIds[i]));
		}
		
		//重新绑定角色与权限资源关联关系
		this.resourceMapper.addRoleResource(roleId,resourceIdList);
		
	}

	@Override
	public List<Menu> findTopMenuByUserId(Integer userId, String code) {
		// TODO Auto-generated method stub
		return this.resourceMapper.findTopMenuListByUserId(userId,code);
	}

	@Override
	public List<Menu> findMenuListByParentId(Integer resourceId) {
		return this.resourceMapper.findMenuListByParentId(resourceId);
	}

}
