package com.pojo;

import java.io.Serializable;

/**
 * Ȩ�ޱ�
 * 
 * @author czp
 * 
 */
public class Permission implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3351041116667934334L;
	/** Ȩ��id */
	private Integer pid;
	/** Ȩ����� */
	private String pname;
	/** Ȩ������ģ�� */
	private Integer model;
	/** Ȩ��·�� */
	private String purl;

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getModel() {
		return model;
	}

	public void setModel(Integer model) {
		this.model = model;
	}

	public String getPurl() {
		return purl;
	}

	public void setPurl(String purl) {
		this.purl = purl;
	}

}
