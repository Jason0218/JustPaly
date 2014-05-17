package com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import com.common.Page;
import com.dao.CarDao;
import com.pojo.Car;
import com.service.CarService;

/**
 * CarService接口的实现类
 * 
 * @author huijunjie
 * @version 1.0
 */
public class CarServiceImpl implements CarService {
	/** CarDao接口对象 */
	private CarDao carDao;
	Logger log = Logger.getLogger(CarServiceImpl.class);

	public CarDao getCarDao() {
		return carDao;
	}

	public void setCarDao(CarDao carDao) {
		this.carDao = carDao;
	}

	@Override
	public void insertCar(Car car) {
		carDao.insertCar(car);
	}

	@Override
	public Car selectById(String carId) {
		return carDao.selectById(carId);
	}

	@Override
	public List<Car> selectByCond(Car car, Page page) {
		Map<String, Object> params = new HashMap<String, Object>();
		// 设置参数，map类型存储
		params.put("carId", car.getCarId());// 车牌号码
		params.put("deadweight", car.getDeadweight());// 载重
		params.put("volume", car.getVolume());// 体积
		params.put("state", car.getState());// 状态
		int start = page.getBeginIndex();// 分页时起始索引
		int end = page.getEndIndex();// 分页时结束索引
		log.debug("start：" + start);
		log.debug("end:" + end);
		params.put("start", start);
		params.put("end", end);
		return carDao.selectByCond(params);
	}

	@Override
	public int getTotalPage(Car car) {
		// 根据条件查询出总记录数
		int totalRecord = getTotalRecord(car);
		Page page = new Page();
		page.setTotal(totalRecord);
		// 返回总页数
		return page.getTotalPage();
	}

	@Override
	public int getTotalRecord(Car car) {
		Map<String, Object> params = new HashMap<String, Object>();
		// 设置参数，map存储
		params.put("carId", car.getCarId());
		params.put("deadweight", car.getDeadweight());
		params.put("volume", car.getVolume());
		params.put("state", car.getState());
		// 查询总记录
		int totalRecord = carDao.getTotalRecord(params);
		return totalRecord;
	}

	@Override
	public Car selectByCarId(Integer id) {
		return carDao.selectByCarId(id);
	}

	@Override
	public void updateCar(Car car) {
		carDao.updateCar(car);
	}

	@Override
	public void deleteCar(Integer id) {
		carDao.deleteCar(id);
	}

	@Override
	public boolean deleteCarByIds(Integer... ids) {
		for (Integer id : ids) {
			Car car = carDao.selectByCarId(id);
			// 出行状态的车辆不能删除
			if (car.getState().equals("出行")) {
				return false;
			}
		}
		// 没有出行状态车辆则全部删除
		for (Integer id : ids) {
			carDao.deleteCar(id);
		}
		return true;
	}

	@Override
	public List<Car> selectByState(Car car) {
		List<Car> carList = carDao.selectByState(car);
		return carList;
	}

}
