package cn.edu.hstc.modular.entity;

import java.io.Serializable;

/**
 * 用户持久化类
 */
public class User implements Serializable{

	private static final long serialVersionUID = -3164244920389080311L;
	
	private Integer userId;   //用户id
	private String loginName; //登录账户
	private String password;  //登录密码
	private String userName;  //用户姓名

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
}
