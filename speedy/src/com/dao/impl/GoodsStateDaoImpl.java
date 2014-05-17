package com.dao.impl;

import org.apache.ibatis.session.SqlSession;

import com.dao.GoodsStateDao;
import com.pojo.GoodsState;

/**
 * GoodsStateDao的实现类
 * 
 * @author huijunjie
 * 
 */
public class GoodsStateDaoImpl implements GoodsStateDao {
	/** SqlSession对象 */
	private SqlSession sqlSession;

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void insertState(GoodsState gs) {
		sqlSession.insert("insertState", gs);
	}

	@Override
	public void updateState(GoodsState gs) {
		sqlSession.update("updateGs", gs);

	}

	@Override
	public GoodsState getByOid(Integer oid) {
		GoodsState gs = sqlSession.selectOne("select_by_oid", oid);
		return gs;
	}

}
