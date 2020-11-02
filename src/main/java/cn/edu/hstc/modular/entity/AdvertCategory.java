package cn.edu.hstc.modular.entity;

import java.io.Serializable;

/**
 * 广告分类实体类
 * @author Runming
 *
 */
public class AdvertCategory implements Serializable{

	/**
	 * 序列号id
	 */
	private static final long serialVersionUID = 9025488273842414661L;
	private Integer id;
	private String name;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "AdvertCategory [id=" + id + ", name=" + name + "]";
	}
}
