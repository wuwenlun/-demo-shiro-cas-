package org.dongtian.sys.entity;

import java.util.Date;

import org.apache.commons.lang.StringUtils;

/**
 * 
 * @author gaoyuandong
 * @mailto 466862016@qq.com
 * @date   2015年8月28日 下午7:34:27
 */
public class Resource {
	private Integer resourceId;
	private String resourceName;
	private String description;
	private String resourceUrl;
	private Integer parentId;
	private String icon;
	private String permission;
	private Date createTime;
	private Date updateTime;
	private Integer state;
	private Integer type;
	private String sysType;
	private String fullResourceName;
	private boolean open;
	private boolean checked;
	
	public final static int RESOURCE_STATE_NOARMAL = 0;
	public final static int RESOURCE_STATE_DELETE = 1;
	//权限系统
	public final static String SYSTEM_TYPE_CORE = "SYS_CORE";
	
	public Integer getResourceId() {
		return resourceId;
	}
	public void setResourceId(Integer resourceId) {
		this.resourceId = resourceId;
	}
	public String getResourceName() {
		return resourceName;
	}
	public void setResourceName(String resourceName) {
		this.resourceName = resourceName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getResourceUrl() {
		return resourceUrl;
	}
	public void setResourceUrl(String resourceUrl) {
		this.resourceUrl = resourceUrl;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getPermission() {
		return permission;
	}
	public void setPermission(String permission) {
		this.permission = permission;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	
	public String getSysType() {
		return sysType;
	}
	public void setSysType(String sysType) {
		this.sysType = sysType;
	}
	public boolean isOpen() {
		return open;
	}
	public void setOpen(boolean open) {
		this.open = open;
	}
	
	public boolean isChecked() {
		return checked;
	}
	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	public Resource() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public String getFullResourceName() {
		String stateName = state ==0?"有效":"无效";
		String url = StringUtils.isBlank(resourceUrl) ? "" : this.resourceUrl;
		return this.resourceName +" ---------- " + this.permission +" ---------- " + stateName +" ---------- " +url;
	}
	private void setFullResourceName(String fullResourceName) {
		this.fullResourceName = fullResourceName;
	}
	
	
	
}
