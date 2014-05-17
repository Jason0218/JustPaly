package com.dao.impl;

import org.apache.ibatis.session.SqlSession;

import com.dao.AllocateCarDao;
import com.pojo.AllocateCar;

/**
 * AllocateCarDao的实现类
 * 
 * @author huijunjie
 * 
 */
public class AllocateCarDaoImpl implements AllocateCarDao {
	/** SqlSession对象 */
	private SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertAllo(AllocateCar alloCar) {
		sqlSession.insert("insertAllo", alloCar);
	}

	@Override
	public AllocateCar selectByCarId(Integer id) {
		return (AllocateCar) sqlSession.selectOne("selectByCar", id);
	}

}
