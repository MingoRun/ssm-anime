package cn.edu.hstc.modular.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.hstc.modular.mapper.UserMapper;
import cn.edu.hstc.modular.entity.User;
import cn.edu.hstc.modular.service.UserService;

/**
 * @Description 用户Service实现类
 * @author mingoxu
 * @date 2020-11-01
 *
 */
@Service
public class UserServiceImpl implements UserService {

	//注入依赖
	@Autowired
	private UserMapper userMapper;

	/**
	 * 查询用户信息
	 * @param user
	 * @return
	 */
	@Override
	public List<User> getUserInfo(User user) {
		return userMapper.getUserInfo(user);
	}

	@Override
	public List<User> selectUserAll(User user) {
		// TODO Auto-generated method stub
		return userMapper.selectUserAll(user);
	}

	@Override
	public User selectUserById(int userId) {
		// TODO Auto-generated method stub
		return userMapper.selectUserById(userId);
	}

	/**
	 * 根据id删除用户信息
	 */
	@Override
	public int deleteUserById(int userId) {
		// TODO Auto-generated method stub
		return userMapper.deleteUserById(userId);
	}

	/**
	 * 添加新用户信息
	 */
	@Override
	public int addUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.addUser(user);
	}

	/**
	 * 校验登录用户信息
	 */
	@Override
	public User checkUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.checkUser(user);
	}

	@Override
	public String selectPortraitById(int userId) {
		// TODO Auto-generated method stub
		return userMapper.selectPortraitById(userId);
	}

	/**
	 * 更新用户信息
	 */
	@Override
	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.updateUser(user);
	}

}
