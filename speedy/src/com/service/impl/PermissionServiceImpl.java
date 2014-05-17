package com.service.impl;

import java.util.List;

import org.apache.log4j.Logger;

import com.dao.PermissionDao;
import com.pojo.Permission;
import com.service.PermissionService;

/**
 * 权限service 实现类
 * 
 * @author czp
 * 
 */
public class PermissionServiceImpl implements PermissionService {
	private Logger log = Logger.getLogger(PermissionServiceImpl.class);// log4j日志对象
	private PermissionDao permissionDao;// 权限dao对象

	public PermissionDao getPermissionDao() {
		return permissionDao;
	}

	public void setPermissionDao(PermissionDao permissionDao) {
		this.permissionDao = permissionDao;
	}

	@Override
	public List<Permission> selectAll() {// 查询所有权限信息
		return permissionDao.selectAll();
	}

	@Override
	public Permission selectByPname(String pname) {// 根据pname查询权限信息
		return permissionDao.selectByPname(pname);
	}

	@Override
	public Boolean insertPms(Permission pms) {// 新增权限信息
		return permissionDao.insertPms(pms);
	}

	@Override
	public Boolean deleteById(Integer pid) {// 根据pid删除一条权限信息
		log.debug("PermissionServiceImpl:deleteById:" + pid);
		List li = permissionDao.selectRidByPid(pid);
		if (li == null || li.size() == 0) {// 该权限没有角色拥有，可以删除
			permissionDao.deleteById(pid);
			return true;
		}
		return false;
	}

	@Override
	public Boolean deleteByIds(Integer... pids) {// 根据pid数组删除多条权限信息
		for (Integer pid : pids) {
			List li = permissionDao.selectRidByPid(pid);
			if (li != null && li.size() != 0) {// 该权限没有角色拥有，可以删除
				return false;
			}
		}
		for (Integer pid : pids) {
			permissionDao.deleteById(pid);
		}
		return true;
	}

	@Override
	public Permission selectById(Integer pid) {// 根据pid重置权限信息
		return permissionDao.selectById(pid);
	}

	@Override
	public Boolean updatePms(Permission pms) {// 更新权限信息
		permissionDao.updatePms(pms);
		return true;
	}

}
