package org.dongtian.sys.redis.cache;

import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.SerializationException;

/**
 * @author gaoyuandong
 * @mail   466862016@qq.com
 * @date 2015年11月4日 下午2:46:03
 */
public class BytesRedisSerializer implements RedisSerializer<byte[]>{

	public byte[] serialize(byte[] t) throws SerializationException {
		return t;
	}

	public byte[] deserialize(byte[] bytes) throws SerializationException {
		return bytes;
	}


}
