package com.pojo;

/**
 * 车辆调配表
 * 
 * @author huijunjie
 * @version 1.0 2014/04/09
 */
public class AllocateCar {
	/** 车辆调配id */
	private Integer id;
	/** 订单号 */
	private Integer orderid;
	/** 车辆id */
	private Integer carid;
	/** 所在地 */
	private String nowposition;
	/** 目的地 */
	private String destn;

	public Integer getOrderid() {
		return orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCarid() {
		return carid;
	}

	public void setCarid(Integer carid) {
		this.carid = carid;
	}

	public String getNowposition() {
		return nowposition;
	}

	public void setNowposition(String nowposition) {
		this.nowposition = nowposition;
	}

	public String getDestn() {
		return destn;
	}

	public void setDestn(String destn) {
		this.destn = destn;
	}

}
