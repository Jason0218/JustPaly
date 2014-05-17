package com.pojo;

import java.util.Date;

/**
 * 交接单表
 * @author fh
 * @version 1.0 2014/4/14
 */
public class AssociateList {
	
	private Integer id;/*交接单id*/
	private Integer carId;/*车辆id*/
	private Integer orderId;/*订单id*/
	private Integer employeeId;/*员工id*/
	private Integer nodeId;/*交接地id*/
	private String destn;/*目的地*/
	private Date associateDate;/*交接日期*/
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
