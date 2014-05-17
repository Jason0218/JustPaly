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
import com.pojo.Permission;
import com.service.PermissionService;

@RunWith(SpringJUnit4ClassRunner.class)
public class PermissionServiceImplTest extends BasicTest {
	@Autowired
	private PermissionService permissionService;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testSelectAll() {
		List<Permission> list = permissionService.selectAll();
		assertEquals(16, list.size());
	}

	@Test
	public void testSelectByPname() {
		Permission p = permissionService.selectByPname("����û�");
		assertEquals("����û�", p.getPname());
	}

	@Test
	public void testInsertPms() {
		Permission p = new Permission();
		p.setModel(1);
		p.setPname("�ܹ�˾����");
		p.setPurl("report.action");
		boolean flag=permissionService.insertPms(p);
		assertEquals(true, flag);
	}

	@Test
	public void testDeleteById() {
		boolean flag = permissionService.deleteById(2000);
		assertEquals(true, flag);
	}

	@Test
	public void testDeleteByIds() {
		Integer[] pids = new Integer[] { 2001, 2002 };
		boolean flag = permissionService.deleteByIds(pids);
		assertEquals(true, flag);
	}

	@Test
	public void testSelectById() {
		Permission p = permissionService.selectById(2003);
		assertEquals("�ܹ�˾����", p.getPname());
	}

	@Test
	public void testUpdatePms() {
		Permission p = permissionService.selectById(2003);
		p.setPurl("reportTable.jsp");
		boolean flag = permissionService.updatePms(p);
		assertEquals(true, flag);

	}

}
