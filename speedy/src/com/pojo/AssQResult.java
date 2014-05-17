package com.pojo;
/**
 * 交接表生成页面的查询结果
 * @author fh
 *
 */

public class AssQResult {

	private int orderId;
	private int goodsAmount;
	private String nname;
	private String destn;
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getGoodsAmount() {
		return goodsAmount;
	}
	public void setGoodsAmount(int goodsAmount) {
		this.goodsAmount = goodsAmount;
	}
	
	public String getDestn() {
		return destn;
	}
	public void setDestn(String destn) {
		this.destn = destn;
	}
	public String getNname() {
		return nname;
	}
	public void setNname(String nname) {
		this.nname = nname;
	}
	
}
