package com.service.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.action.OrderAction;
import com.common.OrderUntils;
import com.dao.OrderDao;

import com.pojo.Goods;
import com.pojo.GoodsType;
import com.pojo.Order;
import com.pojo.SendNode;
import com.service.OrderService;
/**
 * 订单相关的表的操作的封装组合
 * @author zhangjiayi
 *
 */
public class OrderServiceImpl implements OrderService {
	 private Log logger=LogFactory.getLog(OrderService.class);
	private OrderDao orderDao;
	private ArrayList<Order> ordersList;

	public OrderDao getOrderDao() {
		return orderDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	public ArrayList<Order> getOrdersList() {
		return ordersList;
	}

	public void setOrdersList(ArrayList<Order> ordersList) {
		this.ordersList = ordersList;
	}

	/**
	 * 得到订单列表
	 */
	@Override
	public ArrayList<Order> getOrdersbyids(String orders) {
		ordersList = new ArrayList<Order>();

		String ids[] = orders.split(",");

		for (int i = 0; i < ids.length; i++) {
			logger.debug(i+"orderid:"+ids[i]);
			int id = Integer.parseInt(ids[i]);//转换
			
			Order o = orderDao.queryOrderbyId(id);//根据id查询单个订单
			if (o != null)
				ordersList.add(o);
		}
		return ordersList;
	}


	@Override
	public Order selectOrder(int oid) {
		logger.debug("select_oid:"+oid);
		Order o = orderDao.queryOrderbyId2(oid);
		

		return o;

	}
   /**
    * 订单的提交（网上下单）
    */
	@Override
	public String insertOrder(Order o) {
		Goods g = o.getGood();
		//1.插入货物表
		orderDao.insertGoods(g);
		logger.debug("insert_goods:"+orderDao.insertGoods(g));
      //2.插入订单表信息
		String i = orderDao.insertOrder(o);
		logger.debug("insert_order:"+i);

		return i;
	}
   /**
    * 查询所有的货物类别
    */
	@Override
	public List<GoodsType> selectAllType() {

		return orderDao.selectAllType();
	}
   /**
    * 得到所有配送点信息
    */
	@Override
	public List<SendNode> selectAllNode() {
		// TODO Auto-generated method stub

		return orderDao.selectAllNode();
	}

    /**
     * 多条件联系查询订单（不包含订单状态）
     */
	@Override
	public List<Order> getOrdersbyField(Order order) {

		return orderDao.selectOrderByFileds(order);
	}
    /**
     * 多条件联系查询订单（包含订单状态）
     */
	@Override
	public ArrayList<HashMap<String, Object>> getOrderANDState(Order order,
			String Orderstate) {
	
		List<Order> orderList = orderDao.selectOrderByFileds(order);

		ArrayList<HashMap<String, Object>> ah = OrderUntils.getOrderANDstate(
				orderList, orderDao);
		ArrayList<HashMap<String, Object>> ah1=new ArrayList<HashMap<String, Object>>();
      //判断是否需要查询订单状态
		if (Orderstate.length() > 0) {
			int size = ah.size();
			
			for (int i = 0; i < size; i++) {
				String state = (String) ah.get(i).get("state");
                 //过滤订单状态
				if ((state.trim()).equals(Orderstate.trim())) {
					
					
					ah1.add(ah.get(i));
				}
				
			}
		         return ah1;
		}

		return ah;

	}
   /**
    * 删除订单
    */
	@Override
	public int delOrder(int id) {
		
		return orderDao.deleteOrder(id);

	}
    /**
     * 更新订单
     */
	@Override
	public int updateOrder(Order o) {
		return orderDao.updateOrder(o);

	}

	@Override
	public void delOrders(String orders) {
		String ids[] = orders.split(",");//解析订单id
       
		for (int i = 0; i < ids.length; i++) {

			int id = Integer.parseInt(ids[i]);
			orderDao.deleteOrder(id);//根据id删除订单

		}
	}

}
