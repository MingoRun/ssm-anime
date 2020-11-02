package cn.edu.hstc.modular.entity;

import java.io.Serializable;
import java.util.List;

public class NewsCategory implements Serializable{

	/**
	 * 序列号
	 */
	private static final long serialVersionUID = -4020499076823982572L;

	private Integer id;   //新闻分类编号
	private String name;  //新闻分类名称
	private List<News> newsList;  //与新闻关联的属性
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
	public List<News> getNewsList() {
		return newsList;
	}
	public void setNewsList(List<News> newsList) {
		this.newsList = newsList;
	}
	@Override
	public String toString() {
		return "NewsCategory [id=" + id + ", name=" + name + ", newsList=" + newsList + "]";
	}
	
}
