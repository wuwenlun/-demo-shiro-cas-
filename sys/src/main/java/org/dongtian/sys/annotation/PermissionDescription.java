package org.dongtian.sys.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
/***
 * 自动加载权限
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年8月20日 上午10:48:07
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface PermissionDescription {

	String value() default "未命名权限资源";
	String moudle() default "未命名模块";
}
