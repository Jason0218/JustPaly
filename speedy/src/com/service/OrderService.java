package com.service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import  com.pojo.*;
/**
 * service层接口
 * @author zhangjiayi
 *
 */
public interface OrderService
{
	/**
	 * 根据id查询订单
	 * @param ids 由订单号组成的字符串
	 * @return
	 */
   ArrayList<Order> getOrdersbyids(String ids);
   /**
    * 插入订单
    * @param o
    * @return
    */
   String insertOrder(Order o);
   /**
    * 得到所有的货物类别
    * @return
    */
   List<GoodsType> selectAllType();
   /**
    * 得到所有的配送点信息
    * @return
    */
   List<SendNode> selectAllNode();
/**
 * 多条件查询訂單
 * @param order 封装订单信息
 * @return
 */
  List<Order> getOrdersbyField(Order order);
/**
 * 查询多个订单
 * @param oid
 * @return
 */
  Order selectOrder(int oid);
  /**
   * 删除多个信息
   * @param id
   * @return
   */
  int delOrder(int id);
/**
 * 订单的跟新
 * @param o
 * @return
 */
  int updateOrder(Order o);
  /**
   * 获取订单状态的订单信息
   * @param order
   * @param Orderstate
   * @return
   */
  ArrayList<HashMap<String, Object>> getOrderANDState(Order order,
		String Orderstate);
  /**
   * 删除多个订单
   * @param string
   */
   void delOrders(String string);
}
