package com.pojo;

import java.util.Date;

/**
 * ����ʱ���
 * 
 * @author huijunjie
 * @version 1.0 2014/04/09
 */
public class SetOutTime {
	/** ����ʱ��id */
	private Integer id;
	/** ����id */
	private Integer carid;
	/** ����ʱ�� */
	private Date setouttime;

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

	public Date getSetouttime() {
		return setouttime;
	}

	public void setSetouttime(Date setouttime) {
		this.setouttime = setouttime;
	}

}
