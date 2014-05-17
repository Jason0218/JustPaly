package com.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.common.Page;
import com.dao.CarDao;
import com.pojo.Car;

/**
 * CarDao接口的实现类
 * 
 * @author huijunjie
 * 
 */
public class CarDaoImpl implements CarDao {
	/** SqlSession对象 */
	private SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertCar(Car car) {
		sqlSession.insert("insertCar", car);
	}

	@Override
	public Car selectById(String carId) {
		return (Car) sqlSession.selectOne("selectById", carId);
	}

	@Override
	public List<Car> selectByCond(Map<String, Object> params) {
		List<Car> list = sqlSession.selectList("selectByCond", params);
		return list;
	}

	@Override
	public int getTotalRecord(Map<String, Object> params) {
		List<Car> list = sqlSession.selectList("getTotalRecord", params);
		return list.size();
	}

	@Override
	public Car selectByCarId(Integer id) {
		Car car = (Car) sqlSession.selectOne("selectByCarId", id);
		return car;
	}

	@Override
	public void updateCar(Car car) {
		sqlSession.update("updateCar", car);
	}

	@Override
	public void deleteCar(Integer id) {
		sqlSession.delete("deleteCar", id);
	}

	@Override
	public List<Car> selectByState(Car car) {
		List<Car> carList = sqlSession.selectList("selectByState", car);
		return carList;
	}

}
