package com.pojo;

/**
 * �����������ݵ�JavaBean
 * 
 * @author huijunjie
 * @version 1.0
 */
public class AllocateBean {
	/** ��װ���� */
	private String bagnum;
	/** ���͵�(������) */
	private String nodename;
	/** Ŀ�ĵ� */
	private String destn;
	/** ������� */
	private double volume;
	/** �������� */
	private double weight;

	public String getBagnum() {
		return bagnum;
	}

	public void setBagnum(String bagnum) {
		this.bagnum = bagnum;
	}

	public String getNodename() {
		return nodename;
	}

	public void setNodename(String nodename) {
		this.nodename = nodename;
	}

	public String getDestn() {
		return destn;
	}

	public void setDestn(String destn) {
		this.destn = destn;
	}

	public double getVolume() {
		return volume;
	}

	public void setVolume(double volume) {
		this.volume = volume;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

}
