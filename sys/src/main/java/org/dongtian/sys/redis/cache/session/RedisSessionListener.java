package org.dongtian.sys.redis.cache.session;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListener;

/***
 * session 监听器
 * @author gaoyuandong
 * @mail   466862016@qq.com
 * @date 2015年11月5日 下午12:49:53
 */
public class RedisSessionListener implements SessionListener {

	@Override
	public void onStart(Session session) {
		// TODO Auto-generated method stub

	}

	@Override
	public void onStop(Session session) {

	}

	@Override
	public void onExpiration(Session session) {

	}

}
