package cn.edu.hstc.modular.entity;

import java.io.Serializable;

/**
 * 管理员实体类
 * @author Runming
 *
 */
public class Admin implements Serializable {

	/**
	 * 序列号id
	 */
	private static final long serialVersionUID = 2091794652020533801L;
	private Integer userId;   //管理员编号
	private String loginName;   //账户名
	private String userName;   //管理员姓名
	private String password; //登录密码

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
}
