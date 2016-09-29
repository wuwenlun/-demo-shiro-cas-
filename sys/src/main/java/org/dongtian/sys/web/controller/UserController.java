package org.dongtian.sys.web.controller;

import org.dongtian.sys.annotation.PermissionDescription;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user")
public class UserController {

	
	/**
	 * @return
	 */
	@RequestMapping("/add")
	@PermissionDescription(value="新增用户")
	public ModelAndView add() {
		

		ModelAndView modelAndView = new ModelAndView("admin/index");
		//ModelAndView modelAndView = new ModelAndView("admin/user/index");
		return modelAndView;
	}
	@RequestMapping("/index")
	@PermissionDescription(value="新增用户")
	public ModelAndView adminUserIndex() {
		ModelAndView modelAndView = new ModelAndView("admin/user/index");
		return modelAndView;
	}
}
