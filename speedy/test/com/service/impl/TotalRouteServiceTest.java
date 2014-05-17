package com.service.impl;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;

import com.pojo.TotalRoute;
import com.service.TotalRouteService;

public class TotalRouteServiceTest {

	@Resource
	private TotalRouteService totalRouteService;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	      System.out.println("BeforeClass");
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
	      System.out.println("AfterClass"); 
	}

	@Before
	public void setUp() throws Exception {
	      System.out.println("Before"); 
	}

	@After
	public void tearDown() throws Exception {
	      System.out.println("After");
	}
   
	@Test
	public void getAll() {
		// TODO Auto-generated method stub
        List<TotalRoute> list = totalRouteService.getAll();
        assertEquals(6, list.size());
	}
	
	@Test
	public void insertTotalRoute() {
		// TODO Auto-generated method stub
		TotalRoute totalRoute = new TotalRoute();
		totalRoute.setRoutenum("11232");
		totalRoute.setStartnode("上海");
		totalRoute.setEndpoint("深圳");
		totalRoute.setAcrossnoade("合肥，南京");
		totalRoute.setRoute_id(1011);
        totalRouteService.insertTotalRoute(totalRoute);
	}

	@Test
	public void deleteTotalRoute() {
		// TODO Auto-generated method stub
        totalRouteService.deleteTotalRoute(1025);
	}
	
	@Test
	public void updateTotalRoute() {
		// TODO Auto-generated method stub
        TotalRoute totalRoute = new TotalRoute();
        totalRoute.setId(1032);
        totalRoute.setAcrossnoade("合肥");
        totalRouteService.updateTotalRoute(totalRoute);
	}
}
