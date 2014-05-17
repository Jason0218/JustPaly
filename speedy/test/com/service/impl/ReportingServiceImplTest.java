package com.service.impl;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.pojo.AcceptForm;
import com.pojo.Companyreportform;
import com.pojo.SendForm;
import com.service.ReportingService;
import com.util.PageBean;


public class ReportingServiceImplTest {
	@Autowired
	private ReportingService reportService;
	
	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	



	@Test
	public void testGetReportById() {
		Companyreportform comrepform=reportService.getReportById(2);
		assertEquals(2,comrepform.getId());
	}

	@Test
	public void testQueryForPage() {
		PageBean<Companyreportform> pageBean=reportService.queryForPage("CompanyreportformQueryAll", 1, 5,"");
		assertEquals(1,pageBean.getTotalPage());
	}

	@Test
	public void testQueryAll() {
		List<Companyreportform> computers=reportService.queryAll("queryForAllByNone", "");
		assertEquals(4,computers.size());
	}

	@Test
	public void testGetSendFormById() {
		SendForm sendform=reportService.getSendFormById(2);
		assertEquals(2,sendform.getId());
	}

	@Test
	public void testGetAcceptFormById() {
		AcceptForm acceptform=reportService.getAcceptFormById(2);
		assertEquals(2,acceptform.getId());
	}

	@Test
	public void testQueryAll2() {
		List<SendForm> sendform=reportService.queryAll2("SendByNone", "");
		assertEquals(4,sendform.size());
	}

	@Test
	public void testQueryForPage2() {
		PageBean<SendForm> sendform=reportService.queryForPage2("SendnodeformQueryAll", 1, 5, "");
		assertEquals(1,sendform.getTotalPage());
	}

	@Test
	public void testQueryAll3() {
		List<AcceptForm> acceptform=reportService.queryAll3("AcceptByNone", "");
		assertEquals(4,acceptform.size());
	}

	@Test
	public void testQueryForPage3() {
		PageBean<AcceptForm> acceptform=reportService.queryForPage3("AcceptformQueryAll", 1, 5, "");
		assertEquals(1,acceptform.getTotalPage());
		
	}

}
