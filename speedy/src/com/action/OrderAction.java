package com.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.common.OrderUntils;
import com.common.Page;
import com.opensymphony.xwork2.ActionContext;
import com.pojo.*;
import com.service.OrderService;
/**
 * 订单相关处理
 * @author zhangjiayi
 *
 */
public class OrderAction
{
    private Log logger=LogFactory.getLog(OrderAction.class);
	private ArrayList<Order> al;// 查询订单的返回值
	private String ordernumbers;// 查询订单的字符串
	private List<GoodsType> typeList;//货物类别列表
	private OrderService orderService;
	private Order order;
	private List<SendNode> nodeList;//配送点列表
	private ActionContext actionContext;
	private ArrayList<HashMap<String, Object>> ordersAndState;//订单信息和订单状态
	private String orderstate;//订单号组成的字符串
	private String[] delbox;//删除订单
	private String tag;//操作返回的信息
	private Page page;

	public Page getPage()
	{
		return page;
	}

	public void setPage(Page page)
	{
		this.page = page;
	}

	public String getTag()
	{
		return tag;
	}

	public void setTag(String tag)
	{
		this.tag = tag;
	}

	public String[] getDelbox()
	{
		return delbox;
	}

	public void setDelbox(String[] delbox)
	{
		this.delbox = delbox;
	}

	public String getOrderstate()
	{
		return orderstate;
	}

	public void setOrderstate(String orderstate)
	{
		this.orderstate = orderstate;
	}

	public ArrayList<HashMap<String, Object>> getOrdersAndState()
	{
		return ordersAndState;
	}

	public void setOrdersAndState(
			ArrayList<HashMap<String, Object>> ordersAndState)
	{
		this.ordersAndState = ordersAndState;
	}

	public List<SendNode> getNodeList()
	{
		return nodeList;
	}

	public void setNodeList(List<SendNode> nodeList)
	{
		this.nodeList = nodeList;
	}

	public ActionContext getActionContext()
	{
		return actionContext;
	}

	public void setActionContext(ActionContext actionContext)
	{
		this.actionContext = actionContext;
	}

	public List<GoodsType> getTypeList()
	{
		return typeList;
	}

	public void setTypeList(List<GoodsType> typeList)
	{
		this.typeList = typeList;
	}

	public Order getOrder()
	{
		return order;
	}

	public void setOrder(Order order)
	{
		this.order = order;
	}

	public OrderService getOrderService()
	{
		return orderService;
	}

	public void setOrderService(OrderService orderService)
	{
		this.orderService = orderService;
	}

	public String getOrdernumbers()
	{
		return ordernumbers;
	}

	public void setOrdernumbers(String ordernumbers)
	{
		this.ordernumbers = ordernumbers;
	}

	public ArrayList<Order> getAl()
	{
		return al;
	}

	public void setAl(ArrayList<Order> al)
	{
		this.al = al;
	}

	/**
	 * 根据订单号订单的查询
	 * 
	 * @return
	 */
	public String query()
	{
		// page.setCurPage(12);

		logger.debug("ids:"+ordernumbers);
		
		al = orderService.getOrdersbyids(ordernumbers);

		return "success";
	}

	/**
	 * 添加订单（订单的提交）
	 * 
	 * @return
	 */
	public String sub()
	{

		actionContext = ActionContext.getContext();
		//从session中获取登陆者信息
		User u = (User) actionContext.getSession().get("usr");
		order.setUser_id(u.getId());
		order.setNodeid(u.getNode_id());
		//字段废弃
		order.setPrice(110.2);
		order.setScope("scope");
	    //获取订单提交时间（当前时间）
		logger.debug("now time:"+OrderUntils.getNowDate().toString());
		logger.debug("username:"+u.getUsername());
		order.setAccepetdate(OrderUntils.getNowDate());

		String i = orderService.insertOrder(order);
		//判断订单提交是否成功
		if (i.equals("1"))
		{
			tag = "提交成功";
		} else
		{
			tag = "提交失败";

		}

		return "success";
	}

	/**
	 * 查询所有货物类别
	 */
	public String queryAlltype()
	{

		typeList = orderService.selectAllType();
		logger.debug("typeList.size:"+typeList.size());
		return "success";
	}

	/**
	 * 在多条件查询订单
	 * 
	 **/
	public String getOrderList()
	{

	
		ordersAndState = orderService.getOrderANDState(order, orderstate);
		return "success";

	}

	/**
	 * 得到所有的站点信息
	 */
	public String getSendNode()
	{

		nodeList = orderService.selectAllNode();

		return "success";
	}

	/**
	 * 得到修改订单的信息
	 * 
	 * @return
	 */
	public String Intoupdatejsp()
	{

		order = orderService.selectOrder(order.getId());

		return "IntoupdateJsp";
	}

	/**
	 * 删除单个订单
	 * 
	 * @return
	 */
	public String delOrder()
	{

		orderService.delOrder(order.getId());
		tag = "删除成功";
		return "delorUpdatesuccess";
	}

	/**
	 * 更新订单
	 * 
	 * @return
	 */
	public String updateOrder()
	{
		orderService.updateOrder(order);

		tag = "更新成功";
		return "delorUpdatesuccess";
	}

	/**
	 * 删除多个订单
	 * 
	 * @return
	 */
	public String delOrders()
	{
      logger.debug("del orderids"+delbox[0]);
		orderService.delOrders(delbox[0]);
		return "delorUpdatesuccess";

	}

}