package com.dao;

import java.util.List;
import java.util.Map;
import com.pojo.User;

/**
 * 用户表接口
 * 
 * @author hwz
 * 
 */
public interface UserDao {
	/**
	 * 根据用户id查询
	 * 
	 * @param id
	 * @return查询结果
	 */
	User getUserById(Integer id);

	/**
	 * 新增用户信息
	 * 
	 * @param user
	 *            要新增的用户对象
	 */
	void insertUser(User u);

	/**
	 * 根据用户名查询用户
	 * 
	 * @param username
	 *            用户名
	 * @return 查询结果
	 */

	User selectByUsername(String username);

	/**
	 * 根据条件分页查询用户
	 * 
	 * @param params
	 *            查询条件及分页条件
	 * @return 查询结果
	 */

	List<User> selectByCondition(Map<String, Object> params);

	/**
	 * 根据条件查询用户总记录数
	 * 
	 * @param params
	 *            查询条件
	 * @return 总记录数
	 */
	int getTotalRec(Map<String, Object> params);

	/**
	 * 更新修改用户信息
	 * 
	 * @param user
	 */

	void updateUser(User user);

	/**
	 * 根据用户id查询
	 * 
	 * @param id
	 * @return查询结果
	 */
	User selectByUserId(Integer id);

	/**
	 * 根据id删除用户
	 * 
	 * @param id
	 */
	void deleteUser(Integer id);

	/**
	 * 更新修改用户的状态
	 * 
	 * @param user
	 */
	void updateState(User user);
}
