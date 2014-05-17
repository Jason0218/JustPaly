package com.service;

import java.util.List;
import java.util.Map;

import com.common.Page;
import com.pojo.Route;
import com.pojo.User;

/**
 * route的服务层接口
 * @author weitao
 *
 */
public interface RouteService {

	
	/**
	 * 得到所有的线路信息
	 * @return List<Route> 
	 */
	List<Route> getAll();
	
	
	/**
	 * 是否存在该线路名
	 * @param routename
	 * @return List<Route>
	 */
	List<Route> selectRouteByName(String routename);

	
	/**
	 * 插入一条线路信息
	 * @param route
	 */
	void insertRoute(Route route);
	
	
	/**
	 * 根据id删除线路信息
	 * @param id
	 */
	void deleteRoute(int id);

	/**
	 * 更新一条线路信息
	 * @param route
	 */
	void updateRoute(Route route);
	
	
	List<Route> selectRouteByCondition(Route route, Page page);
	
	/**
	 * 分页查询线路信息
	 * @param map
	 * @return
	 */
	List<Route> selectRouteByCondition(Map map);
	
}
