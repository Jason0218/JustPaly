package com.pojo;

import java.util.Date;

/**
 * 发车时间表
 * 
 * @author huijunjie
 * @version 1.0 2014/04/09
 */
public class SetOutTime {
	/** 发车时间id */
	private Integer id;
	/** 车辆id */
	private Integer carid;
	/** 发车时间 */
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
