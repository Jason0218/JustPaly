package com.pojo;

/**
 * ���������
 * 
 * @author huijunjie
 * @version 1.0 2014/04/09
 */
public class AllocateCar {
	/** ��������id */
	private Integer id;
	/** ������ */
	private Integer orderid;
	/** ����id */
	private Integer carid;
	/** ���ڵ� */
	private String nowposition;
	/** Ŀ�ĵ� */
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
