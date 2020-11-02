package cn.edu.hstc.modular.entity;

import java.io.Serializable;

/**
 * 漫画章节实体类
 * @author Runming
 *
 */
public class ComicsChapter implements Serializable {

	/**
	 * 序列化id
	 */
	private static final long serialVersionUID = 818892402248812610L;
    private Integer chapterId;    //漫画章节id
    private Integer chapterNum;   //漫画章节序号
    private String chapterName;  //漫画章节名称
    private String updateTime;    //漫画章节更新时间
    private Comics comics;     //与漫画信息相关的外键属性
	public Integer getChapterId() {
		return chapterId;
	}
	public void setChapterId(Integer chapterId) {
		this.chapterId = chapterId;
	}
	public Integer getChapterNum() {
		return chapterNum;
	}
	public void setChapterNum(Integer chapterNum) {
		this.chapterNum = chapterNum;
	}
	public String getChapterName() {
		return chapterName;
	}
	public void setChapterName(String chapterName) {
		this.chapterName = chapterName;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	
	public Comics getComics() {
		return comics;
	}
	public void setComics(Comics comics) {
		this.comics = comics;
	}
	@Override
	public String toString() {
		return "ComicsChapter [chapterId=" + chapterId + ", chapterNum=" + chapterNum + ", chapterName=" + chapterName
				+ ", updateTime=" + updateTime + ", comics=" + comics + "]";
	}
	
}
