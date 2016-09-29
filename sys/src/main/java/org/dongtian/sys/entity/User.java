package org.dongtian.sys.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.dongtian.sys.annotation.DateParser;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * 用户信息
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年8月25日 下午7:45:40
 */
public class User implements Serializable{

	private Integer userId;
	private String userName;
	private String password;
	private Integer state;
	private int age;
	private int sex;
	private String address;
	private String mobile;
	private String email;
	private Integer userType;
	private String nickName;
	@DateParser(pattern="yyyy-MM-dd hh:mm:ss")
	private Date createTime;
	private Date updateTime;
	private Date regTime;
	
	private List<Role> roleList = new ArrayList<Role>();
	private List<Menu> menuList = new ArrayList<Menu>();
	
	//正常
	public final static int USER_STATE_NORMAL = 0;
	//已删除
	public final static int USER_STATE_DELETE = 1;
	//已经被锁定
	public final static int USER_STATE_LOCKED = 2;
	
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd hh:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd hh:mm:ss")
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	@DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
	@JsonFormat(pattern="yyyy-MM-dd hh:mm:ss")
	public Date getRegTime() {
		return regTime;
	}
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}
	public Integer getUserType() {
		return userType;
	}
	public void setUserType(Integer userType) {
		this.userType = userType;
	}
	public List<Role> getRoleList() {
		return roleList;
	}
	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}
	public List<Menu> getMenuList() {
		return menuList;
	}
	public void setMenuList(List<Menu> menuList) {
		this.menuList = menuList;
	}
	
	
}
