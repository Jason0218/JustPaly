package com.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.BasicConfigurator;

import com.dao.AssociateListDao;
import com.pojo.AssQResult;
import com.pojo.AssociateList;
import com.pojo.Car;
import com.pojo.Goods;
import com.pojo.GoodsState;
import com.pojo.Order;
import com.pojo.Role;

public class AssociateListDaoImpl implements AssociateListDao {

	private SqlSession sqlSession;
	
	@Override
	public List<GoodsState> selectByNodeName(String nname) {
		// TODO Auto-generated method stub
		List<GoodsState> gsList=sqlSession.selectList("selectGSbyNodeName",nname);
		return gsList;
	}

	@Override
	public List<Order> selectByOrderId(Integer orderid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Goods> selectGoodOfOrder(Integer orderid) {
		// TODO Auto-generated method stub
		return null;
	}

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<AssQResult> selectByCond(Map<String, Object> params) {
		// TODO Auto-generated method stub
		//BasicConfigurator.configure();
		
		List<AssQResult> list = sqlSession.selectList("selectByCond2", params);
		return list;
	}

	@Override
	public int getTotalRecord(Map<String, Object> params) {
		List<AssQResult> list = sqlSession.selectList("selectByCond2", params);
		return list.size();
	}

	@Override
	public void insertAss(AssociateList ass) {
		sqlSession.insert("insertAss", ass);
		
	}



}
