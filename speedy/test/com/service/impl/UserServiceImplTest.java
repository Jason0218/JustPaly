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
import com.pojo.User;
import com.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
public class UserServiceImplTest extends BasicTest {
	@Autowired
	private UserService userService;

	@Before
	public void setUp() throws Exception {
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void testInsertUser() {
		User user = new User();
		user.setUsername("hwxs");
		user.setPassword("111111");
		user.setAddress("南京");
		user.setAge("20");
		user.setId(991);
		user.setEmail("123@qq.com");
		user.setRid(1);
		user.setNode_id(1);
		user.setSex("女");
		user.setTel("11122233311");
		userService.insertUser(user);
	}

	@Test
	public void testSelectByUsername() {
		String username = "钱一";
		User user = userService.selectByUsername(username);
		assertEquals("钱一", user.getUsername());
	}

	@Test
	public void testSelectByCondition() {
		Page page = new Page();
		page.setCurPage(1);
		page.setNumPerPage(5);
		User user = new User();
		user.setUsername("钱");
		List<User> userList = userService.selectByCondition(user, page);
		for (User c : userList) {
			System.out.println(c.getUsername());
		}
	}

	@Test
	public void testGetTotalPage() {
		User user = new User();
		user.setUsername("钱");
		int totalPage = userService.getTotalPage(user);
		assertEquals(2, totalPage);
	}

	@Test
	public void testGetTotalRec() {
		User user = new User();
		user.setUsername("钱");
		int totalRec = userService.getTotalRec(user);
		assertEquals(8, totalRec);
	}

	@Test
	public void testSelectByUserId() {
		int id = 1;
		User user = userService.selectByUserId(id);
		assertEquals("钱一", user.getUsername());
	}

	@Test
	public void testUpdateUser() {
		User user = new User();
		user.setAddress("北京");
		user.setUsername("hwxxx");
		user.setPassword("222222");
		user.setAge("20");
		user.setId(999);
		user.setEmail("123@qq.com");
		user.setRid(1);
		user.setNode_id(1);
		user.setSex("女");
		user.setState(0);
		user.setTel("11122233311");
		userService.updateUser(user);
	}

	@Test
	public void testDeleteUser() {
		userService.deleteUser(33);
	}

	@Test
	public void testDeleteUserByIds() {
		Integer[] ids = new Integer[] { 33, 34 };
		userService.deleteUserByIds(ids);
	}

}
