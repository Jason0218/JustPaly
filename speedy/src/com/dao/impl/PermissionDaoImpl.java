package com.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.PermissionDao;
import com.pojo.Permission;

/**
 * PermissionDao实现类
 * 
 * @author czp
 * 
 */
public class PermissionDaoImpl implements PermissionDao {
	private SqlSession sqlSession;//数据库连接sqlsession对象

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Permission> selectAll() {//查询所有权限信息
		List<Permission> pList = sqlSession.selectList("selectPms_all");
		return pList;
	}

	@Override
	public Permission selectByPname(String pname) {//根据权限名称查询权限信息
		Permission pms = sqlSession.selectOne("select_by_pname", pname);
		return pms;
	}

	@Override
	public Boolean insertPms(Permission pms) {//新增权限信息
		sqlSession.insert("insert_Pms", pms);
		return true;
	}

	@Override
	public Boolean deleteById(Integer pid) {//根据pid删除一条角色
		sqlSession.delete("delete_by_pid", pid);
		return true;
	}

	@Override
	public List selectRidByPid(Integer pid) {//根据rid查询所拥有的权限id的list集合
		List list = sqlSession.selectList("select_rid_by_pid", pid);
		return list;
	}

	@Override
	public Permission selectById(Integer pid) {//根据pid查询权限信息
		Permission pms = sqlSession.selectOne("select_by_pid", pid);
		return pms;
	}

	@Override
	public Boolean updatePms(Permission pms) {//更新权限信息
		sqlSession.update("updatePms", pms);
		return null;
	}

}
