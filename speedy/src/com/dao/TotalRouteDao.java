package com.dao;

import java.util.List;
import java.util.Map;

import com.pojo.Route;
import com.pojo.TotalRoute;
/**
 * 总线路的实体层
 * @author weitao
 *
 */
public interface TotalRouteDao {

	
    /**
     * 连表查询出线路名称和线路的所有属性
     * @return List<TotalRoute>
     */
	List<TotalRoute> getAllTotalRoutes();
	
	
	/**
	 * 通过总线路id连表查询
	 * @param id 总线路表的id
	 * @return List<TotalRoute> 
	 */
	List<TotalRoute>  getAllTotalRouteById(int id);
	

	/**
	 * 通过总线路编号连表查询
	 * @param s String 总线路的编号
	 * @return List<TotalRoute>
	 */
	List<TotalRoute> getAllTotalRouteByNum(String s);
	

	/**
	 * 通过线路名称连表查询
	 * @param name
	 * @return List<TotalRoute>
	 */
	List<TotalRoute> getAllTotalRouteByName(String name);
	

	/**
	 * 通过id删除总线路
	 * @param id
	 */
	void deleteRoute(int id);
	
	/**
	 * 总线路表中插入总线路
	 * @param totalRoute
	 */
	void insertTotalRoute(TotalRoute totalRoute);
	
	/**
	 * 总线路表总的线路中间站修改
	 * @param totalRoute
	 */
	void updateTotalRoute(TotalRoute totalRoute);
	
}
