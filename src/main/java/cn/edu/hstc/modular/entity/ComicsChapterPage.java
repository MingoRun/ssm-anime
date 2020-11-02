package cn.edu.hstc.modular.entity;

import java.io.Serializable;

/**
 * 漫画章节页面实体类
 * @author Runming
 *
 */
public class ComicsChapterPage implements Serializable{

	/**
	 * 序列化id
	 */
	private static final long serialVersionUID = -5153835552994413223L;
	private Integer pageId;    //漫画章节页面id
	private ComicsChapter chapter; //与漫画章节相关的外键属性
	private String pageUrl;    //漫画页面地址
	public Integer getPageId() {
		return pageId;
	}
	public void setPageId(Integer pageId) {
		this.pageId = pageId;
	}
	
	public ComicsChapter getChapter() {
		return chapter;
	}
	public void setChapter(ComicsChapter chapter) {
		this.chapter = chapter;
	}
	public String getPageUrl() {
		return pageUrl;
	}
	public void setPageUrl(String pageUrl) {
		this.pageUrl = pageUrl;
	}
	@Override
	public String toString() {
		return "ComicsChapterPage [pageId=" + pageId + ", chapter=" + chapter + ", pageUrl=" + pageUrl + "]";
	}
	
}
