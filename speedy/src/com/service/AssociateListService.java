package com.service;

import java.util.List;


import com.common.Page;
import com.pojo.AssQResult;
import com.pojo.AssociateList;
import com.pojo.Car;
import com.pojo.Goods;
import com.pojo.GoodsState;
import com.pojo.Order;

public interface AssociateListService {
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
	 * 根据条件查交接表所需内容
	 * @param assQResult
	 * @param page
	 * @return
	 */
	List<AssQResult> selectByCond(AssQResult assQResult, Page page,String sjd);
	/**
	 * 根据查询条件获得总页数
	 * 
	 * @param car
	 *            查询条件
	 * @return 总页数
	 */
	int getTotalPage(AssQResult assQResult);

	/**
	 * 根据查询条件获得总记录数
	 * 
	 * @param car
	 *            查询条件
	 * @return 总记录数
	 */
	int getTotalRecord(AssQResult assQResult);
	
	void insertAss(AssociateList ass);
}
