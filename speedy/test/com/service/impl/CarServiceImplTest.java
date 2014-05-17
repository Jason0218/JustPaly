package com.service.impl;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.base.BasicTest;
import com.common.Page;
import com.pojo.Car;
import com.service.CarService;

@RunWith(SpringJUnit4ClassRunner.class)
public class CarServiceImplTest extends BasicTest{
	@Autowired
	private CarService carService;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testInsertCar() {
		Car car = new Car();
		car.setCarId("��C-55552");
		car.setCarDriver("����");
		car.setDeadweight(21.0);
		car.setVolume(33.0);
		car.setState("����");
		carService.insertCar(car);
	}

	@Test
	public void testSelectById() {
		String carId = "��C-21342";
		Car car = carService.selectById(carId);
		assertEquals("��C-21342", car.getCarId());
	}

	@Test
	public void testSelectByCond() {
		Page page = new Page();
		page.setCurPage(1);
		page.setNumPerPage(5);
		Car car = new Car();
		car.setCarId("��");
		List<Car> carList = carService.selectByCond(car, page);
		for (Car c : carList) {
			System.out.println(c.getCarId());
		}
	}

	@Test
	public void testGetTotalPage() {
		Car car = new Car();
		car.setCarId("��");
		int totalPage = carService.getTotalPage(car);
		assertEquals(2, totalPage);
	}

	@Test
	public void testGetTotalRecord() {
		Car car = new Car();
		car.setCarId("��");
		int totalRecord = carService.getTotalRecord(car);
		assertEquals(9, totalRecord);
	}

	@Test
	public void testSelectByCarId() {
		int id = 2000;
		Car car = carService.selectByCarId(id);
		assertEquals("��C-21342", car.getCarId());
	}

	@Test
	public void testUpdateCar() {
		Car car = new Car();
		car.setId(2000);
		car.setCarId("��C-21342");
		car.setCarDriver("������");
		car.setDeadweight(25.0);
		car.setVolume(42.0);
		car.setState("����");
		carService.updateCar(car);
	}

	@Test
	public void testDeleteCar() {
		carService.deleteCar(2000);
	}

	@Test
	public void testDeleteCarByIds() {
		Integer[] ids = new Integer[]{2001,2002};
		carService.deleteCarByIds(ids);
	}

	@Test
	public void testSelectByState() {
		Car car = new Car();
		car.setState("����");
		List<Car> carList = carService.selectByState(car);
		for (Car c : carList) {
			System.out.println(c.getCarId());
		}
	}

}
