package org.dongtian.sys.security.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.servlet.AdviceFilter;
import org.dongtian.sys.entity.User;

/***
 * 记住点击哪个菜单
 * @author gaoyuandong
 * @mail   466862016@qq.com
 * @date 2015年11月9日 下午2:55:34
 */
public class RememberMenuFilter extends AdviceFilter {

	private static Logger logger = Logger.getLogger(RememberMenuFilter.class);
	@Override
	protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
		logger.info("正在获取单击左侧菜单......");
		HttpServletRequest req = (HttpServletRequest) request;
		String menuId = req.getParameter("menuId");
		if(StringUtils.isNotBlank(menuId)) {
			logger.info("获取到了单击左侧菜单...");
			req.getSession().setAttribute("menuId",menuId);
		}
		
		Subject subject = SecurityUtils.getSubject();
		if(subject.getPrincipal() instanceof User) {
			User user = (User) subject.getPrincipal();
			req.getSession().setAttribute("menuList", user.getMenuList());
			
		}
		return true;
	}
}
