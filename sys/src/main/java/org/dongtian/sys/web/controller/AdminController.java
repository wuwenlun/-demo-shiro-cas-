package org.dongtian.sys.web.controller;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.dongtian.sys.entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/***
 * 
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年11月22日 上午11:55:35
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

	/***
	 * 后台管理首页
	 * @author gaoyuandong
	 * @mailto 466862016@qq.com
	 * @date   2015年11月22日 上午11:57:30
	 * @return
	 */
	@RequestMapping("/index")
	@RequiresPermissions(value={"admin:index"})
	public ModelAndView index() {
		ModelAndView andView = new ModelAndView("admin/index");
		User user = (User) SecurityUtils.getSubject().getPrincipal();
		SecurityUtils.getSubject().getSession().setAttribute("menuList", user.getMenuList());
		return andView;
	}
}
