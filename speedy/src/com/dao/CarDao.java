package com.dao;

import java.util.List;
import java.util.Map;

import com.common.Page;
import com.pojo.Car;

/**
 * 车辆表接口
 * 
 * @author huijunjie
 * @version 1.0 2014/04/10
 */
public interface CarDao {
	/**
	 * 新增车辆信息
	 * 
	 * @param car
	 *            要新增的车辆对象
	 */
	void insertCar(Car car);

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
	 * 修改车辆信息
	 * 
	 * @param car
	 *            封装车辆信息
	 */
	void updateCar(Car car);

	/**
	 * 根据车辆表id查询车辆
	 * 
	 * @param id
	 *            车辆表id
	 * @return 查询结果
	 */
	Car selectByCarId(Integer id);

	/**
	 * 根据条件分页查询车辆
	 * 
	 * @param params
	 *            查询条件及分页条件
	 * @return 查询结果
	 */
	List<Car> selectByCond(Map<String, Object> params);

	/**
	 * 根据id删除车辆
	 * 
	 * @param id
	 *            车辆表id
	 */
	void deleteCar(Integer id);

	/**
	 * 根据条件查询总记录数
	 * 
	 * @param params
	 *            查询条件
	 * @return 总记录数
	 */
	int getTotalRecord(Map<String, Object> params);
}
