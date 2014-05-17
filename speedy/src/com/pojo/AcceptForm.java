package com.pojo;

import java.util.Date;

/**
 * 收货报表
 * @author yetao
 *
 */
public class AcceptForm {
	
	private int id;
	private Date formdate;
	private Date formbirthdate;
	private SendNode sendnode;
	private double totalvolume;
	private double totalweight;
	private double totalincome;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getFormdate() {
		return formdate;
	}
	public void setFormdate(Date formdate) {
		this.formdate = formdate;
	}
	public Date getFormbirthdate() {
		return formbirthdate;
	}
	public void setFormbirthdate(Date formbirthdate) {
		this.formbirthdate = formbirthdate;
	}
	public SendNode getSendnode() {
		return sendnode;
	}
	public void setSendnode(SendNode sendnode) {
		this.sendnode = sendnode;
	}
	public double getTotalvolume() {
		return totalvolume;
	}
	public void setTotalvolume(double totalvolume) {
		this.totalvolume = totalvolume;
	}
	public double getTotalweight() {
		return totalweight;
	}
	public void setTotalweight(double totalweight) {
		this.totalweight = totalweight;
	}
	public double getTotalincome() {
		return totalincome;
	}
	public void setTotalincome(double totalincome) {
		this.totalincome = totalincome;
	}
	
	
	
	
}
