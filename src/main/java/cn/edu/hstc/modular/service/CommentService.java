package cn.edu.hstc.modular.service;

import java.util.List;

import cn.edu.hstc.modular.entity.Comment;

/**
 * 评论Service接口类
 * @author Runming
 *
 */
public interface CommentService {
	//展示所有新闻评论信息
	public List<Comment> selectNewsCommentAll();
	
	//展示所有漫画章节评论信息
	public List<Comment> selectChapterCommentAll();
	
	//根据id删除评论
	public int delCommentById(int id);
	
	//根据新闻id查询评论信息
	public List<Comment> selectNewsCommentByNewsId(int newsId);
	
	//添加新闻评论
	public int addNewsComment(Comment comment);
	
	//根据漫画章节id查询评论信息
	public List<Comment> selectChapterCommentByChapterId(int chapterId);
	
	//添加漫画章节评论
	public int addChapterComment(Comment comment);
}
