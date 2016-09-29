package org.dongtian.sys.util;

/**
 * @author gaoyuandong
 * @mail   466862016@qq.com
 * @date   2015年9月16日 下午4:26:44
 */
public class JsonResult {

	private boolean success;
	private int errorType;
	private String message ="";
	private Object result;
	public boolean isSuccess() {
		return success;
	}
	public void setSuccess(boolean success) {
		this.success = success;
	}
	public int getErrorType() {
		return errorType;
	}
	public void setErrorType(int errorType) {
		this.errorType = errorType;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Object getResult() {
		return result;
	}
	public void setResult(Object result) {
		this.result = result;
	}
	@Override
	public String toString() {
		return "JsonResult [success=" + success + ", errorType=" + errorType + ", message=" + message + ", result="
				+ result + "]";
	}
	
	
}
