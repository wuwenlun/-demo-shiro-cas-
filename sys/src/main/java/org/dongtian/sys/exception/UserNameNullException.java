package org.dongtian.sys.exception;

import org.apache.shiro.authc.AccountException;

/***
 *  用户名为空异常
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年8月25日 下午4:25:39
 */
public class UserNameNullException extends AccountException {

	private static final long serialVersionUID = 7028222202861995466L;

	public UserNameNullException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserNameNullException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public UserNameNullException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public UserNameNullException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}


	

	
}
