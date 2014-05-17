package com.pojo;

import java.sql.Date;

/*
 * 订单表
 */
public class Order
{
	private int id;
	private String destn;// 目的地
	private int nodeid; // 配送地(外键)
	private Date accepetdate;
	private int user_id;//登陆员工
	
	private String accepeter;//收件人姓名
	private String accepterphonenum;// 收件人电话
	private double price;
	private String scope;// 配送范围

	private Date senddate;// 发送日期
	private String address;
	private String email;//收件人电子邮件
	private Goods  good;
	private int goodsamount;//货物数量
	private double mateprice;// 配送价格
	private double proteprice;// 报价
	private double sendprice;// 派送价格
	private double totalprice;// 总价格
	private String sender;//寄件人

	public int getId()
	{
		return id;
	}

	public void setId(int id)
	{
		this.id = id;
	}

	public String getDestn()
	{
		return destn;
	}

	public void setDestn(String destn)
	{
		this.destn = destn;
	}

	

	public int getNodeid()
	{
		return nodeid;
	}

	public void setNodeid(int nodeid)
	{
		this.nodeid = nodeid;
	}




	public Date getAccepetdate()
	{
		return accepetdate;
	}

	public void setAccepetdate(Date accepetdate)
	{
		this.accepetdate = accepetdate;
	}

	public String getAccepeter()
	{
		return accepeter;
	}

	public void setAccepeter(String accepeter)
	{
		this.accepeter = accepeter;
	}

	public String getAccepterphonenum()
	{
		return accepterphonenum;
	}

	public void setAccepterphonenum(String accepterphonenum)
	{
		this.accepterphonenum = accepterphonenum;
	}

	public double getPrice()
	{
		return price;
	}

	public void setPrice(double price)
	{
		this.price = price;
	}

	public String getScope()
	{
		return scope;
	}

	public void setScope(String scope)
	{
		this.scope = scope;
	}



	public Date getSenddate()
	{
		return senddate;
	}

	public void setSenddate(Date senddate)
	{
		this.senddate = senddate;
	}

	public String getAddress()
	{
		return address;
	}

	public void setAddress(String address)
	{
		this.address = address;
	}

	public String getEmail()
	{
		return email;
	}

	public void setEmail(String email)
	{
		this.email = email;
	}





	public int getUser_id()
	{
		return user_id;
	}

	public void setUser_id(int user_id)
	{
		this.user_id = user_id;
	}



	public Goods getGood()
	{
		return good;
	}

	public void setGood(Goods good)
	{
		this.good = good;
	}

	public int getGoodsamount()
	{
		return goodsamount;
	}

	public void setGoodsamount(int goodsamount)
	{
		this.goodsamount = goodsamount;
	}

	public double getMateprice()
	{
		return mateprice;
	}

	public void setMateprice(double mateprice)
	{
		this.mateprice = mateprice;
	}

	public double getProteprice()
	{
		return proteprice;
	}

	public void setProteprice(double proteprice)
	{
		this.proteprice = proteprice;
	}



	public double getSendprice()
	{
		return sendprice;
	}

	public void setSendprice(double sendprice)
	{
		this.sendprice = sendprice;
	}



	public double getTotalprice()
	{
		return totalprice;
	}

	public void setTotalprice(double totalprice)
	{
		this.totalprice = totalprice;
	}

	public String getSender()
	{
		return sender;
	}

	public void setSender(String sender)
	{
		this.sender = sender;
	}


}
