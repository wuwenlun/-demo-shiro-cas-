package org.dongtian.sys.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/***
 * 主库注解
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年12月14日 下午1:52:04
 */
@Target(value= ElementType.METHOD)
@Documented
@Retention(RetentionPolicy.RUNTIME)
public @interface DatabaseMaster {
	
}
