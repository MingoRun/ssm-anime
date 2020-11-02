package cn.edu.hstc.modular.service;

import java.util.List;

import cn.edu.hstc.modular.entity.ComicsChapterPage;

/**
 * 漫画章节页面Service接口类
 * @author Runming
 *
 */
public interface ComicsChapterPageService {
	//添加漫画章节页面信息
	public int addChapterPage(ComicsChapterPage chapterPage);
	
	//根据章节id删除漫画章节页面信息
	public int delChapterPageByChapterId(int chapterId);
	
	//根据章节id查询漫画章节页面地址
	public List<String> selectPageUrlByChapterId(int chapterId);
	
	//根据章节id更新漫画章节页面地址
	public int updatePageUrlByChapterId(ComicsChapterPage page);
	
	//根据章节id查询漫画章节页面信息
	public List<ComicsChapterPage> selectPageByChapterId(int chapterId);
}
