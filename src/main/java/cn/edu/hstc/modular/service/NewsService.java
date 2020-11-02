package cn.edu.hstc.modular.service;

import java.util.List;

import cn.edu.hstc.modular.entity.News;

/**
 * 新闻Service接口类
 */
public interface NewsService {
	//查询所有新闻信息
	public List<News> selectNewsAll(News news);
	
	//删除新闻信息
	public int deleteNews(int newsId);
	
	//添加新闻信息
	public int addNews(News news);
	
	//根据id查询新闻信息
	public News selectNewsById(int newsId);
	
	//更新新闻信息
	public int updateNews(News news);
	
	//发布新闻
	public int updateStateById(News news);
	
	//查询所有新闻来源
	public List<String> selectNewsSourceAll();
	
	//查询新闻是否审核
	public String selectIsCheckByNewsId(int newsId);
	
	//根据新闻id查询新闻图片地址
	public String selectNewsCoverUrlByNewsId(int newsId);
	
	//前台首页查询5条新闻纪录
	public List<News> selectFiveNews();
	
	//前台新闻列表页查询状态为已发布状态的新闻信息
	public List<News> selectNewsAllByState();
	
	//前台分类查询新闻信息
	public List<News> selectNewsAllByCategory(int newsCategoryId);
	
	//根据搜索内容查询新闻信息
	public List<News> selectNewsAllByContent(String content);
}
