package org.dongtian.sys.web.context;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
/***
 * 
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年8月30日 上午11:01:01
 */
public class SpringContextHelper implements ApplicationContextAware {
	
	private ApplicationContext applicationContext;
	
	
	public ApplicationContext getApplicationContext() {
		return applicationContext;
	}


	public void setApplicationContext(ApplicationContext applicationContext) {
		this.applicationContext = applicationContext;
	}

}
