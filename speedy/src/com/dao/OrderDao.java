package com.dao;




import java.util.List;


import com.pojo.Goods;
import com.pojo.GoodsState;
import com.pojo.GoodsType;
import com.pojo.Order;
import com.pojo.SendNode;
/**
 * 
 * @author zhangjiay
 *
 */
public interface OrderDao
{
   /**
    * 根据订单好查询订单
    * @param id
    * @return
    */
	Order queryOrderbyId(int id);
	/**
	 * 插入订单表
	 * @param o
	 * @return
	 */
	String insertOrder(Order o);
	/**
	 * 插入货物表
	 * @param good
	 * @return
	 */
	int insertGoods(Goods good);
	
	/**
	 * 查询所有的货物类别
	 */
	  List<GoodsType>  selectAllType();
	  
	  int getNodeIdbyEmp(int empid);
	  /**
	   * 得到所有的配送点信息
	   * @return
	   */
	 List<SendNode> selectAllNode();
	 /**
	  * 多属性联合查询
	  * @param order
	  * @return
	  */
	List<Order> selectOrderByFileds(Order order);
	/**
	 * 根据order的id查询GoodsState
	 * @return
	 */
	GoodsState selectGoodsStateByOrderId(int oid);
	/**
	 * 删除order
	 * @param id
	 * @return
	 */
	int deleteOrder(int id); 
	
	Order queryOrderbyId2(int id);
	int updateOrder(Order order);
}
