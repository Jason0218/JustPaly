package com.service.impl;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.base.BasicTest;
import com.pojo.SetOutTime;
import com.service.SetOutTimeService;

@RunWith(SpringJUnit4ClassRunner.class)
public class SetOutTimeServiceImplTest extends BasicTest {
	@Autowired
	private SetOutTimeService timeService;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testInsertTime() {
		SetOutTime time = new SetOutTime();
		time.setCarid(1004);
		time.setSetouttime(new Date());
		timeService.insertTime(time);
	}

	@Test
	public void testSelectByCarId() {
		SetOutTime time = timeService.selectByCarId(1004);
		assertEquals((Integer)2020, time.getId());
	}

}
