package org.dongtian.sys.redis.cache;

import org.springframework.data.redis.connection.DefaultStringRedisConnection;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

/***
 * key存字节数组
 * @author gaoyuandong
 * @mail   466862016@qq.com
 * @date 2015年11月4日 下午2:27:09
 */
public class BytesRedisTemplate  extends RedisTemplate<byte[], byte[]>{

	public BytesRedisTemplate() {
		BytesRedisSerializer bytesSerializer = new BytesRedisSerializer();
		setKeySerializer(bytesSerializer);
		setValueSerializer(bytesSerializer);
		setHashKeySerializer(bytesSerializer);
		setHashValueSerializer(bytesSerializer);
	}
	public BytesRedisTemplate(RedisConnectionFactory connectionFactory) {
		this();
		setConnectionFactory(connectionFactory);
		afterPropertiesSet();
	}

	protected RedisConnection preProcessConnection(RedisConnection connection, boolean existingConnection) {
		return new DefaultStringRedisConnection(connection);
	}
	
}
