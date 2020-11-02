package cn.edu.hstc.modular.service;

import java.util.List;

import cn.edu.hstc.modular.entity.Role;

/**
 * 角色Service接口类
 * @author Runming
 *
 */
public interface RoleService {
	//查询所有角色信息
	public List<Role> selectRoleAll();
	
	//添加角色信息
	public int addRole(Role role);
	
	//删除角色信息
	public int deleteRoleById(int roleId);
}
