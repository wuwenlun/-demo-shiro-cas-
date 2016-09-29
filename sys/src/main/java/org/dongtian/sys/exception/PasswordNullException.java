package org.dongtian.sys.exception;

import org.apache.shiro.authc.AuthenticationException;

/**
 * 密码为空异常
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年8月25日 下午4:26:54
 */
public class PasswordNullException extends AuthenticationException {

	private static final long serialVersionUID = 5540028278840961416L;

	public PasswordNullException() {
		super();
	}

	public PasswordNullException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public PasswordNullException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public PasswordNullException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	
}
