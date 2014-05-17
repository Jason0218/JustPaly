package com.service.impl;

import static org.junit.Assert.*;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.base.BasicTest;
import com.pojo.AllocateCar;
import com.service.AllocateCarService;

@RunWith(SpringJUnit4ClassRunner.class)
public class AllocateCarServiceImplTest extends BasicTest {
	@Autowired
	private AllocateCarService alloCarService;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testInsertAllo() {
		AllocateCar alloCar = new AllocateCar();
		alloCar.setOrderid(1006);
		alloCar.setCarid(1004);
		alloCar.setDestn("山西");
		alloCar.setNowposition("镇江");
		alloCarService.insertAllo(alloCar);
	}

	@Test
	public void testSelectByCarId() {
		AllocateCar alloCar = alloCarService.selectByCarId(1004);
		assertEquals((Integer)2020, alloCar.getId());
	}

}
