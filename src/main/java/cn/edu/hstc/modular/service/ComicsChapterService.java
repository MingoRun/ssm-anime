package cn.edu.hstc.modular.service;

import java.util.List;

import cn.edu.hstc.modular.entity.ComicsChapter;

/**
 * 漫画章节Service接口类
 * @author Runming
 *
 */
public interface ComicsChapterService {
	//查询所有漫画章节信息
	public List<ComicsChapter> selectComicsChapterAll(ComicsChapter comicsChapter);

	//根据id删除漫画章节信息
	public int delComicsChapterById(int chapterId);
	
	//根据漫画编号和章节序号查询章节信息
	public ComicsChapter selectChapterByComicsIdAndChapterNum(ComicsChapter chapter);
	
	//添加漫画章节信息
	public int addComicsChapter(ComicsChapter chapter);
	
	//根据漫画章节id查询漫画id
	public ComicsChapter selectNumAndComicsIdByChapterId(int chapterId);
	
	//根据章节id查询章节信息
	public ComicsChapter selectComicsChapterById(int chapterId);
	
	//根据章节id更新章节信息
	public int updateChapterById(ComicsChapter chapter);
	
	//根据漫画id查询漫画章节序号
	public List<ComicsChapter> selectComicsChapterNumByComicsId(int comicsId);
}
