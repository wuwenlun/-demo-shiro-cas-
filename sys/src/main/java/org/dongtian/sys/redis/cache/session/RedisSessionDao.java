package org.dongtian.sys.redis.cache.session;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.util.Collection;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.TimeUnit;

import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.dongtian.sys.redis.cache.BytesRedisTemplate;
import org.dongtian.sys.util.SerializeUtil;

/**
 * redis session dao 
 * @author gaoyuandong
 * @mail   466862016@qq.com
 * @date 2015年11月5日 下午1:33:06
 */
public class RedisSessionDao  extends EnterpriseCacheSessionDAO

 {

	  protected static final long MILLIS_PER_SECOND = 1000;
	  protected static final long MILLIS_PER_MINUTE = 60 * MILLIS_PER_SECOND;
	  protected static final long MILLIS_PER_HOUR = 60 * MILLIS_PER_MINUTE;

    /**
     * Default main session timeout value, equal to {@code 30} minutes.
     */
	public static final long DEFAULT_GLOBAL_SESSION_TIMEOUT = 30 * MILLIS_PER_MINUTE;
	private  BytesRedisTemplate redisTemplate;
	private String keyPrefix;
	private long globalSessionTimeout = DEFAULT_GLOBAL_SESSION_TIMEOUT;

	public RedisSessionDao(BytesRedisTemplate redisTemplate, String keyPrefix, long globalSessionTimeout) {
		super();
		this.redisTemplate = redisTemplate;
		this.keyPrefix = keyPrefix;
		this.globalSessionTimeout = globalSessionTimeout;
	}

	public byte[] getKey(Object obj) {
		try {
			String o = keyPrefix + obj;
			return o.getBytes("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
		
	}
	
	
	@Override
	public void update(Session session) throws UnknownSessionException {
		this.storeSession(session);
	}

	@Override
	public void delete(Session session) {
		try {
			Boolean hasKey = this.redisTemplate.hasKey(this.getKey(session.getId()));
			if(hasKey) {
				this.redisTemplate.delete(this.getKey(session.getId()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Collection<Session> getActiveSessions() {
		
		Set<Session> sessions = new HashSet<Session>();
		Set<byte[]> keys = this.redisTemplate.keys(this.getKey("*"));
		if(keys != null && keys.size() > 0) {
			for (byte[] k : keys) {
				sessions.add((Session)SerializeUtil.unserialize(k));
			}
			
		}
		return sessions;
	}

	@Override
	protected Serializable doCreate(Session session) {
		 Serializable sessionId = generateSessionId(session);
	        assignSessionId(session, sessionId);
	        storeSession(session);
	        return sessionId;
	}

	private void storeSession(Session session) {
		
		try {
			if(session.getId() == null) return ;
			session.setTimeout(globalSessionTimeout);
			this.redisTemplate.opsForValue().set(this.getKey(session.getId()), SerializeUtil.serialize(session));
			this.redisTemplate.expire(this.getKey(session.getId()), globalSessionTimeout, TimeUnit.MILLISECONDS);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	protected Session doReadSession(Serializable sessionId) {
		
		byte[] res = this.redisTemplate.opsForValue().get(this.getKey(sessionId));
		if(res != null && res.length > 0) {
			return (Session) SerializeUtil.unserialize(res);
		}
		return null;
	}

	

}
