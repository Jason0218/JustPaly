package com.dao.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dao.RouteDao;
import com.pojo.Route;
import com.pojo.TotalRoute;
import com.pojo.User;
/**
 * 实现线路dao层的接口
 * @author weitao
 *
 */
public class RouteDaoImpl implements RouteDao {

	 private SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	/**
	 * 得到所有线路表的信息
	 */
	@Override
	public List<Route> getAll() {
		// TODO Auto-generated method stub
		List<Route> list = new ArrayList<Route>();
		list = sqlSession.selectList("selectAllRoute");
		return list;
	}
	
	/**
	 * 插入一条线路信息
	 */
	@Override
	public void insertRoute(Route route) {
		sqlSession.insert("insertRoute", route);
	}

	/**
	 * 删除一条线路信息
	 */
	@Override
	public void deleteRoute(int id) {
		sqlSession.delete("deleteRoutes",id);
	}
	
	/**
	 * 更新一条线路信息
	 */
	@Override
	public void updateRoute(Route route) {
	    sqlSession.update("updateRoute",route);
	}
	
	/**
	 * 是否存在该线路的名称
	 */
	@Override
	public List<Route> getRouteByName(String routename) {
		List<Route> list = new ArrayList<Route>();
		list = sqlSession.selectList("selectRouteByName",routename);
		return list;
	}
	
	/**
	 * 分页显示线路信息
	 */
	@Override
	public List<Route> selectRouteByCondition(Map<String, Object> params) {
		List<Route> list = sqlSession.selectList("selectRouteByCondition", params);
		return list;
	}

}
