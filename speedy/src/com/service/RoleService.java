package com.service;

import java.util.List;

import com.pojo.Permission;
import com.pojo.Role;

/**
 * ��ɫservice �ӿ�
 * 
 * @author czp
 * 
 */
public interface RoleService {
	/**
	 * ��ѯ���н�ɫ
	 * 
	 * @return ��ɫlist����
	 */
	List<Role> selectAll();

	/**
	 * ����role
	 * 
	 * @param r
	 *            ��ɫ����
	 * @return true �ɹ� false ʧ��
	 */
	Boolean insert(Role r);

	/**
	 * ���ݽ�ɫ����ѯ��ɫ
	 * 
	 * @param rname
	 * @return ��ɫ����
	 */
	Role selectByRname(String rname);

	/**
	 * ����Ȩ�޽�ɫ��ϵ
	 * 
	 * @param rid
	 *            ��ɫid
	 * @param pid
	 *            Ȩ��id
	 * @return
	 */
	Boolean serPms(Integer rid, Integer pid);

	/**
	 * 
	 * @param rid
	 *            ��ɫid
	 * @return true �ɹ� false ʧ��
	 */
	Boolean delete(Integer rid);

	/**
	 * ����ɾ����ɫ
	 * 
	 * @param rids
	 * @return true �ɹ� false ʧ��
	 */
	Boolean deleteMany(Integer... rids);

	/**
	 * ���ݽ�ɫid��ѯ�ý�ɫ��ӵ�е�Ȩ��list����
	 * 
	 * @param rid
	 *            ��ɫid
	 * @return Ȩ��list����
	 */
	List<Permission> showRolePms(Integer rid);

	/**
	 * ���ݽ�ɫid��ѯ�ý�ɫ��û��ӵ�е�Ȩ��list����
	 * 
	 * @param rid
	 *            ��ɫid
	 * @return �ý�ɫû�е�Ȩ��list����
	 */
	List<Permission> showElseRolePms(Integer rid);

	/**
	 * ����id��ѯ��ɫ
	 * 
	 * @param rid
	 *            ��ɫid
	 * @return ��ɫ����role
	 */
	Role selectById(Integer rid);

	/**
	 * ���ݽ�ɫidɾ���ý�ɫ����Ȩ��
	 * 
	 * @param rid
	 * @return
	 */
	Boolean removeRolePms(Integer rid);
}
