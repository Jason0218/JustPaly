package com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.log4j.Logger;
import com.common.Page;
import com.dao.UserDao;

import com.pojo.User;
import com.service.UserService;

/**
 * userservice接口实现类
 * 
 * @author hwz
 * 
 */
public class UserServiceImpl implements UserService {
	private UserDao userDao;
	// userdao接口对象
	Logger log = Logger.getLogger(UserServiceImpl.class);

	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	/**
	 * 插入
	 */
	@Override
	public void insertUser(User user) {
		userDao.insertUser(user);

	}

	/**
	 * 根据用户名查询
	 */
	public User selectByUsername(String username) {
		return userDao.selectByUsername(username);
	}

	/**
	 * 根据查询条件查询用户
	 */
	@Override
	public List<User> selectByCondition(User user, Page page) {
		Map<String, Object> params = new HashMap<String, Object>();// 设置参数，map类型存储
		params.put("username", user.getUsername());
		params.put("sex", user.getSex());
		params.put("age", user.getAge());
		params.put("address", user.getAddress());
		int start = page.getBeginIndex();// 分页时起始索引
		int end = page.getEndIndex();// 分页时结束索引
		log.debug("start：" + start);
		log.debug("end：" + end);
		params.put("start", start);
		params.put("end", end);
		return userDao.selectByCondition(params);
	}

	/**
	 * 根据查询条件获得总页数
	 */
	@Override
	public int getTotalPage(User user) {
		int getTotalRec = getTotalRec(user);
		Page page = new Page();
		page.setTotal(getTotalRec);// 返回总页数
		return page.getTotalPage();
	}

	/**
	 * 根据查询条件获得总记录数
	 */
	@Override
	public int getTotalRec(User user) {
		Map<String, Object> params = new HashMap<String, Object>();// 设置参数，map存储
		params.put("username", user.getUsername());
		params.put("sex", user.getSex());
		params.put("age", user.getAge());
		params.put("address", user.getAddress());
		int totalRec = userDao.getTotalRec(params);
		return totalRec;
	}

	/**
	 * 根据id查询
	 */
	@Override
	public User selectByUserId(Integer id) {
		return userDao.selectByUserId(id);
	}

	/**
	 * 更新
	 */
	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);

	}

	/**
	 * 根据id删除
	 */
	@Override
	public void deleteUser(Integer id) {
		userDao.deleteUser(id);

	}

	/**
	 * 群删
	 */
	@Override
	public boolean deleteUserByIds(Integer... ids) {
		for (Integer id : ids) {
			User user = userDao.selectByUserId(id);
		}
		for (Integer id : ids) {
			userDao.deleteUser(id);
		}
		return true;
	}

	/**
	 * 更新状态
	 */
	@Override
	public void updateState(User user) {
		userDao.updateState(user);
	}

}
