package com.service.impl;

import java.util.List;

import org.apache.log4j.Logger;

import com.dao.PermissionDao;
import com.pojo.Permission;
import com.service.PermissionService;

/**
 * Ȩ��service ʵ����
 * 
 * @author czp
 * 
 */
public class PermissionServiceImpl implements PermissionService {
	private Logger log = Logger.getLogger(PermissionServiceImpl.class);// log4j��־����
	private PermissionDao permissionDao;// Ȩ��dao����

	public PermissionDao getPermissionDao() {
		return permissionDao;
	}

	public void setPermissionDao(PermissionDao permissionDao) {
		this.permissionDao = permissionDao;
	}

	@Override
	public List<Permission> selectAll() {// ��ѯ����Ȩ����Ϣ
		return permissionDao.selectAll();
	}

	@Override
	public Permission selectByPname(String pname) {// ����pname��ѯȨ����Ϣ
		return permissionDao.selectByPname(pname);
	}

	@Override
	public Boolean insertPms(Permission pms) {// ����Ȩ����Ϣ
		return permissionDao.insertPms(pms);
	}

	@Override
	public Boolean deleteById(Integer pid) {// ����pidɾ��һ��Ȩ����Ϣ
		log.debug("PermissionServiceImpl:deleteById:" + pid);
		List li = permissionDao.selectRidByPid(pid);
		if (li == null || li.size() == 0) {// ��Ȩ��û�н�ɫӵ�У�����ɾ��
			permissionDao.deleteById(pid);
			return true;
		}
		return false;
	}

	@Override
	public Boolean deleteByIds(Integer... pids) {// ����pid����ɾ������Ȩ����Ϣ
		for (Integer pid : pids) {
			List li = permissionDao.selectRidByPid(pid);
			if (li != null && li.size() != 0) {// ��Ȩ��û�н�ɫӵ�У�����ɾ��
				return false;
			}
		}
		for (Integer pid : pids) {
			permissionDao.deleteById(pid);
		}
		return true;
	}

	@Override
	public Permission selectById(Integer pid) {// ����pid����Ȩ����Ϣ
		return permissionDao.selectById(pid);
	}

	@Override
	public Boolean updatePms(Permission pms) {// ����Ȩ����Ϣ
		permissionDao.updatePms(pms);
		return true;
	}

}
