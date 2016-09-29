package org.dongtian.sys.entity;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

/**
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年8月27日 上午11:54:01
 */
public class Role {
	private Integer roleId;
	private String roleName;
	private Integer state;
	private Date createTime;
	private Date updateTime;
	private String description;
	private boolean checked;
	
	//正常
	public final static int ROLE_STATE_NORMAL = 0;
	//已删除
	public final static int ROLE_STATE_DELETE = 1;
	
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	@JsonFormat(pattern="yyyy-MM-dd hh:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@JsonFormat(pattern="yyyy-MM-dd hh:mm:ss")
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
	
	

}
