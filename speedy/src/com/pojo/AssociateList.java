package com.pojo;

import java.util.Date;

/**
 * ���ӵ���
 * @author fh
 * @version 1.0 2014/4/14
 */
public class AssociateList {
	
	private Integer id;/*���ӵ�id*/
	private Integer carId;/*����id*/
	private Integer orderId;/*����id*/
	private Integer employeeId;/*Ա��id*/
	private Integer nodeId;/*���ӵ�id*/
	private String destn;/*Ŀ�ĵ�*/
	private Date associateDate;/*��������*/
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCarId() {
		return carId;
	}
	public void setCarId(Integer carId) {
		this.carId = carId;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	public Integer getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(Integer employeeId) {
		this.employeeId = employeeId;
	}
	public Integer getNodeId() {
		return nodeId;
	}
	public void setNodeId(Integer nodeId) {
		this.nodeId = nodeId;
	}
	public String getDestn() {
		return destn;
	}
	public void setDestn(String destn) {
		this.destn = destn;
	}
	public Date getAssociateDate() {
		return associateDate;
	}
	public void setAssociateDate(Date associateDate) {
		this.associateDate = associateDate;
	}
	
	

}
