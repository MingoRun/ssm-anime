package cn.edu.hstc.modular.service;

import java.util.List;

import cn.edu.hstc.modular.entity.User;

/**
 * @Description 用户Service接口类
 * @author xurunming
 * @date 2020-11-01
 */
public interface UserService {
	//查询用户信息
	public List<User> getUserInfo(User user);

	//查询用户表所有用户信息
	public List<User> selectUserAll(User user);
	
	//根据id查询用户信息
	public User selectUserById(int userId);
	
	//根据id删除用户信息
	public int deleteUserById(int userId);
	
	//添加新用户信息
	public int addUser(User user);
	
	//校验登录用户信息
	public User checkUser(User user);
	
	//根据id查询用户头像地址
	public String selectPortraitById(int userId);
	
	//更新用户信息
	public int updateUser(User user);
}
