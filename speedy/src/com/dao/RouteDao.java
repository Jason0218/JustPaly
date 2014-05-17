package com.dao;

import java.util.List;
import java.util.Map;

import com.pojo.Route;
import com.pojo.TotalRoute;
import com.pojo.User;
/**
 * 线路的dao层的接口
 * @author weitao
 *
 */
public interface RouteDao {


    /**
     * 得到所有线路表的信息
     * @return  List<Route>类型
     */
	List<Route> getAll();
	
	
	/**
	 * 是否存在该线路的名称
	 * @param routename 类型Stirng线路名
	 * @return
	 */
	List<Route> getRouteByName(String routename);
	
	/**
	 * 插入一条线路数据
	 * @param route 插入线路表的线路对象
	 */
	void insertRoute(Route route);
	
	/**
	 * 通过id删除线路
	 * @param id 线路表中线路对象的id
	 */
	void deleteRoute(int id);
	
    /**
     * 更新线路信息
     * @param route  需要更新的线路信息
     */
	void updateRoute(Route route);
	
	/**
	 * 分页查询出线路的信息
	 * @param params map
	 * @return List<Route>类型
	 */
	List<Route> selectRouteByCondition(Map<String, Object> params);


}
