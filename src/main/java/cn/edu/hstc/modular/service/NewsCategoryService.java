package cn.edu.hstc.modular.service;

import java.util.List;

import cn.edu.hstc.modular.entity.NewsCategory;

/**
 * 新闻分类Service接口类
 */
public interface NewsCategoryService {
	
	/**
	 * 查询所有新闻信息
	 */
	//public List<NewsCategory> selectNewsAll();
	
	/**
	 * 查询所有新闻分类
	 */
	public List<NewsCategory> selectNewsCategoryAll();
	
	//添加新闻分类
	public int addNewsCategory(NewsCategory newsCategory);
	
	//删除新闻分类
	public int deleteNewsCategory(int id);
}
