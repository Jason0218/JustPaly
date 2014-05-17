package com.service;

import java.util.List;

import com.common.Page;

import com.pojo.User;

/**
 * 用户业务层接口
 * 
 * @author hwz
 * 
 */
public interface UserService {
	/**
	 * 新增用户
	 * 
	 * @param user
	 *            要新增的用户对象
	 */
	void insertUser(User user);

	/**
	 * 根据用户名查询用户信息
	 * 
	 * @param username
	 * @return 查询结果
	 */
	User selectByUsername(String username);

	/**
	 * 根据查询条件查询用户
	 * 
	 * @param user
	 *            查询条件
	 * @param page
	 *            分页条件
	 * @return 查询结果
	 */
	List<User> selectByCondition(User user, Page page);

	/**
	 * 根据查询条件获得总记录数
	 * 
	 * @param user
	 *            查询的条件
	 * @return 总的记录
	 */

	int getTotalRec(User user);

	/**
	 * 根据查询条件获得总页数
	 * 
	 * @param user
	 *            查询条件
	 * @return 总的页数
	 */
	int getTotalPage(User user);

	/**
	 * 根据用户id查询用户信息
	 * 
	 * @param id
	 * @return 查询结果
	 */
	User selectByUserId(Integer id);

	/**
	 * 更新用户
	 * 
	 * @param user
	 */

	void updateUser(User user);

	/**
	 * 根据用户id删除相关用户
	 * 
	 * @param id
	 */
	void deleteUser(Integer id);

	/**
	 * 根据id群删
	 * 
	 * @param ids
	 *            ids数组
	 * @return true 删除成功 false 删除失败
	 */
	boolean deleteUserByIds(Integer... ids);

	/**
	 * 更新用户的状态
	 * 
	 * @param user
	 */
	void updateState(User user);
}
