package com.service.impl;




import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.base.BasicTest;
import com.common.OrderUntils;
import com.pojo.Goods;
import com.pojo.Order;
import com.service.OrderService;
@RunWith(SpringJUnit4ClassRunner.class)
public class TestOrderServiceImpl  extends BasicTest
{   @Autowired
	private OrderService orderService;
	private Order order;
	private Goods good;
	@Before
	public void setUp() throws Exception {
		good=new Goods();
		good.setGoodsName("家伙asdas");
		good.setTypeId(1);
		good.setVolume(100);
		good.setWeight(12);
	
		order=new Order();
		order.setGood(good);
		order.setAccepetdate(OrderUntils.getNowDate());
		order.setAccepeter("张三");
		order.setAccepterphonenum("123123");
		order.setAddress("hao");
		order.setDestn("上海sdasd");
		order.setEmail("asdasd");
		order.setGoodsamount(1);
		order.setMateprice(11);
		order.setNodeid(1);
		order.setPrice(11);
		order.setProteprice(11.2);
		order.setScope("scopesss");
		order.setSenddate(OrderUntils.getNowDate());
		order.setSender("zhang加以");
		order.setSendprice(1122);
		order.setTotalprice(1212312);
		order.setUser_id(1);
	}

	@After
	public void tearDown() throws Exception {
	}
	@Test
    public void selectOneorder(){
   	 
		orderService.selectOrder(183);
   	 
    }  
	@Test
	public void selectOrders(){
		orderService.getOrdersbyids("162,163");
		
	}
	@Test
	public void selectOrdersByFields(){
		orderService.getOrdersbyField(order);
		
	}
	@Test
	public void insertorder(){
		orderService.insertOrder(order);
		
		
	}
	@Test
	public void updateTest(){
		order.setId(183);
		order.getGood().setId(183);
		orderService.updateOrder(order);
		
	}
	@Test
	public void delOrder(){
		
		 orderService.delOrders("182,181");
	}
	@Test
	public void selectAllnodes(){
		orderService.selectAllNode();
		
	}  
	@Test
	public void selectAlltype(){
		
		orderService.selectAllType();
		
	}
}
