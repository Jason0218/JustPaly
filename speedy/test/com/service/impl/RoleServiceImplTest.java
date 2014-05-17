package com.service.impl;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;

import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.base.BasicTest;
import com.mchange.util.AssertException;
import com.pojo.Permission;
import com.pojo.Role;
import com.service.RoleService;

@RunWith(SpringJUnit4ClassRunner.class)
public class RoleServiceImplTest extends BasicTest {
	@Autowired
	private RoleService roleService;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testSelectAll() {
		List<Role> list = roleService.selectAll();
		assertEquals(2, list.size());
	}

	@Test
	public void testInsert() {
		Role role = new Role();
		role.setRname("admin");
		boolean flag = roleService.insert(role);
		assertEquals(true, flag);
	}

	@Test
	public void testSelectByRname() {
		Role role = roleService.selectByRname("BOSS");
		assertEquals("BOSS", role.getRname());
	}

	@Test
	public void testSerPms() {
		boolean flag = roleService.serPms(1, 1);
		assertEquals(true, flag);
	}

	@Test
	public void testDelete() {
		boolean flag = roleService.delete(2000);
		assertEquals(true, flag);
	}

	@Test
	public void testDeleteMany() {
		Integer[] rids = new Integer[] { 2001, 2002 };
		boolean flag = roleService.deleteMany(rids);
		assertEquals(true, flag);
	}

	@Test
	public void testShowRolePms() {
		List<Permission> list=roleService.showRolePms(1000);
		assertEquals(16, list.size());
	}

	@Test
	public void testShowElseRolePms() {
		List<Permission> list=roleService.showElseRolePms(1000);
		assertEquals(0, list.size());
	}

	@Test
	public void testSelectById() {
		Role role=roleService.selectById(1);
		assertEquals("boss", role.getRname());
	}

	@Test
	public void testRemoveRolePms() {
		boolean flag=roleService.removeRolePms(1);
		assertEquals(true, flag);
	}

}
