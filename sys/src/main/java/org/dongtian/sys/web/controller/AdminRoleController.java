package org.dongtian.sys.web.controller;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.dongtian.sys.annotation.DateParser;
import org.dongtian.sys.entity.Role;
import org.dongtian.sys.entity.User;
import org.dongtian.sys.service.RoleService;
import org.dongtian.sys.service.UserService;
import org.dongtian.sys.util.JsonResult;
import org.dongtian.sys.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;

/***
 * 
 * @author gaoyuandong
 * @mail   466862016@qq.com
 * @date 2015年10月19日 下午1:52:43
 */
@Controller
@RequestMapping("/admin/role")
public class AdminRoleController {

	private static  Logger logger = Logger.getLogger(AdminRoleController.class);
	
	@Autowired
	private RoleService roleService;
	@Autowired
	private UserService userService;
	
	
	/***
	 * 角色首页列表
	 * @param startTime
	 * @param endTime
	 * @param role
	 * @param pageNum
	 * @param pageSize
	 * @return
	 */
	@RequestMapping("/index")
	@RequiresPermissions("admin:role:index")
	public ModelAndView index(String roleName,@DateParser(pattern="yyyy-MM-dd hh:mm:ss")Date startTime,@DateParser(pattern="yyyy-MM-dd hh:mm:ss")Date endTime,Role role, @RequestParam(defaultValue="1")Integer pageNum,@RequestParam(defaultValue="5")Integer pageSize) {
		ModelAndView andView = new ModelAndView("admin/role/index");
		Page<Role> page = new Page<Role>(pageNum,pageSize);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		List<Role> roleList = this.roleService.findRoleList(role.getRoleName(),startTime,endTime);
		int  roleCount = this.roleService.findRoleCount(role.getRoleName(),startTime,endTime);
		page.setTotalCount(roleCount);
		page.setList(roleList);
		System.err.println("======="+roleName);
		andView.addObject("page", page);
		return andView;
	}
	
	/***
	 * 新增角色
	 * @author gaoyuandong
	 * @return
	 */
	@RequestMapping(value="/addRole",method = RequestMethod.POST)
	@ResponseBody
	@RequiresPermissions("admin:role:addRole")
	public JsonResult addRole(Role role) {
		JsonResult jsonResult = new JsonResult();
		
		try {
			if(role == null || StringUtils.isBlank( role.getDescription())) {
				jsonResult.setMessage("角色名称不能为空!");
			} else if(role.getState() == null) {
				jsonResult.setMessage("角色状态不能为空!");
			} else {
				
				this.roleService.addRole(role);
				jsonResult.setSuccess(true);
				jsonResult.setMessage("操作成功!");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("新增角色出现异常" +e);
		}
		return jsonResult;
	}
	/***
	 * 更新角色信息
	 * @author gaoyuandong
	 * @param role
	 * @return
	 */
	@RequestMapping(value="/updateRole",method = RequestMethod.POST)
	@ResponseBody
	@RequiresPermissions("admin:role:editRole")
	public JsonResult updateRole(Role role) {
		JsonResult jsonResult = new JsonResult();
		
		try {
			if(role == null || StringUtils.isBlank( role.getDescription())) {
				jsonResult.setMessage("角色名称不能为空!");
			} else if(role.getState() == null) {
				jsonResult.setMessage("角色状态不能为空!");
			} else {
				
				this.roleService.updateRole(role);
				jsonResult.setSuccess(true);
				jsonResult.setMessage("操作成功!");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.info("修改角色出现异常" +e);
		}
		return jsonResult;
	}
	
	/***
	 * 根据角色id获取角色信息
	 * @author gaoyuandong
	 * @param roleId
	 * @return
	 */
	@RequestMapping("/findRoleByRoleId")
	@ResponseBody
	public JsonResult findRoleByRoleId(Integer roleId) {
		
		JsonResult jsonResult  = new JsonResult();
		try {
			if(roleId == null) {
				jsonResult.setMessage("此角色不存在!");
			} else {
				
				Role role = this.roleService.findRoleByRoleId(roleId);
				if(role != null) {
					jsonResult.setMessage("获取成功!");
					jsonResult.setSuccess(true);
					jsonResult.setResult(role);
				} else {
					jsonResult.setMessage("此角色不存在!");
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonResult;
		
	}
	
	/***
	 * 删除角色
	 * @author gaoyuandong
	 * @param roleId
	 * @return
	 */
	@RequestMapping("/deleteRoleByRoleId")
	@ResponseBody
	@RequiresPermissions("admin:role:deleteRole")
	public JsonResult deleteRoleByRoleId(Integer roleId) {
		
		JsonResult jsonResult  = new JsonResult();
		try {
			if(roleId == null) {
				jsonResult.setMessage("此角色不存在!");
			} else {
				
				Role role = this.roleService.findRoleByRoleId(roleId);
				if(role != null) {
					
					this.roleService.deleteRoleByRoleId(roleId);
					jsonResult.setMessage("操作成功!");
					jsonResult.setSuccess(true);
					jsonResult.setResult(role);
				} else {
					jsonResult.setMessage("此角色不存在!");
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.setMessage("操作失败,请重试!");
		}
		return jsonResult;
		
	}
	@RequestMapping("/settingRole")
	@ResponseBody
	@RequiresPermissions("admin:user:settingRole")
	public JsonResult settingRole(Integer userId,String roleIdStr) {
		
		JsonResult jsonResult  = new JsonResult();
		try {
			if(userId == null) {
				jsonResult.setMessage("此用户不存在!");
			} else {
				
				User user = this.userService.findUserByUserId(userId);
				if(user != null) {
					this.roleService.settingRole(userId,roleIdStr);
					jsonResult.setMessage("设置成功!");
					jsonResult.setSuccess(true);
				} else {
					jsonResult.setMessage("此用户不存在!");
				}
				
			}
			
		} catch (Exception e) {
			jsonResult.setMessage("设置失败,请重试!");
			e.printStackTrace();
		}
		return jsonResult;
		
	}
	
	
	/***
	 * 根据用户id查询所拥有的角色集合
	 * @author gaoyuandong
	 * @date 2015年10月29日 上午10:51:45
	 * @return
	 */
	@RequestMapping("/findRoleListByUserId")
	@ResponseBody
	public JsonResult findRoleListByUserId(Integer userId) {
		
		JsonResult jsonResult = new JsonResult();
		try {
			if(userId == null) {
				jsonResult.setMessage("当前用户不存在!");
			} else {
				List<Role> roles = this.roleService.findRoleListByUserId(userId, null);
				List<Role> roleList = this.roleService.findRoleList(null, null, null);
				roleList = this.roleListHandler(roles,roleList);
				jsonResult.setSuccess(true);
				jsonResult.setResult(roleList);
				jsonResult.setMessage("获取成功!");
			}
		} catch (Exception e) {
			jsonResult.setMessage("获取角色列表失败,请重试!");
			e.printStackTrace();
		}
		return jsonResult;
		
	}

	/***
	 * 设置角色选中
	 * @author gaoyuandong
	 * @date 2015年10月29日 上午11:10:01
	 * @param roles
	 * @param roleList
	 * @return
	 */
	private List<Role> roleListHandler(List<Role> roles, List<Role> roleList) {
		
		if(!CollectionUtils.isEmpty(roleList) && !CollectionUtils.isEmpty(roles)){
			
			
			for (Role role : roleList) {
				
				for (Role r : roles) {
					
					if(r.getRoleId() == role.getRoleId()||r.getRoleId().equals(role.getRoleId())) {
						role.setChecked(true);
						break;
					}
					
				}
			}
			
		} 
		return roleList;
	}
	
	
}
