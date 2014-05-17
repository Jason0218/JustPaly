package com.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.PermissionDao;
import com.pojo.Permission;

/**
 * PermissionDaoʵ����
 * 
 * @author czp
 * 
 */
public class PermissionDaoImpl implements PermissionDao {
	private SqlSession sqlSession;//���ݿ�����sqlsession����

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Permission> selectAll() {//��ѯ����Ȩ����Ϣ
		List<Permission> pList = sqlSession.selectList("selectPms_all");
		return pList;
	}

	@Override
	public Permission selectByPname(String pname) {//����Ȩ�����Ʋ�ѯȨ����Ϣ
		Permission pms = sqlSession.selectOne("select_by_pname", pname);
		return pms;
	}

	@Override
	public Boolean insertPms(Permission pms) {//����Ȩ����Ϣ
		sqlSession.insert("insert_Pms", pms);
		return true;
	}

	@Override
	public Boolean deleteById(Integer pid) {//����pidɾ��һ����ɫ
		sqlSession.delete("delete_by_pid", pid);
		return true;
	}

	@Override
	public List selectRidByPid(Integer pid) {//����rid��ѯ��ӵ�е�Ȩ��id��list����
		List list = sqlSession.selectList("select_rid_by_pid", pid);
		return list;
	}

	@Override
	public Permission selectById(Integer pid) {//����pid��ѯȨ����Ϣ
		Permission pms = sqlSession.selectOne("select_by_pid", pid);
		return pms;
	}

	@Override
	public Boolean updatePms(Permission pms) {//����Ȩ����Ϣ
		sqlSession.update("updatePms", pms);
		return null;
	}

}
