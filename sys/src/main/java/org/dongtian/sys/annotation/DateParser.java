package org.dongtian.sys.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 日期类型解析器注解
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年9月6日 下午2:18:38
 */
@Target({ElementType.PARAMETER,ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface DateParser {
//名称
String name() default "";
//格式化
String pattern() default "yyyy-MM-dd hh:mm:ss";
}