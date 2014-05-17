package com.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dao.RoleDao;
import com.pojo.Permission;
import com.pojo.Role;

/**
 * RoleDao实现类
 * 
 * @author czp
 * 
 */
public class RoleDaoImpl implements RoleDao {
	private SqlSession sqlSession;// 数据库连接sqlsession对象

	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<Role> selectAll() {// 查询所有角色
		List<Role> rList = sqlSession.selectList("selectRole_all");
		return rList;
	}

	@Override
	public Role selectById(Integer rid) {// 根据rid查询角色
		Role role = sqlSession.selectOne("select_by_rid", rid);
		return role;
	}

	@Override
	public Boolean insert(Role r) {// 新增角色
		sqlSession.insert("insert_Role", r);
		return true;
	}

	@Override
	public Boolean delete(Integer rid) {// 根据rid删除一条角色记录
		sqlSession.delete("delete_by_rid", rid);
		return true;
	}

	@Override
	public Boolean update(Role r) {// 更新角色
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Role selectByRname(String rname) {// 根据角色名称查询角色
		Role role = sqlSession.selectOne("select_by_rname", rname);
		return role;
	}

	@Override
	public Boolean setPms(Map<String, Object> map) {// 设置角色所拥有的权限
		sqlSession.insert("insert_Role_Pms", map);
		return true;
	}

	@Override
	public List<Permission> showRolePms(Integer rid) {// 查询角色拥有的所有权限
		List<Permission> list = sqlSession.selectList("show_Role_Pms", rid);
		return list;
	}

	@Override
	public List<Permission> showElseRolePms(Integer rid) {// 查询角色没有的所有权限
		List<Permission> list = sqlSession
				.selectList("show_Role_else_Pms", rid);
		return list;
	}

	@Override
	public Boolean removeRolePms(Integer rid) {// 移除角色所有的权限
		sqlSession.delete("delete_role_pms", rid);
		return true;
	}

}
