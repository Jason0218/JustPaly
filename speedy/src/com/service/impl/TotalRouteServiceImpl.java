package com.service.impl;

import java.util.List;

import com.dao.TotalRouteDao;
import com.pojo.TotalRoute;
import com.service.TotalRouteService;

/**
 * 实现总线路接口的服务层
 * @author weitao
 *
 */
public class TotalRouteServiceImpl implements TotalRouteService{

	private TotalRouteDao totalRouteDao;
	
	/**
	 * 查询所有线路信息
	 */
	@Override
	public List<TotalRoute> getAll() {
		// TODO Auto-generated method stub
		return totalRouteDao.getAllTotalRoutes();
	}
	public TotalRouteDao getTotalRouteDao() {
		return totalRouteDao;
	}
	public void setTotalRouteDao(TotalRouteDao totalRouteDao) {
		this.totalRouteDao = totalRouteDao;
	}
	
	/**
	 * 通过id选择所有的总线路信息
	 */
	@Override
	public List<TotalRoute> getAllById(int id) {
		// TODO Auto-generated method stub
		return totalRouteDao.getAllTotalRouteById(id);
	}
	
	
	/**
	 * 通过编号选择所有的总线路信息
	 */
	@Override
	public List<TotalRoute> getAllByNum(String s) {
		// TODO Auto-generated method stub
		return totalRouteDao.getAllTotalRouteByNum(s);
	}
	
	/**
	 * 通过线路名称选择所有的总线路信息
	 */
	@Override
	public List<TotalRoute> getAllByName(String name) {
		// TODO Auto-generated method stub
		return totalRouteDao.getAllTotalRouteByName(name);
	}
	
	
	/**
	 * 插入一条总线路信息
	 */
	@Override
	public void insertTotalRoute(TotalRoute totalRoute) {
		totalRouteDao.insertTotalRoute(totalRoute);
		
	}
	
	/**
	 * 删除一条总线路信息
	 */
	@Override
	public void deleteTotalRoute(int id) {
		totalRouteDao.deleteRoute(id);
	}
	
	
	/**
	 * 更新一条总线路信息
	 */
	@Override
	public void updateTotalRoute(TotalRoute totalRoute) {
		// TODO Auto-generated method stub
		totalRouteDao.updateTotalRoute(totalRoute);
	}

}
