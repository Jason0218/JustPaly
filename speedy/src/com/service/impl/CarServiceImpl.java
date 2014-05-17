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
 * CarService�ӿڵ�ʵ����
 * 
 * @author huijunjie
 * @version 1.0
 */
public class CarServiceImpl implements CarService {
	/** CarDao�ӿڶ��� */
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
		// ���ò�����map���ʹ洢
		params.put("carId", car.getCarId());// ���ƺ���
		params.put("deadweight", car.getDeadweight());// ����
		params.put("volume", car.getVolume());// ���
		params.put("state", car.getState());// ״̬
		int start = page.getBeginIndex();// ��ҳʱ��ʼ����
		int end = page.getEndIndex();// ��ҳʱ��������
		log.debug("start��" + start);
		log.debug("end:" + end);
		params.put("start", start);
		params.put("end", end);
		return carDao.selectByCond(params);
	}

	@Override
	public int getTotalPage(Car car) {
		// ����������ѯ���ܼ�¼��
		int totalRecord = getTotalRecord(car);
		Page page = new Page();
		page.setTotal(totalRecord);
		// ������ҳ��
		return page.getTotalPage();
	}

	@Override
	public int getTotalRecord(Car car) {
		Map<String, Object> params = new HashMap<String, Object>();
		// ���ò�����map�洢
		params.put("carId", car.getCarId());
		params.put("deadweight", car.getDeadweight());
		params.put("volume", car.getVolume());
		params.put("state", car.getState());
		// ��ѯ�ܼ�¼
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
			// ����״̬�ĳ�������ɾ��
			if (car.getState().equals("����")) {
				return false;
			}
		}
		// û�г���״̬������ȫ��ɾ��
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
