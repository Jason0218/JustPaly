package com.service;

import java.util.List;

import com.pojo.Route;
import com.pojo.TotalRoute;

/**
 * 总线路的服务层接口
 * @author new
 *
 */
public interface TotalRouteService {


	/**
	 * 连表查询所有数据
	 * @return List<TotalRoute>
	 */
	List<TotalRoute> getAll();
	
   
	/**
	 * 通过id连表查询所有数据
	 * @param id
	 * @return List<TotalRoute>
	 */
	List<TotalRoute> getAllById(int id);
	

	/**
	 * 通过总线路编号查询所有数据
	 * @param s
	 * @return List<TotalRoute>
	 */
	List<TotalRoute> getAllByNum(String s);
	
	
	/**
	 * 通过线路名称查询所有数据
	 * @param name
	 * @return List<TotalRoute>
	 */
	List<TotalRoute> getAllByName(String name);
	

	/**
	 * 通过id删除总线路信息
	 * @param id
	 */
	
	void deleteTotalRoute(int id);
	
	/**
	 * 插入总线路信息
	 * @param totalRoute
	 */
	void insertTotalRoute(TotalRoute totalRoute);
	
	/**
	 * 更新总线路信息
	 * @param totalRoute
	 */
	void updateTotalRoute(TotalRoute totalRoute);
}
