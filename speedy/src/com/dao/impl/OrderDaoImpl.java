package com.dao.impl;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.BasicConfigurator;

import com.dao.OrderDao;
import com.pojo.Goods;
import com.pojo.GoodsState;
import com.pojo.GoodsType;
import com.pojo.Order;
import com.pojo.SendNode;
import com.service.OrderService;

/**
 * 订单表的操作
 * 
 * @author zhangjiayi
 * 
 */
public class OrderDaoImpl implements OrderDao
{
	private SqlSession sqlSession;
	private Log logger = LogFactory.getLog(OrderDao.class);

	public SqlSession getSqlSession()
	{
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession)
	{
		this.sqlSession = sqlSession;
	}

	/**
	 * 根据id查询订单
	 */
	@Override
	public Order queryOrderbyId(int id)
	{
		BasicConfigurator.configure();
		logger.debug("query_orderid:" + id);
		Order o = sqlSession.selectOne("selectOrder_by_id", id);

		return o;
	}

	/**
	 * 根据id查询订单
	 */
	@Override
	public Order queryOrderbyId2(int id)
	{
		BasicConfigurator.configure();
		logger.debug("queryOrderbyId2_orderid:" + id);
		Order o = sqlSession.selectOne("selectOrder_by_id2", id);

		return o;
	}

	/**
	 * 插入订单
	 */
	@Override
	public String insertOrder(Order o)
	{
		BasicConfigurator.configure();
		logger.debug("insertOrder_order:" + o.getAccepeter() + ":"
				+ o.getAddress());
		int i = sqlSession.insert("Insert_order", o);
		return i + "";
	}

	/**
	 * 插入货物
	 */
	@Override
	public int insertGoods(Goods good)
	{
		BasicConfigurator.configure();
		logger.debug("insertGoods_good:" + good.getGoodsName());
		sqlSession.insert("Insert_good", good);

		return 1;
	}

	/**
	 * 查询所有的货物类别
	 */
	@Override
	public List<GoodsType> selectAllType()
	{
		BasicConfigurator.configure();
		List<GoodsType> types = sqlSession.selectList("selectAllType");

		return types;
	}

	/**
	 * 根据user_id查询员工归属配送点
	 */
	public int getNodeIdbyEmp(int empid)
	{
		BasicConfigurator.configure();
		int nodeid = sqlSession.selectOne("getNodeidbyEmp", empid);

		return nodeid;
	}

	/**
	 * 查询所有配送点
	 */
	@Override
	public List<SendNode> selectAllNode()
	{
		BasicConfigurator.configure();
		List<SendNode> sendNodeList = sqlSession
				.selectList("selectAllSendNode");

		return sendNodeList;
	}

	@Override
	public List<Order> selectOrderByFileds(Order order)
	{
		BasicConfigurator.configure();
		List<Order> l = sqlSession.selectList("SelectOrderByFields", order);
		return l;
	}

	@Override
	public GoodsState selectGoodsStateByOrderId(int oid)
	{
		BasicConfigurator.configure();
		logger.debug("selectGoodsStateByOrderId_orderid:" + oid);
		GoodsState gs = sqlSession.selectOne("getGoodStatebyOrderId", oid);
		return gs;
	}
    /**
     * 删除订单信息
     */
	@Override
	public int deleteOrder(int id)
	{
		// 删除订单
		BasicConfigurator.configure();
		logger.debug("deleteOrder_orderid:" + id);
		return sqlSession.delete("delOrderById", id);
	}
    /**
     * 更新订单信息
     */
	@Override
	public int updateOrder(Order order)
	{
		BasicConfigurator.configure();
		// 更新订单表信息
		sqlSession.update("updateOrderbyId", order);
		// 更新货物表信息
		sqlSession.update("updategood", order.getGood());
		return 1;
	}

}
