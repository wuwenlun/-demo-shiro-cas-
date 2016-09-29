package org.dongtian.sys.exception;

import org.apache.shiro.authc.AuthenticationException;

/**
 * 密码错误异常
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年8月31日 下午2:27:45
 */
public class PasswordNotFoundException extends AuthenticationException {

	
	private static final long serialVersionUID = -3431445150928914600L;

	public PasswordNotFoundException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PasswordNotFoundException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public PasswordNotFoundException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public PasswordNotFoundException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}
	
	

}
