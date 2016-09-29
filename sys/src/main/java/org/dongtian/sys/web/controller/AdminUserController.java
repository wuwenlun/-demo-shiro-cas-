package org.dongtian.sys.web.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.dongtian.sys.annotation.DateParser;
import org.dongtian.sys.entity.User;
import org.dongtian.sys.service.UserService;
import org.dongtian.sys.util.JsonResult;
import org.dongtian.sys.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;

/**
 * 用户管理
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年9月6日 下午2:18:38
 */
@Controller
@RequestMapping("/admin/user")
public class AdminUserController {
	
	@Autowired
	private UserService userService;
	
	/**
	 * 
	 * @return
	 */
	@RequiresPermissions("admin:user:index")
	@RequestMapping("/index")
	public ModelAndView index( @DateParser(pattern="yyyy-MM-dd hh:mm:ss")Date startTime,@DateParser(pattern="yyyy-MM-dd hh:mm:ss")Date endTime,User user, @RequestParam(defaultValue="1")Integer pageNum,@RequestParam(defaultValue="1")Integer pageSize,HttpServletRequest request) {
		ModelAndView andView = new ModelAndView("admin/user/index");
		System.err.println(user.getCreateTime());
		Page<User> page = new Page<User>(pageNum,pageSize);
		PageHelper.startPage(page.getPageNum(), page.getPageSize());
		List<User> userList = this.userService.findUserList(user.getUserName(),user.getNickName(),user.getEmail(),user.getMobile(),startTime,endTime);
		int  userCount = this.userService.findUserCount(user.getUserName(),user.getNickName(),user.getEmail(),user.getMobile(),startTime,endTime);
		page.setTotalCount(userCount);
		page.setList(userList);
		andView.addObject("page", page);
		andView.addObject("user", user);
		andView.addObject("startTime", startTime);
		andView.addObject("endTime", endTime);
		return andView;
	}
	
	
	/***
	 * 检查用户名是否存在
	 * @author gaoyuandong
	 * @date   2015年9月16日 下午4:30:03
	 * @param userName
	 * @param userId
	 * @return
	 */
	@RequestMapping("/checkUserName")
	@ResponseBody
	public boolean checkUserName(String userName,Integer userId) {
		
	
		return  this.userService.checkUserName(userName, userId);
		
		
	}
	/***
	 * 
	 * @author gaoyuandong
	 * @date   2015年9月16日 下午5:18:01
	 * @param nickName
	 * @param userId
	 * @return
	 */
	@RequestMapping("/checkNickName")
	@ResponseBody
	public boolean checkNickName(String nickName,Integer userId) {
		
		
		return  this.userService.checkNickName(nickName, userId);
		
		
	}
	
	/***
	 * 检查邮箱
	 * @author gaoyuandong
	 * @date   2015年9月16日 下午5:18:58
	 * @param email
	 * @param userId
	 * @return
	 */
	@RequestMapping("/checkEmail")
	@ResponseBody
	public boolean checkEmail(String email,Integer userId) {
		return this.userService.checkEmail(email, userId);
	}
	/***
	 * 检查手机
	 * @author gaoyuandong
	 * @date   2015年9月16日 下午5:19:09
	 * @param mobile
	 * @param userId
	 * @return
	 */
	@RequestMapping("/checkMobile")
	@ResponseBody
	public boolean checkMobile(String mobile,Integer userId) {
		return this.userService.checkMobile(mobile, userId);
	}
	/***
	 * 新增用户
	 * @author gaoyuandong
	 * @date   2015年9月17日 下午10:10:23
	 * @param user
	 * @return
	 */
	@RequestMapping("/addUser")
	@ResponseBody
	@RequiresPermissions("admin:user:addUser")
	public JsonResult addUser(User user) {
		
		JsonResult jsonResult = new JsonResult();
		try {
			if(StringUtils.isBlank(user.getUserName())) {
				jsonResult.setMessage("用户名不能为空!");
				return jsonResult;
			}
			if(StringUtils.isBlank(user.getNickName())) {
				jsonResult.setMessage("昵称不能为空!");
				return jsonResult;
			}
			if(StringUtils.isBlank(user.getEmail())) {
				jsonResult.setMessage("邮箱不能为空!");
				return jsonResult;
			}
			if(StringUtils.isBlank(user.getMobile())) {
				jsonResult.setMessage("手机号码不能为空!");
				return jsonResult;
			}
			
			this.userService.addUser(user);
			jsonResult.setSuccess(true);
			jsonResult.setMessage("添加成功!");
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.setErrorType(-1);
			jsonResult.setMessage("添加失败，请重试!");
		}
		return jsonResult;
		
	}
	/***
	 * 更新用户
	 * @author gaoyuandong
	 * @date   2015年9月17日 下午10:10:13
	 * @param user
	 * @return
	 */
	@RequestMapping("/updateUser")
	@ResponseBody
	@RequiresPermissions("admin:user:editUser")
	public JsonResult updateUser(User user) {
		
		JsonResult jsonResult = new JsonResult();
		try {
			
			if(user == null || user.getUserId() == null) {
				
				jsonResult.setMessage("当前用户不存在!");
				return jsonResult;
			}
			if(StringUtils.isBlank(user.getUserName())) {
				
				jsonResult.setMessage("用户名不能为空!");
				return jsonResult;
			}
			if(StringUtils.isBlank(user.getNickName())) {
				jsonResult.setMessage("昵称不能为空!");
				return jsonResult;
			}
			if(StringUtils.isBlank(user.getEmail())) {
				jsonResult.setMessage("邮箱不能为空!");
				return jsonResult;
			}
			if(StringUtils.isBlank(user.getMobile())) {
				jsonResult.setMessage("手机号码不能为空!");
				return jsonResult;
			}
			this.userService.updateUser(user);
			jsonResult.setSuccess(true);
			jsonResult.setMessage("修改成功!");
		} catch (Exception e) {
			e.printStackTrace();
			jsonResult.setErrorType(-1);
			jsonResult.setMessage("添加失败，请重试!");
		}
		return jsonResult;
		
	}
	/***
	 * 根据用户id查询用户信息
	 * @author gaoyuandong
	 * @date   2015年9月17日 下午1:29:40
	 * @return
	 */
	@RequestMapping("/findUserByUserId")
	@ResponseBody
	public JsonResult findUserByUserId(Integer userId) {
		
		JsonResult jsonResult = new JsonResult();
		try {
			User user = this.userService.findUserByUserId(userId);
			if(user == null) {
				jsonResult.setErrorType(-1);
				jsonResult.setSuccess(false);
				jsonResult.setMessage("当前用户不存在!");
			} else {
				jsonResult.setResult(user);
				jsonResult.setSuccess(true);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			jsonResult.setErrorType(-2);
			jsonResult.setMessage("发生错误，请重试!");
			
		}
		return jsonResult;
	}
	
	@RequestMapping("/deleteUserByUserId")
	@ResponseBody
	@RequiresPermissions("admin:user:deleteUser")
	public JsonResult deleteUserByUserId(Integer userId) {
		JsonResult jsonResult = new JsonResult();
		try {
			
			if(userId == null) {
				jsonResult.setMessage("此用户不存在!");
				return jsonResult;
			}
			this.userService.deleteUserByUserId(userId);
		jsonResult.setSuccess(true);
		jsonResult.setMessage("操作成功!");
		} catch (Exception e) {
			jsonResult.setMessage("操作失败，请重试!");
			e.printStackTrace();
		}
		
		return jsonResult;
	}
	
}
