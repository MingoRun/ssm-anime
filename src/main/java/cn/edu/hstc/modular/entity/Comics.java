package cn.edu.hstc.modular.entity;

import java.io.Serializable;

/**
 * 漫画实体类
 * @author Runming
 *
 */
public class Comics implements Serializable{

	/**
	 * 序列号id
	 */
	private static final long serialVersionUID = -3961680257560161212L;

	private Integer comicsId; //漫画Id
	private String comicsName; //漫画名称
	private String comicsAuthor; //漫画作者
	private Integer comicsState; //漫画状态
	private String comicsImgUrl;  //漫画封面图片地址
	private ComicsCategory comicsCategory;   //与动漫分类相关的外键属性
	private int clickNum;   //点击次数
	private User user; //与用户相关外键属性
	public Integer getComicsId() {
		return comicsId;
	}
	public void setComicsId(Integer comicsId) {
		this.comicsId = comicsId;
	}
	public String getComicsName() {
		return comicsName;
	}
	public void setComicsName(String comicsName) {
		this.comicsName = comicsName;
	}
	public String getComicsAuthor() {
		return comicsAuthor;
	}
	public void setComicsAuthor(String comicsAuthor) {
		this.comicsAuthor = comicsAuthor;
	}
	
	public Integer getComicsState() {
		return comicsState;
	}
	public void setComicsState(Integer comicsState) {
		this.comicsState = comicsState;
	}
	public String getComicsImgUrl() {
		return comicsImgUrl;
	}
	public void setComicsImgUrl(String comicsImgUrl) {
		this.comicsImgUrl = comicsImgUrl;
	}
	public ComicsCategory getComicsCategory() {
		return comicsCategory;
	}
	public void setComicsCategory(ComicsCategory comicsCategory) {
		this.comicsCategory = comicsCategory;
	}
	
	public int getClickNum() {
		return clickNum;
	}
	public void setClickNum(int clickNum) {
		this.clickNum = clickNum;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Comics [comicsId=" + comicsId + ", comicsName=" + comicsName + ", comicsAuthor=" + comicsAuthor
				+ ", comicsState=" + comicsState + ", comicsImgUrl=" + comicsImgUrl + ", comicsCategory="
				+ comicsCategory + ", clickNum=" + clickNum + ", user=" + user + "]";
	}
	
}
