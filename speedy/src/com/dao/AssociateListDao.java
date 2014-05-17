package com.dao;

import java.util.List;
import java.util.Map;

import com.pojo.AssQResult;
import com.pojo.AssociateList;
import com.pojo.Car;
import com.pojo.Goods;
import com.pojo.GoodsState;
import com.pojo.Order;
/**
 * 交接单dao
 * @author fh
 *
 */
public interface AssociateListDao {
	/**
	 * 查询货物状态表下一站为本交接站的货物状态表
	 * @param nname
	 * @return 返回货物状态表
	 */
		List<GoodsState> selectByNodeName(String nname);
	/**
	 * 	订单id查订单表
	 * @param orderid
	 * @return 返回订单表
	 */
		List<Order> selectByOrderId(Integer orderid);
	/**
	 * 	从订单表获取货物表
	 * @param order
	 * @return 返回货物表
	 */
		List<Goods> selectGoodOfOrder(Integer orderid);
		/**
		 * 根据条件分页查询交接单
		 * 
		 * @param params
		 *            查询条件及分页条件
		 * @return 查询结果
		 */
		List<AssQResult> selectByCond(Map<String, Object> params);
		/**
		 * 根据条件查询总记录数
		 * 
		 * @param params
		 *            查询条件
		 * @return 总记录数
		 */
		int getTotalRecord(Map<String, Object> params);
		
		void insertAss(AssociateList ass);
}
