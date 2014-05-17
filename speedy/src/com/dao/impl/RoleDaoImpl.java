package com.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dao.RoleDao;
import com.pojo.Permission;
import com.pojo.Role;

/**
 * RoleDaoʵ����
 * 
 * @author czp
 * 
 */
public class RoleDaoImpl implements RoleDao {
	private SqlSession sqlSession;// ���ݿ�����sqlsession����

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Role> selectAll() {// ��ѯ���н�ɫ
		List<Role> rList = sqlSession.selectList("selectRole_all");
		return rList;
	}

	@Override
	public Role selectById(Integer rid) {// ����rid��ѯ��ɫ
		Role role = sqlSession.selectOne("select_by_rid", rid);
		return role;
	}

	@Override
	public Boolean insert(Role r) {// ������ɫ
		sqlSession.insert("insert_Role", r);
		return true;
	}

	@Override
	public Boolean delete(Integer rid) {// ����ridɾ��һ����ɫ��¼
		sqlSession.delete("delete_by_rid", rid);
		return true;
	}

	@Override
	public Boolean update(Role r) {// ���½�ɫ
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Role selectByRname(String rname) {// ���ݽ�ɫ���Ʋ�ѯ��ɫ
		Role role = sqlSession.selectOne("select_by_rname", rname);
		return role;
	}

	@Override
	public Boolean setPms(Map<String, Object> map) {// ���ý�ɫ��ӵ�е�Ȩ��
		sqlSession.insert("insert_Role_Pms", map);
		return true;
	}

	@Override
	public List<Permission> showRolePms(Integer rid) {// ��ѯ��ɫӵ�е�����Ȩ��
		List<Permission> list = sqlSession.selectList("show_Role_Pms", rid);
		return list;
	}

	@Override
	public List<Permission> showElseRolePms(Integer rid) {// ��ѯ��ɫû�е�����Ȩ��
		List<Permission> list = sqlSession
				.selectList("show_Role_else_Pms", rid);
		return list;
	}

	@Override
	public Boolean removeRolePms(Integer rid) {// �Ƴ���ɫ���е�Ȩ��
		sqlSession.delete("delete_role_pms", rid);
		return true;
	}

}
