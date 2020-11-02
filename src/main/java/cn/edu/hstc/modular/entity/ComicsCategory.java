package cn.edu.hstc.modular.entity;

import java.io.Serializable;

public class ComicsCategory implements Serializable{

	/**
	 * 序列号id
	 */
	private static final long serialVersionUID = 5924445562987487752L;

	private Integer comicsCategoryId;
	private String comicsCategoryName;
	public Integer getComicsCategoryId() {
		return comicsCategoryId;
	}
	public void setComicsCategoryId(Integer comicsCategoryId) {
		this.comicsCategoryId = comicsCategoryId;
	}
	public String getComicsCategoryName() {
		return comicsCategoryName;
	}
	public void setComicsCategoryName(String comicsCategoryName) {
		this.comicsCategoryName = comicsCategoryName;
	}
	@Override
	public String toString() {
		return "ComicsCategory [comicsCategoryId=" + comicsCategoryId + ", comicsCategoryName=" + comicsCategoryName
				+ "]";
	}
	
	
}
