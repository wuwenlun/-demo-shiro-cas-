package org.dongtian.sys.redis.cache;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

import org.apache.log4j.Logger;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.cache.CacheManager;

public class RedisCacheManager implements CacheManager {

	
	private static Logger logger = Logger.getLogger(RedisCacheManager.class);
	
	private BytesRedisTemplate bytesRedisTemplate;
	
	private final ConcurrentMap<String, Cache> caches = new ConcurrentHashMap<String, Cache>();
	private String keyPrefix;
	
	
	public RedisCacheManager() {
		
		System.err.println("cacheManager init......");
	}


	public String getKeyPrefix() {
		return keyPrefix;
	}


	public void setKeyPrefix(String keyPrefix) {
		this.keyPrefix = keyPrefix;
	}

	
	public BytesRedisTemplate getBytesRedisTemplate() {
		return bytesRedisTemplate;
	}


	public void setBytesRedisTemplate(BytesRedisTemplate bytesRedisTemplate) {
		this.bytesRedisTemplate = bytesRedisTemplate;
	}


	public <K, V> Cache<K, V> getCache(String name) throws CacheException {
		
		logger.info("=====进入cache===== name = " + name);
		Cache<K, V> cache = caches.get(name);
		logger.info("=====cache=====" +cache);
		if(cache == null) {
			cache = new  RedisCache<K, V>(bytesRedisTemplate,this.keyPrefix);
			logger.info("=====获取新的cache=====" +cache);
		}
		return cache;
	}

}
