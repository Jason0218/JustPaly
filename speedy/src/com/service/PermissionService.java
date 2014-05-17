package com.service;

import java.util.List;

import com.pojo.Permission;

/**
 * Ȩ��service�ӿ�
 * 
 * @author czp
 * 
 */
public interface PermissionService {
	/**
	 * ��ѯ����Ȩ�޷���
	 * 
	 * @return permission���󼯺�
	 */
	List<Permission> selectAll();

	/**
	 * ����Ȩ�����Ʋ�ѯȨ��
	 * 
	 * @param pname
	 *            Ȩ������
	 * @return Ȩ�޶���
	 */
	Permission selectByPname(String pname);

	/**
	 * ����Ȩ��
	 * 
	 * @param pms
	 * @return
	 */
	Boolean insertPms(Permission pms);

	/**
	 * ����pidɾ��Ȩ����Ϣ
	 * 
	 * @param pid
	 * @return
	 */
	Boolean deleteById(Integer pid);

	/**
	 * ����pid����Ⱥɾ
	 * 
	 * @param pids
	 * @return
	 */
	Boolean deleteByIds(Integer... pids);

	/**
	 * ����pid��ѯPermission����
	 * 
	 * @param pid
	 * @return
	 */
	Permission selectById(Integer pid);

	/**
	 * ����Ȩ����Ϣ
	 * 
	 * @param pms
	 * @return
	 */
	Boolean updatePms(Permission pms);
}
