package com.pojo;

/**
 * 车辆调度数据的JavaBean
 * 
 * @author huijunjie
 * @version 1.0
 */
public class AllocateBean {
	/** 封装袋号 */
	private String bagnum;
	/** 配送地(发货地) */
	private String nodename;
	/** 目的地 */
	private String destn;
	/** 货物体积 */
	private double volume;
	/** 货物重量 */
	private double weight;

	public String getBagnum() {
		return bagnum;
	}

	public void setBagnum(String bagnum) {
		this.bagnum = bagnum;
	}

	public String getNodename() {
		return nodename;
	}

	public void setNodename(String nodename) {
		this.nodename = nodename;
	}

	public String getDestn() {
		return destn;
	}

	public void setDestn(String destn) {
		this.destn = destn;
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
