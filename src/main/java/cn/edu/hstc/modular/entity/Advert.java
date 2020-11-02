package cn.edu.hstc.modular.entity;

import java.io.Serializable;

public class Advert implements Serializable{

	/**
	 * 序列号id
	 */
	private static final long serialVersionUID = -3537372150318671011L;
	private Integer id;   //广告编号
	private String name;  //广告名称
	private String content; //广告内容
	private String imgUrl;  //广告封面地址
	private String createTime; //广告创建时间
	private String releaseTime; //广告发布时间
	private String business;   //广告商家
	private String businessPhone;      //商家手机
	private int state;   //状态
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getReleaseTime() {
		return releaseTime;
	}
	public void setReleaseTime(String releaseTime) {
		this.releaseTime = releaseTime;
	}
	public String getBusiness() {
		return business;
	}
	public void setBusiness(String business) {
		this.business = business;
	}
	public String getBusinessPhone() {
		return businessPhone;
	}
	public void setBusinessPhone(String businessPhone) {
		this.businessPhone = businessPhone;
	}
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Advert [id=" + id + ", name=" + name + ", content=" + content + ", imgUrl=" + imgUrl + ", createTime="
				+ createTime + ", releaseTime=" + releaseTime + ", business=" + business + ", businessPhone="
				+ businessPhone + ", state=" + state + "]";
	}
	
}
