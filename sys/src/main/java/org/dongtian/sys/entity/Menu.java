package org.dongtian.sys.entity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Menu  implements Serializable {
	
	private Integer menuId;
	private String menuName;
	private String description;
	private String menuUrl;
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
	
	private List<Menu> childMenuList = new ArrayList<Menu>();
	
	public Integer getMenuId() {
		return menuId;
	}
	public void setMenuId(Integer menuId) {
		this.menuId = menuId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
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
	public String getFullResourceName() {
		return fullResourceName;
	}
	public void setFullResourceName(String fullResourceName) {
		this.fullResourceName = fullResourceName;
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
	@Override
	public String toString() {
		return "Menu [menuId=" + menuId + ", menuName=" + menuName + ", description=" + description + ", menuUrl="
				+ menuUrl + ", parentId=" + parentId + ", icon=" + icon + ", permission=" + permission + ", createTime="
				+ createTime + ", updateTime=" + updateTime + ", state=" + state + ", type=" + type + ", sysType="
				+ sysType + ", fullResourceName=" + fullResourceName + ", open=" + open + ", checked=" + checked + "]";
	}
	public List<Menu> getChildMenuList() {
		return childMenuList;
	}
	public void setChildMenuList(List<Menu> childMenuList) {
		this.childMenuList = childMenuList;
	}
	
	
	

}
