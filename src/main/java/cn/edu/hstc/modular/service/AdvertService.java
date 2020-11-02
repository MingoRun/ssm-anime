package cn.edu.hstc.modular.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.hstc.modular.entity.Advert;

/**
 * 广告Service类
 * @author Runming
 *
 */
public interface AdvertService {
	//查询所有广告信息
	public List<Advert> selectAdvertAll(Advert advert);
	
	//根据Id查询广告信息
	public Advert selectAdvertById(int id);
	
	//根据id更新状态及发布日期
	public int updateStateAndReleaseTime(Advert advert);
	
	//添加广告
	public int addAdvert(Advert advert); 
	
	//根据id查找封面图片地址
	public String selectImgUrl(int id);
	
	//根据id删除广告
	public int deleteAdvertById(int id);
	
	//根据id更新广告
	public int updateAdvert(Advert advert);
	
	//前台查询6条商务广告信息
	public List<Advert> selectSixAdvert();
	
	//根据状态查询广告信息
	public List<Advert> selectAdvertByState();
	
	public Advert selectAdvertByIdAndState(int id);
	
	//根据搜索内容查询广告信息
	public List<Advert> selectAdvertAllByContent(@Param("content")String content);
}
