package cn.edu.hstc.modular.entity;

import java.io.Serializable;

/**
 * 新闻实体类
 */
public class News implements Serializable{

	/**
	 * 序列号
	 */
	private static final long serialVersionUID = -5342478478293274310L;
	
	private Integer newsId;     //新闻编号
	private String newsTitle;   //新闻标题
	private String newsSource;  //新闻来源
	private String newsAuthor;  //新闻作者
	private String newsCreateDate;  //新闻创建日期
	private String newsReleaseTime; //新闻发布时间
	private String newsIntro;   //新闻简介
	private String newsContent; //新闻正文
	private String newsCoverUrl; //新闻封面图片地址
	private Integer state;     //新闻状态
	private NewsCategory newsCategory;  //外键字段
	
	public Integer getNewsId() {
		return newsId;
	}
	public void setNewsId(Integer newsId) {
		this.newsId = newsId;
	}
	public String getNewsTitle() {
		return newsTitle;
	}
	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	public String getNewsSource() {
		return newsSource;
	}
	public void setNewsSource(String newsSource) {
		this.newsSource = newsSource;
	}
	public String getNewsAuthor() {
		return newsAuthor;
	}
	public void setNewsAuthor(String newsAuthor) {
		this.newsAuthor = newsAuthor;
	}
	public String getNewsCreateDate() {
		return newsCreateDate;
	}
	public void setNewsCreateDate(String newsCreateDate) {
		this.newsCreateDate = newsCreateDate;
	}
	
	public String getNewsReleaseTime() {
		return newsReleaseTime;
	}
	public void setNewsReleaseTime(String newsReleaseTime) {
		this.newsReleaseTime = newsReleaseTime;
	}
	public String getNewsIntro() {
		return newsIntro;
	}
	public void setNewsIntro(String newsIntro) {
		this.newsIntro = newsIntro;
	}
	public String getNewsContent() {
		return newsContent;
	}
	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}
	public String getNewsCoverUrl() {
		return newsCoverUrl;
	}
	public void setNewsCoverUrl(String newsCoverUrl) {
		this.newsCoverUrl = newsCoverUrl;
	}
	public Integer getState() {
		return state;
	}
	public void setState(Integer state) {
		this.state = state;
	}
	public NewsCategory getNewsCategory() {
		return newsCategory;
	}
	public void setNewsCategory(NewsCategory newsCategory) {
		this.newsCategory = newsCategory;
	}
	@Override
	public String toString() {
		return "News [newsId=" + newsId + ", newsTitle=" + newsTitle + ", newsSource=" + newsSource + ", newsAuthor="
				+ newsAuthor + ", newsCreateDate=" + newsCreateDate + ", newsReleaseTime=" + newsReleaseTime
				+ ", newsIntro=" + newsIntro + ", newsContent=" + newsContent + ", newsCoverUrl=" + newsCoverUrl
				+ ", state=" + state + ", newsCategory=" + newsCategory + "]";
	}
}
