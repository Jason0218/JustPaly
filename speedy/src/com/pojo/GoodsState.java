package com.pojo;

import java.util.Date;

/**
 * ����״̬��
 * 
 * @author huijunjie
 * @version 1.0 2014/04/09
 */
public class GoodsState {
	/** ����״̬id */
	private Integer id;
	/** ��װ���� */
	private String bagnum;
	/** ������ */
	private Integer orderId;
	/** ��ǰ�ص� */
	private String nowposition;
	/** ��һĿ�ĵ� */
	private String nextposition;
	/** ����ʱ�� */
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
