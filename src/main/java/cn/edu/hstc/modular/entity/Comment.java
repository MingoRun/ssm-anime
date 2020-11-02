package cn.edu.hstc.modular.entity;

import java.io.Serializable;

/**
 * 评论实体类
 * @author Runming
 *
 */
public class Comment implements Serializable{

	/**
	 * 序列号id
	 */
	private static final long serialVersionUID = -8154650079778283264L;
	private Integer id;   //评论编号
	private Integer type; //评论类别(1:代表新闻;2:代表漫画)
	private String content;  //评论内容
	private String time;     //评论时间
	private User user;       //与用户相关的外键属性
	private News news;       //与新闻相关的外键属性
	private ComicsChapter chapter;   //与漫画章节相关的外键属性
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public News getNews() {
		return news;
	}
	public void setNews(News news) {
		this.news = news;
	}
	public ComicsChapter getChapter() {
		return chapter;
	}
	public void setChapter(ComicsChapter chapter) {
		this.chapter = chapter;
	}
	@Override
	public String toString() {
		return "Comment [id=" + id + ", type=" + type + ", content=" + content + ", time=" + time + ", user=" + user
				+ ", news=" + news + ", chapter=" + chapter + "]";
	}
}
