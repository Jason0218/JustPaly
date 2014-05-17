package com.service.impl;

import static org.junit.Assert.*;

import java.util.List;

import javax.annotation.Resource;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;



import com.base.BasicTest;
import com.pojo.Route;
import com.service.RouteService;
public class RouteServiceTest extends BasicTest{
	
	@Resource
	private RouteService routeService;
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
		System.out.println("test getAll()");
        List<Route> list = routeService.getAll();
        System.out.println(list.size());;
	}
	
	@Test
	public void insertRoute() {
		// TODO Auto-generated method stub
		Route route = new Route();
		route.setRoutefrom("南京");
		route.setRouteto("广州");
		route.setRoutename("南京广州");
		routeService.insertRoute(route);
		System.out.println("test insert()");
	}

	@Test
	public void deleteRoute() {
		// TODO Auto-generated method stub
		System.out.println("test delete()");
		routeService.deleteRoute(1020);
	}
	
	@Test
	public void updateRoute() {
		// TODO Auto-generated method stub
       System.out.println("test update()");
		Route route = new Route();
        route.setId(1022);
        route.setRoutefrom("扬州");
        route.setRouteto("上海");
        route.setRoutename("扬州上海");
        routeService.updateRoute(route);
	}
	
	@Test
    public void selectRouteByName() {
		// TODO Auto-generated method stub
	   System.out.println("test selectRouteByName()");
       List<Route> list =  routeService.selectRouteByName("北京广州");
       assertEquals(1, list.size());
	}
}
