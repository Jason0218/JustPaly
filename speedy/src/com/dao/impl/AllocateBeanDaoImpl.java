package com.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.AllocateBeanDao;
import com.pojo.AllocateBean;

/**
 * AllocateBeanDao的实现类
 * 
 * @author huijunjie
 * 
 */
public class AllocateBeanDaoImpl implements AllocateBeanDao {
	/** SqlSession对象 */
	private SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<AllocateBean> selectAll(AllocateBean allocate) {
		List<AllocateBean> list = sqlSession.selectList("selectAll", allocate);
		return list;
	}

}
