package com.dao.impl;

import org.apache.ibatis.session.SqlSession;

import com.dao.SetOutTimeDao;
import com.pojo.SetOutTime;

/**
 * SetOutTimeDao的实现类
 * 
 * @author huijunjie
 * 
 */
public class SetOutTimeDaoImpl implements SetOutTimeDao {
	/** SqlSession对象 */
	private SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertTime(SetOutTime time) {
		sqlSession.insert("insertTime", time);
	}

	@Override
	public SetOutTime selectByCarId(Integer id) {
		return (SetOutTime) sqlSession.selectOne("selectByCarId1", id);
	}

}
