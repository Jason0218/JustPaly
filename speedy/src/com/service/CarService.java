package com.service;

import java.util.List;
import java.util.Map;

import com.common.Page;
import com.pojo.Car;

/**
 * 车辆业务层
 * 
 * @author huijunjie
 * @version 1.0
 */
public interface CarService {
	/**
	 * 新增车辆信息
	 * 
	 * @param car
	 *            要新增的车辆对象
	 */
	void insertCar(Car car);

	/**
	 * 根据id删除车辆
	 * 
	 * @param id
	 *            车辆表id
	 */
	void deleteCar(Integer id);

	/**
	 * 根据id群删
	 * 
	 * @param ids
	 *            id数组
	 * @return true 删除成功 false 删除失败
	 */
	boolean deleteCarByIds(Integer... ids);

	/**
	 * 修改车辆信息
	 * 
	 * @param car
	 *            封装车辆信息
	 */
	void updateCar(Car car);

	/**
	 * 根据车牌号码查询车辆
	 * 
	 * @param carId
	 *            车牌号码
	 * @return 查询结果
	 */
	Car selectById(String carId);

	/**
	 * 根据车辆状态查询车辆
	 * 
	 * @param state
	 *            车辆状态
	 * @return 查询结果
	 */
	List<Car> selectByState(Car car);

	/**
	 * 根据车辆表id查询车辆
	 * 
	 * @param id
	 *            车辆表id
	 * @return 查询结果
	 */
	Car selectByCarId(Integer id);

	/**
	 * 根据查询条件查询车辆
	 * 
	 * @param car
	 *            查询条件
	 * @param page
	 *            分页条件
	 * @return 查询结果
	 */
	List<Car> selectByCond(Car car, Page page);

	/**
	 * 根据查询条件获得总页数
	 * 
	 * @param car
	 *            查询条件
	 * @return 总页数
	 */
	int getTotalPage(Car car);

	/**
	 * 根据查询条件获得总记录数
	 * 
	 * @param car
	 *            查询条件
	 * @return 总记录数
	 */
	int getTotalRecord(Car car);
}
