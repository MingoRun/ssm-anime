package cn.edu.hstc.modular.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import cn.edu.hstc.modular.entity.Comics;

/**
 * 漫画服务接口类
 * @author Runming
 *
 */
public interface ComicsService {
	//查询所有漫画信息
	public List<Comics> selectComicsAll(Comics comics);
	
	// 查询漫画信息总数
	public int selectComicsCount();
	
	//根据id查询漫画封面地址
	public String selectComicsImgUrlById(int comicsId);
	
	//根据id删除漫画信息
	public int deleteComicsById(int comicsId);
	
	//查询漫画id和漫画名称
	public List<Comics> selectComicsIdAndComicsNameAll();
	
	//添加漫画
	public int addComics(Comics comics);
	
	//更新漫画状态
	public int updateComicsStateById(Comics comics);
	
	//根据id查询漫画信息
	public Comics selectComicsById(int comicsId);
	
	//根据id更新漫画
	public int updateComicsById(Comics comics);
	
	//前台查询8条漫画信息
	public List<Comics> selectEightComics();
	
	//根据分类id查询漫画信息
	public List<Comics> selectComicsByCategoryId(int comicsCategoryId);
	
	//更新点击数
	public int updateClickNumById(Comics comics);
	
	//根据搜索内容查询漫画信息
	public List<Comics> selectComicsAllByContent(@Param("content")String content);
	
	//根据用户id查询漫画名称与id
	public List<Comics> selectIdAndNameAllByUserId(int userId);
}
