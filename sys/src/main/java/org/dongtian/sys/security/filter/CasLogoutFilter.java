package org.dongtian.sys.security.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.LogoutFilter;
import org.dongtian.sys.constant.RedisConstant;
import org.dongtian.sys.entity.User;
import org.springframework.data.redis.core.StringRedisTemplate;

/***
 * 单点注销登出过滤器
 * 清除用户授权信息集合
 * @author gaoyuandong
 * @mail   466862016@qq.com
 * @date 2015年11月4日 上午11:11:13
 */
public class CasLogoutFilter extends LogoutFilter {

	private StringRedisTemplate redisTemplate;
	public StringRedisTemplate getRedisTemplate() {
		return redisTemplate;
	}



	public void setRedisTemplate(StringRedisTemplate redisTemplate) {
		this.redisTemplate = redisTemplate;
	}



	@Override
	protected boolean preHandle(ServletRequest request, ServletResponse response) throws Exception {
		
		  Subject subject = getSubject(request, response);
//		  if(subject != null) {
//			  User user = (User) subject.getPrincipal();
//			  redisTemplate.delete(RedisConstant.ROLE_AUTHORIZATION_LIST_KEY + user.getUserId());
//			  redisTemplate.delete(RedisConstant.RESOURCE_AUTHORIZATION_LIST_KEY + user.getUserId());
//		  }
		return super.preHandle(request, response);
	}
}
