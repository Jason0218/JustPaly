package com.pojo;

/**
 * ������
 * 
 * @author huijunjie
 * @version 1.0 2014/04/09
 */
public class Car {
	/** ����id */
	private Integer id;
	/** ���ƺ��� */
	private String carId;
	/** ˾������ */
	private String carDriver;
	/** ������ */
	private Double deadweight;
	/** ��� */
	private Double volume;
	/** ����״̬ */
	private String state;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getCarId() {
		return carId;
	}

	public void setCarId(String carId) {
		this.carId = carId;
	}

	public String getCarDriver() {
		return carDriver;
	}

	public void setCarDriver(String carDriver) {
		this.carDriver = carDriver;
	}

	public Double getDeadweight() {
		return deadweight;
	}

	public void setDeadweight(Double deadweight) {
		this.deadweight = deadweight;
	}

	public Double getVolume() {
		return volume;
	}

	public void setVolume(Double volume) {
		this.volume = volume;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
