package com.pojo;

/**
 * 货物表
 * 
 * @author huijunjie
 * @version 1.0 2014/04/09
 */
public class Goods {
	/** 货物id */
	private int id;
	/** 货物名称 */
	private String goodsName;
	/** 货物类型id */
	private int typeId;
	/** 体积 */
	private double volume;
	/** 重量 */
	private double weight;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public double getVolume() {
		return volume;
	}

	public void setVolume(double volume) {
		this.volume = volume;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

}
