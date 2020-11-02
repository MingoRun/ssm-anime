package cn.edu.hstc.modular.entity;

import java.io.Serializable;
import java.util.List;

/**
 * 角色持久化类
 */
public class Role implements Serializable{

	private static final long serialVersionUID = -4255606820008649941L;

	private Integer roleId;    //角色id
	private String roleName;   //角色名称
	private String description;  //角色描述
	private List<User> users;  //与用户关联的属性
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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<User> getUsers() {
		return users;
	}
	public void setUsers(List<User> users) {
		this.users = users;
	}
	@Override
	public String toString() {
		return "Role [roleId=" + roleId + ", roleName=" + roleName + ", description=" + description + ", users=" + users
				+ "]";
	}
	
}
