package com.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * TCompanyreportform entity. @author MyEclipse Persistence Tools
 */

public class Companyreportform extends ModelClass {

	// Fields

	private static final long serialVersionUID = -6341580571536317308L;
	private int id;
	private Date formdate;
	private Date formbirthdate;
	private SendNode sendnode;
	private double totalvolume;
	private double totalweight;
	private double totalincome;
    
	// Constructors

	/** default constructor */
	public Companyreportform() {
	}

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	

	public SendNode getSendnode() {
		return sendnode;
	}

	public void setSendnode(SendNode sendnode) {
		this.sendnode = sendnode;
	}

	public Date getFormdate() {
		return formdate;
	}

	public void setFormdate(Date formdate) {
		this.formdate = formdate;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Date getFormbirthdate() {
		return formbirthdate;
	}

	public void setFormbirthdate(Date formbirthdate) {
		this.formbirthdate = formbirthdate;
	}


	



}