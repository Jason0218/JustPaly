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
 * ��ɫserviceʵ����
 * 
 * @author czp
 * 
 */
public class RoleServiceImpl implements RoleService {
	private Logger log = Logger.getLogger(RoleServiceImpl.class);// log4j��־����
	private RoleDao roleDao;// ��ɫdao����

	public RoleDao getRoleDao() {
		return roleDao;
	}

	public void setRoleDao(RoleDao roleDao) {
		this.roleDao = roleDao;
	}

	@Override
	public List<Role> selectAll() {// ��ѯ���н�ɫ��Ϣ
		return roleDao.selectAll();
	}

	@Override
	public Boolean insert(Role r) {// ��Ϣ��ɫ��Ϣ
		log.debug("roleservice:insert:" + r);
		return roleDao.insert(r);
	}

	@Override
	public Role selectByRname(String rname) {// ����rname��ѯ��ɫ��Ϣ
		log.debug("roleservice:selectByRname:" + rname);
		return roleDao.selectByRname(rname);
	}

	@Override
	public Boolean serPms(Integer rid, Integer pid) {// ���ý�ɫ��Ȩ��
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("rid", rid);
		map.put("pid", pid);
		return roleDao.setPms(map);
	}

	@Override
	public Boolean delete(Integer rid) {// ����ridɾ��һ����ɫ��Ϣ
		return roleDao.delete(rid);
	}

	@Override
	public Boolean deleteMany(Integer... rids) {// ����rid����ɾ��������ɫ��Ϣ
		if (rids != null) {
			for (int i = 0; i < rids.length; i++) {
				roleDao.delete(rids[i]);
			}
		}
		return true;
	}

	@Override
	public List<Permission> showRolePms(Integer rid) {// ��ѯ��ɫӵ�е�Ȩ����Ϣ
		log.debug("roleservice:showRolePms:" + rid);
		return roleDao.showRolePms(rid);
	}

	@Override
	public List<Permission> showElseRolePms(Integer rid) {// ��ѯ��ɫû�е�Ȩ����Ϣ
		log.debug("roleservice:showElseRolePms:" + rid);
		return roleDao.showElseRolePms(rid);
	}

	@Override
	public Role selectById(Integer rid) {// ����rid��ѯ��ɫ��Ϣ
		log.debug("roleservice:selectById:" + rid);
		return roleDao.selectById(rid);
	}

	@Override
	public Boolean removeRolePms(Integer rid) {// �Ƴ���ɫ���е�Ȩ��
		log.debug("roleservice:removeRolePms:" + rid);
		return roleDao.removeRolePms(rid);
	}

}
