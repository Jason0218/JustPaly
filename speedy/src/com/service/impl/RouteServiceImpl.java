package com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.common.Page;
import com.dao.RouteDao;
import com.dao.UserDao;
import com.pojo.Route;
import com.pojo.TotalRoute;
import com.service.RouteService;

/**
 * 实现线路接口的服务层
 * @author weitao
 *
 */
public class RouteServiceImpl implements RouteService {

	 private RouteDao routeDao;
	
	 /**
	  * 查询出所有线路信息
	  */
	@Override
	public List<Route> getAll() {
		return routeDao.getAll();
	}
	public RouteDao getRouteDao() {
		return routeDao;
	}
	public void setRouteDao(RouteDao routeDao) {
		this.routeDao = routeDao;
	}

	/**
	 * 插入线路信息
	 */
	@Override
	public void insertRoute(Route route) {
		routeDao.insertRoute(route);
	}
	
	/**
	 * 删除线路信息
	 */
	@Override
	public void deleteRoute(int id) {
		routeDao.deleteRoute(id);
	}
	
	/**
	 * 更新线路信息
	 */
	@Override
	public void updateRoute(Route route) {
	     routeDao.updateRoute(route);	
	}
	
	/**
	 * 是否存在该名字的线路
	 */
	@Override
	public List<Route> selectRouteByName(String routename) {
		return routeDao.getRouteByName(routename);
	}
	
	/**
	 * 通过条件分页查询线路信息
	 */
	@Override
	public List<Route> selectRouteByCondition(Route route, Page page) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("routename", route.getRoutename());
		params.put("routefrom", route.getRoutefrom());
		params.put("routeto", route.getRouteto());
		int start = page.getBeginIndex();
		int end = page.getEndIndex();
		params.put("start", start);
		params.put("end", end);
		return routeDao.selectRouteByCondition(params);
	}
	
	/**
	 * 分页 查询线路信息
	 */
	@Override
	public List<Route> selectRouteByCondition(Map map) {
		// TODO Auto-generated method stub
		return routeDao.selectRouteByCondition(map);
	}
}
