package cn.edu.hstc.modular.service;

import java.util.List;

import cn.edu.hstc.modular.entity.Admin;

/**
 * 用户Service接口
 */
public interface AdminService {
	//通过账户名来查找管理员信息
	public Admin findAdminByAccountName(String accountName);
	
	//根据id号查询管理员信息
	public Admin selectAdminById(Integer id);
	
	//根据id号查询登录密码
	public String selectPWDById(Integer id);
	
	//更新系统管理员登录密码
	public int updateAdminPassword(Admin admin);
	
	//查询所有管理员信息
	public List<Admin> selectAdminAll();
	
	//超级管理员添加普通管理员信息
	public int addAdmin(Admin admin);
	
	//超级管理员根据id删除普通管理员
	public int deleteAdminById(int id);
}