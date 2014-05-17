package com.pojo;

import java.util.Date;

/**
 * 货物状态表
 * 
 * @author huijunjie
 * @version 1.0 2014/04/09
 */
public class GoodsState {
	/** 货物状态id */
	private Integer id;
	/** 封装袋号 */
	private String bagnum;
	/** 订单号 */
	private Integer orderId;
	/** 当前地点 */
	private String nowposition;
	/** 下一目的地 */
	private String nextposition;
	/** 到达时间 */
	private Date arriveTime;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getBagnum() {
		return bagnum;
	}

	public void setBagnum(String bagnum) {
		this.bagnum = bagnum;
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public String getNowposition() {
		return nowposition;
	}

	public void setNowposition(String nowposition) {
		this.nowposition = nowposition;
	}

	public String getNextposition() {
		return nextposition;
	}

	public void setNextposition(String nextposition) {
		this.nextposition = nextposition;
	}

	public Date getArriveTime() {
		return arriveTime;
	}

	public void setArriveTime(Date arriveTime) {
		this.arriveTime = arriveTime;
	}

}
