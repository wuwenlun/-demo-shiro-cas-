package org.dongtian.sys.web.context;

import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.dongtian.sys.annotation.DateParser;
import org.springframework.beans.BeanUtils;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;
/***
 * spring mvc 方法参数或者参数为bean中包含有日期类型的格式解析器
 * @author gaoyuandong
 * @mail   466862016@qq.com
 * @date   2015年9月13日 下午3:49:39
 */
public class DateHandlerMethodArgumentResolver implements HandlerMethodArgumentResolver {

	private static Logger log = Logger.getLogger(DateHandlerMethodArgumentResolver.class);
	
	public boolean supportsParameter(MethodParameter parameter) {
		//方法参数
		DateParser dateParser = parameter.getParameterAnnotation(DateParser.class);
		if (dateParser != null) {
			return true;
		} else { //bean的字段上是否存在@DateParser注解
			
			Class<?> targetType = parameter.getParameterType();
			Field[] fields = targetType.getDeclaredFields();
			if(fields != null && fields.length >0) {
				
				for (int i = 0; i < fields.length; i++) {
					
					Field field = fields[i];
					if(field.isAnnotationPresent(DateParser.class) == true) {
						return true;
					}
				}
			}
			
			return false;
		}
	}

	/***
	 * 解析包含有{@link  org.dongtian.sys.annotation.DateParser} 注解的参数
	 */
	public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
		
		if(binderFactory == null) return null;
		
		if(this.findDateParserAnnotationWithArguement(parameter) == true) {
			
			return this.handlerMethodArgumentDateParserAnnotation(parameter,mavContainer,webRequest,binderFactory);
		} else {
			return this.handlerBeanArgumentDateParserAnnotation(parameter,mavContainer,webRequest,binderFactory);
		}
	}

	/***
	 * 解析bean中成员变量 中包含有{@link  org.dongtian.sys.annotation.DateParser} 注解的参数
	 * @author gaoyuandong
	 * @date   2015年9月13日 下午4:39:58
	 * @param parameter
	 * @param mavContainer
	 * @param webRequest
	 * @param binderFactory
	 * @return
	 */
	private Object handlerBeanArgumentDateParserAnnotation(MethodParameter parameter,
			ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) {
		
		Class<?> targetType = parameter.getParameterType();
		Object obj = BeanUtils.instantiate(targetType);
			Field[] fields = targetType.getDeclaredFields();
			WebDataBinder binder;
			try {
				binder = binderFactory.createBinder(webRequest, null, obj.getClass().getName());
				for (Field field : fields) {
					field.setAccessible(true);
					String fieldName = field.getName();
					Class<?> fieldType = field.getType();
					Object arg = null;
					
						if(!Modifier.isFinal(field.getModifiers())) {
							
							if(!StringUtils.isBlank(webRequest.getParameter(fieldName))) {
								if(field.isAnnotationPresent(DateParser.class)) {
									
									DateParser dateParser = field.getAnnotation(DateParser.class);
									String pattern = dateParser.pattern();
									String key = StringUtils.isBlank(dateParser.name()) ? parameter.getParameterName() : dateParser.name();
									//TODO
									SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
									Date date = dateFormat.parse(webRequest.getParameter(fieldName));
									arg = date;
								} else {
									arg = binder.convertIfNecessary(webRequest.getParameter(fieldName), fieldType, parameter);
								}
							} else {
								arg = getDefaultArgumentValue(fieldType, arg); 
							}
							field.set(obj, arg);
						}
					
					
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return null;
			}
			
			return obj;
		
	
	}

	/***
	 * 获取基本数据类型默认的值
	 * @author gaoyuandong
	 * @date   2015年9月13日 下午5:27:37
	 * @param fieldType
	 * @param arg
	 * @return
	 */
	private Object getDefaultArgumentValue(Class<?> fieldType, Object arg) {
		if(this.isBasicDataType(fieldType)) {
			if(fieldType.getName().equals(Boolean.TYPE) ||fieldType.getName().equals(Void.TYPE) ) {
				
			} else {
				arg = 0;
			}
			
		}
		return arg;
	}

	/**
	 * 判定是否为基本数据类型
	 * @author gaoyuandong
	 * @date   2015年9月13日 下午5:12:53
	 * @param fieldType
	 * @return
	 */
	private boolean isBasicDataType(Class<?> fieldType) {
		return fieldType.isPrimitive()?true:false;
	}

	/***
	 * {@link org.dongtian.sys.annotation.DateParser} 注解在方法参数中数据绑定
	 * @author gaoyuandong
	 * @date   2015年9月13日 下午4:19:02
	 * @param parameter
	 * @param mavContainer
	 * @param webRequest
	 * @param binderFactory
	 * @return
	 * @throws ParseException 
	 */
	private Object handlerMethodArgumentDateParserAnnotation(MethodParameter parameter, ModelAndViewContainer mavContainer,
			NativeWebRequest webRequest, WebDataBinderFactory binderFactory)  {
		String[] vals = webRequest.getParameterValues(parameter.getParameterName());
		if (vals == null || vals.length == 0) {
			return null;
		}else {
			if (StringUtils.isBlank(vals[0])) {
				return null;
			} else {
				for (Iterator<String> itr = webRequest.getParameterNames(); itr.hasNext();) {
					String next = itr.next();
					log.debug(next + " ： " + webRequest.getParameterValues(next)[0]);
				}
				DateParser dateParser = parameter.getParameterAnnotation(DateParser.class);
				String pattern = dateParser.pattern();
				String key = StringUtils.isBlank(dateParser.name()) ? parameter.getParameterName() : dateParser.name();
				// TODO
				log.debug(parameter.getParameterName());
				SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
				Date date = null;
				try {
					date = dateFormat.parse(webRequest.getParameterValues(parameter.getParameterName())[0]);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return date;
			}
			
		}
	}

	/***
	 * 是否存在{@link org.dongtian.sys.annotation.DateParser}注解
	 * @author gaoyuandong
	 * @date   2015年9月13日 下午4:14:05
	 * @param parameter
	 * @return true 存在  false 不存在
	 */
	private boolean findDateParserAnnotationWithArguement(MethodParameter parameter) {
		
		return parameter.getParameterAnnotation(DateParser.class) == null ? false:true;
	}

}
