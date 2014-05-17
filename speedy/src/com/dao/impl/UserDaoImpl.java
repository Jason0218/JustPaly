package com.dao.impl;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dao.UserDao;

import com.pojo.User;

/**
 * userdao 接口实现
 * 
 * @author hwz
 * 
 */

public class UserDaoImpl implements UserDao {
	private SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	/**
	 * 根据id查询
	 */
	public User getUserById(Integer id) {

		User user = (User) sqlSession.selectOne("selectUser_by_id", id);
		return user;
	}

	/**
	 * 插入user
	 */
	@Override
	public void insertUser(User u) {

		sqlSession.insert("insert", u);

	}

	/**
	 * 根据用户名查询
	 */
	public User selectByUsername(String username) {
		return (User) sqlSession.selectOne("selectByUsername", username);
	}

	/**
	 * 根据条件分页查询用户
	 */
	@Override
	public List<User> selectByCondition(Map<String, Object> params) {
		List<User> list = sqlSession.selectList("selectByCondition", params);
		return list;
	}

	/**
	 * 根据条件查询用户总记录数
	 */
	@Override
	public int getTotalRec(Map<String, Object> params) {
		List<User> list = sqlSession.selectList("getTotalRec", params);
		return list.size();
	}

	/**
	 * 更新用户
	 */
	@Override
	public void updateUser(User user) {
		sqlSession.update("updateUser", user);

	}

	/**
	 * 根据id查询
	 */
	@Override
	public User selectByUserId(Integer id) {
		User user = (User) sqlSession.selectOne("selectByUserId", id);
		return user;
	}

	/**
	 * 根据id删除
	 */
	@Override
	public void deleteUser(Integer id) {
		sqlSession.delete("deleteUser", id);
	}

	/**
	 * 更新用户状态
	 */
	@Override
	public void updateState(User user) {
		sqlSession.update("updateState", user);
	}

}
