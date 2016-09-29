package org.dongtian.sys.web.controller;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.dongtian.sys.entity.Resource;
import org.dongtian.sys.entity.Role;
import org.dongtian.sys.service.ResourceService;
import org.dongtian.sys.service.RoleService;
import org.dongtian.sys.util.JsonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * 权限资源管理
 * @author gaoyuandong
 * @mail   466862016@qq.com
 * @date 2015年10月22日 上午10:59:25
 */
@Controller
@RequestMapping("/admin/resource")
public class AdminResourceController {

	@Autowired
	private ResourceService resourceService;
	
	@Autowired
	private RoleService roleService;
	
	/***
	 * 进入权限资源管理后台
	 * @author gaoyuandong
	 * @return
	 */
	@RequestMapping("index")
	@RequiresPermissions("admin:resource:index")
	public ModelAndView index() {
		
		ModelAndView andView = new ModelAndView("admin/resource/index");
		return  andView;
	}
	
	/***
	 * 获取所有权限资源
	 * @author gaoyuandong
	 * @return
	 */
	@RequestMapping("/findAllResource")
	@ResponseBody
	@RequiresPermissions("admin:resource:index")
	public JsonResult findAllResource(){
		JsonResult jsonResult = new JsonResult();
		
		try {
			List<Resource> resourceList = this.resourceService.findResourceList(null);
			jsonResult.setResult(resourceList);
			jsonResult.setSuccess(true);
			jsonResult.setMessage("获取成功!");
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.setMessage("获取失败,请刷新重试!");
		}
		return jsonResult;
	}
	
	/***
	 * 添加权限资源
	 * @author gaoyuandong
	 * @date 2015年10月26日 上午11:46:50
	 * @param resource
	 * @return
	 */
	@RequestMapping("/addResource")
	@ResponseBody
	@RequiresPermissions("admin:resource:addResource")
	public JsonResult addResource(Resource resource) {
		
		JsonResult jsonResult = new JsonResult();
		try {
			if(resource == null ) {
				jsonResult.setMessage("权限资源不能为空!");
			} else if(StringUtils.isBlank(resource.getResourceName())) {
				jsonResult.setMessage("权限资源名称不能为空!");
			} else if(StringUtils.isBlank(resource.getPermission())) {
				jsonResult.setMessage("权限码不能为空!");
			} else if(StringUtils.isBlank(resource.getSysType())) {
				jsonResult.setMessage("所属系统不能为空!");
			} else {
				if(resource.getType() == null) {
					resource.setType(0);
				}
				this.resourceService.addResource(resource);
				jsonResult.setMessage("添加成功!");
				jsonResult.setSuccess(true);
			}
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.setMessage("操作出现异常,请重试!");
		}
		return jsonResult;
	}
	@RequestMapping("/updateResource")
	@ResponseBody
	@RequiresPermissions("admin:resource:editResource")
	public JsonResult updateResource(Resource resource) {
		
		JsonResult jsonResult = new JsonResult();
		try {
			if(resource == null ) {
				jsonResult.setMessage("权限资源不能为空!");
			} else if(StringUtils.isBlank(resource.getResourceName())) {
				jsonResult.setMessage("权限资源名称不能为空!");
			} else if(StringUtils.isBlank(resource.getPermission())) {
				jsonResult.setMessage("权限码不能为空!");
			} else if(StringUtils.isBlank(resource.getSysType())) {
				jsonResult.setMessage("所属系统不能为空!");
			} else if(resource.getResourceId() == null){
				jsonResult.setMessage("当前权限资源不存在");
			}else {
				Resource res = resourceService.findResourceListById(resource.getResourceId());
				if(res == null) {
					jsonResult.setMessage("当前权限资源不存在!");
				} else {
					
					// this.resourceService.updateResource(resource);
					List<Resource> childrenResourceList = this.resourceService.findResourceListByParentId(resource.getResourceId());
					this.updateChildren(resource,childrenResourceList,resource.getSysType());
					jsonResult.setMessage("修改成功!");
					jsonResult.setSuccess(true);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.setMessage("操作出现异常,请重试!");
		}
		return jsonResult;
	}
	
	
	/***
	 * 递归更新
	 * @author gaoyuandong
	 * @date 2015年10月28日 下午3:24:56
	 * @param res
	 * @param childrenResourceList
	 * @param sysType
	 */
	private void updateChildren(Resource res, List<Resource> childrenResourceList,String sysType) {
		
		if(!CollectionUtils.isEmpty(childrenResourceList)) {
			for (Resource resource : childrenResourceList) {
				
				this.updateChildren(resource, this.resourceService.findResourceListByParentId(resource.getResourceId()),sysType);
			}
		}
		
		res.setSysType(sysType);
		this.resourceService.updateResource(res);
		
	}

	/***
	 * 级联删除
	 * @author gaoyuandong
	 * @date 2015年10月28日 下午2:12:19
	 * @param id
	 * @return
	 */
	@RequestMapping("/findResourceByRoleId")
	@ResponseBody
	
	public JsonResult findResourceByRoleId(Integer roleId) {
		
		JsonResult jsonResult = new JsonResult();
		try {
			
			if(roleId == null) {
				jsonResult.setMessage("此角色不存在!");
			} else {
				List<Resource> resources = this.resourceService.findResourceListByRoleId(roleId, null,null);
				List<Resource> resourceList = this.resourceService.findResourceList(null);
				resourceList = this.ResourceHandler(resourceList,resources);
				jsonResult.setResult(resourceList);
				jsonResult.setSuccess(true);
				jsonResult.setMessage("获取权限资源列表成功!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.setMessage("获取权限列表失败,请重试!");
		}
		return jsonResult;
	}
	@RequestMapping("/settingResourceByRoleId")
	@ResponseBody
	@RequiresPermissions("admin:role:settingResource")
	public JsonResult settingResourceByRoleId(Integer roleId,String resourceIdStr) {
		
		JsonResult jsonResult = new JsonResult();
		try {
			
			if(roleId == null) {
				jsonResult.setMessage("此角色不存在!");
			} else {
				
				Role role = roleService.findRoleByRoleId(roleId);
				if(role == null) {
					jsonResult.setMessage("此角色不存在!");
				} else {
					this.resourceService.settingResource(roleId,resourceIdStr);
					jsonResult.setSuccess(true);
					jsonResult.setMessage("设置成功!");
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.setMessage("获取权限列表失败,请重试!");
		}
		return jsonResult;
	}
	/***
	 * 处理权限资源默认勾选操作
	 * @author gaoyuandong
	 * @date 2015年10月29日 下午3:33:25
	 * @param resourceList
	 * @param resources
	 * @return
	 */
	private List<Resource> ResourceHandler(List<Resource> resourceList, List<Resource> resources) {
		
		if(!CollectionUtils.isEmpty(resources) && !CollectionUtils.isEmpty(resourceList)) {
			
			for (Resource resource : resourceList) {
				
				for (Resource r : resources) {
					
					
					if(resource.getResourceId() == r.getResourceId() || resource.getResourceId().equals(r.getResourceId())) {
						resource.setChecked(true);
						break;
					}
				}
			}
			
		}
		return resourceList;
	}

	/***
	 * 级联删除
	 * @author gaoyuandong
	 * @date 2015年10月28日 下午2:12:19
	 * @param id
	 * @return
	 */
	@RequestMapping("/deleteResourceById")
	@ResponseBody
	@RequiresPermissions("admin:resource:deleteResource")
	public JsonResult deleteResourceById(Integer id) {
		
		JsonResult jsonResult = new JsonResult();
		try {
			
			if(id == null) {
				jsonResult.setMessage("此权限资源不存在!");
			} else {
				List<Resource> resources = this.resourceService.findResourceListByParentId(id);
				this.deleteResource(id, resources);
				jsonResult.setSuccess(true);
				jsonResult.setMessage("操作成功!");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.setMessage("操作失败,请重试!");
		}
		return jsonResult;
	}

	private void deleteResource(Integer parentId,List<Resource> reList) {
		
		if(!CollectionUtils.isEmpty(reList)) {
			for (Resource resource : reList) {
				List<Resource> resourceList = this.resourceService.findResourceListByParentId(resource.getResourceId());
				this.deleteResource(resource.getResourceId(), resourceList);
			}
		}
			this.resourceService.deleteResourceById(parentId);
		
	}
	
	
}
