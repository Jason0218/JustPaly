package com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.transaction.Transaction;
import org.apache.ibatis.transaction.TransactionFactory;
import org.apache.ibatis.transaction.jdbc.JdbcTransactionFactory;
import org.apache.log4j.Logger;

import com.dao.RoleDao;
import com.pojo.Permission;
import com.pojo.Role;
import com.service.RoleService;

/**
 * 角色service实现类
 * 
 * @author czp
 * 
 */
public class RoleServiceImpl implements RoleService {
	private Logger log = Logger.getLogger(RoleServiceImpl.class);// log4j日志对象
	private RoleDao roleDao;// 角色dao对象

	public RoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	@Override
	public List<Role> selectAll() {// 查询所有角色信息
		return roleDao.selectAll();
	}

	@Override
	public Boolean insert(Role r) {// 信息角色信息
		log.debug("roleservice:insert:" + r);
		return roleDao.insert(r);
	}

	@Override
	public Role selectByRname(String rname) {// 根据rname查询角色信息
		log.debug("roleservice:selectByRname:" + rname);
		return roleDao.selectByRname(rname);
	}

	@Override
	public Boolean serPms(Integer rid, Integer pid) {// 设置角色的权限
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rid", rid);
		map.put("pid", pid);
		return roleDao.setPms(map);
	}

	@Override
	public Boolean delete(Integer rid) {// 根据rid删除一条角色信息
		return roleDao.delete(rid);
	}

	@Override
	public Boolean deleteMany(Integer... rids) {// 根据rid数组删除多条角色信息
		if (rids != null) {
			for (int i = 0; i < rids.length; i++) {
				roleDao.delete(rids[i]);
			}
		}
		return true;
	}

	@Override
	public List<Permission> showRolePms(Integer rid) {// 查询角色拥有的权限信息
		log.debug("roleservice:showRolePms:" + rid);
		return roleDao.showRolePms(rid);
	}

	@Override
	public List<Permission> showElseRolePms(Integer rid) {// 查询角色没有的权限信息
		log.debug("roleservice:showElseRolePms:" + rid);
		return roleDao.showElseRolePms(rid);
	}

	@Override
	public Role selectById(Integer rid) {// 根据rid查询角色信息
		log.debug("roleservice:selectById:" + rid);
		return roleDao.selectById(rid);
	}

	@Override
	public Boolean removeRolePms(Integer rid) {// 移除角色所有的权限
		log.debug("roleservice:removeRolePms:" + rid);
		return roleDao.removeRolePms(rid);
	}

}
