package com.pojo;

/**
 * 货物类别表
 * 
 * @author huijunjie
 * @version 1.0 2014/04/09
 */
public class GoodsType {
	/** 货物类型id */
	private Integer id;
	/** 类型名 */
	private String typeName;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

}
