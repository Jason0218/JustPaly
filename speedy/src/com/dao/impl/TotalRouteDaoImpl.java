package com.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.TotalRouteDao;
import com.pojo.TotalRoute;

/**
 * 实现总线路dao层的接口
 * @author weitao
 *
 */
public class TotalRouteDaoImpl implements TotalRouteDao {

	private SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	/**
	 * 得到所有总线路中的信息
	 */
	@Override
	public List<TotalRoute> getAllTotalRoutes() {
		List<TotalRoute> list = new ArrayList<TotalRoute>();
		list = sqlSession.selectList("selectTotalRouteByRoute");
		return list;
	}

	/**
	 * 查询总线路信息通过id
	 */
	@Override
	public List<TotalRoute> getAllTotalRouteById(int id) {
		List<TotalRoute> list = new ArrayList<TotalRoute>();
		list = sqlSession.selectList("selectTotalRouteById",id);
		return list;
	}
    /**
     * 通过编号查询总线路信息
     */
	@Override
	public List<TotalRoute> getAllTotalRouteByNum(String s) {
		List<TotalRoute> list = new ArrayList<TotalRoute>();
		list = sqlSession.selectList("selectTotalRouteByNum",s);
		return list;
	}

	/**
	 * 通过线路名查询总线路信息
	 */
	@Override
	public List<TotalRoute> getAllTotalRouteByName(String name) {
		List<TotalRoute> list = new ArrayList<TotalRoute>();
		list = sqlSession.selectList("selectTotalRouteByName",name);
		return list;
	}

	/**
	 * 插入总线路信息
	 */
	@Override
	public void insertTotalRoute(TotalRoute totalRoute) {
		// TODO Auto-generated method stub
		sqlSession.insert("insertTotalRoute",totalRoute);
	}

	/**
	 * 删除线路信息通过id
	 */
	@Override
	public void deleteRoute(int id) {
		// TODO Auto-generated method stub
		sqlSession.delete("deleteTotalRoute", id);
	}

	/**
	 * 更新总线路的信息
	 */
	@Override
	public void updateTotalRoute(TotalRoute totalRoute) {
		sqlSession.update("updateTotalRoute", totalRoute);
	}


}
