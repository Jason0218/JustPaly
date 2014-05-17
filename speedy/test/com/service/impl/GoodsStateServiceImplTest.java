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
import com.pojo.GoodsState;
import com.service.GoodsStateService;

@RunWith(SpringJUnit4ClassRunner.class)
public class GoodsStateServiceImplTest extends BasicTest {
	@Autowired
	private GoodsStateService goodsStateService;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testInsertState() {
		GoodsState goodsstate = new GoodsState();
		goodsstate.setBagnum("1006");
		goodsstate.setOrderId(1006);
		goodsstate.setNowposition("镇江");
		goodsstate.setNextposition("苏州");
		goodsstate.setArriveTime(new Date());
		goodsStateService.insertState(goodsstate);
	}

	@Test
	public void testUpdateState() {
		GoodsState goodsstate = new GoodsState();
		goodsstate.setId(2020);
		goodsstate.setNowposition("苏州");
		goodsstate.setNextposition("山西");
		goodsstate.setArriveTime(new Date());
		goodsStateService.updateState(goodsstate);
	}

	@Test
	public void testGetByOid() {
		GoodsState goodsstate = goodsStateService.getByOid(1006);
		assertEquals((Integer)2020, goodsstate.getId());
	}

}
