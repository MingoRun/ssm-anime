package cn.edu.hstc.modular.service;

import java.util.List;

import cn.edu.hstc.modular.entity.ComicsCategory;

/**
 * 漫画类型Service接口类
 * @author Runming
 *
 */
public interface ComicsCategoryService {

	//查询所有漫画类型信息
	public List<ComicsCategory> selectComicsCategoryAll();
	
	//根据id删除漫画类型
	public int delComicsCategoryById(int comicsCategoryId);
	
	//添加漫画类型
	public int addComicsCategory(String comicsCategoryName);
}
