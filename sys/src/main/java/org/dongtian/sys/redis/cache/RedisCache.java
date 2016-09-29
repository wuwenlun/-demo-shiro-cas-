package org.dongtian.sys.redis.cache;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Set;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.dongtian.sys.util.SerializeUtil;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.CollectionUtils;

/**
 * redis cache
 * @author gaoyuandong
 * @mail   466862016@qq.com
 * @date 2015年11月4日 下午12:42:42
 */
public class RedisCache<K,V> implements Cache<K, V> {

	private BytesRedisTemplate redisTemplate;
	private String keyPrefix;
	
	
	
	public RedisCache(BytesRedisTemplate redisTemplate, String keyPrefix) {
		super();
		this.redisTemplate = redisTemplate;
		this.keyPrefix = keyPrefix;
	}
	
	public byte[] getKey(Object obj) {
	
		byte[] by = SerializeUtil.serialize(obj);
		byte[] preBy;
		try {
			preBy = keyPrefix.getBytes("UTF-8");
			byte[] content = new byte[preBy.length + by.length];
			System.arraycopy(preBy, 0, content, 0, preBy.length);
			System.arraycopy(by, 0, content, preBy.length, content.length - preBy.length);
			return content;
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
		
		
	}
	
	
	public K getK(byte[] by) {
		if(by == null) return null;
		byte[] preBy;
		try {
			preBy = keyPrefix.getBytes("UTF-8");
			byte[] byContent = new byte[by.length - preBy.length];
			System.arraycopy(by, 0, byContent, 0, byContent.length);
			return (K) SerializeUtil.unserialize(byContent);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return null;
		
	}
	public V get(K key) throws CacheException {
		
		if(key == null) return null;
		V  v = null;
		try {
			v = (V) SerializeUtil.unserialize(this.redisTemplate.opsForValue().get(this.getKey(key)));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		return v;
	}

	public V put(K key, V value) throws CacheException {
		
		if(key == null) return null;
		byte[] k = this.getKey(key);
		try {
			this.redisTemplate.opsForValue().set(k, SerializeUtil.serialize(value));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return value;
	}

	public V remove(K key) throws CacheException {
		if(key == null) return null;
		V v = this.get(key);
		try {
			this.redisTemplate.delete(this.getKey(key));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return v;
	}

	public void clear() throws CacheException {
		
		byte[] ks = this.getKey("*");
		Set<byte[]> keys = this.redisTemplate.keys(ks);
		for (byte[] bs : keys) {
			
			if(bs != null && bs.length > 0) {
				
				try {
					this.redisTemplate.delete(bs);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		//this.redisTemplate.getConnectionFactory().getConnection().flushDb();
		
	}

	public int size() {
		byte[] ks = this.getKey("*");
		try {
			Set<byte[]> keys = this.redisTemplate.keys(ks);
			if(!CollectionUtils.isEmpty(keys)) {
				return keys.size();
			} else {
				return 0;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public Set<K> keys() {
		byte[] ks = this.getKey("*");
		Set<byte[]> keys = this.redisTemplate.keys(ks);
		return null;
	}

	public Collection<V> values() {
		byte[] ks = this.getKey("*");
		Set<byte[]> keys = this.redisTemplate.keys(ks);
		List<V> vs = new ArrayList<V>();
		for (byte[] bs : keys) {
			V v = this.get((K)bs);
			if(v != null) {
				vs.add(v);
			}
			
		}
		if(CollectionUtils.isEmpty(vs)) {
			return Collections.unmodifiableList(vs);
		} else {
			return Collections.emptyList();
		}
	}
}
