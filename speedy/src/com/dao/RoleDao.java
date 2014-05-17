package com.dao;

import java.util.List;
import java.util.Map;

import com.pojo.Permission;
import com.pojo.Role;

/**
 * ��ɫ�ӿ�
 * 
 * @author czp
 * 
 */
public interface RoleDao {
	/**
	 * ��ѯ���н�ɫ
	 * 
	 * @return ��ɫlist����
	 */
	List<Role> selectAll();

	/**
	 * ����id��ѯ��ɫ
	 * 
	 * @param rid
	 *            ��ɫid
	 * @return ��ɫ����role
	 */
	Role selectById(Integer rid);

	/**
	 * ����role
	 * 
	 * @param r
	 *            ��ɫ����
	 * @return true �ɹ� false ʧ��
	 */
	Boolean insert(Role r);

	/**
	 * 
	 * @param rid
	 *            ��ɫid
	 * @return true �ɹ� false ʧ��
	 */
	Boolean delete(Integer rid);

	/**
	 * ���½�ɫ��Ϣ
	 * 
	 * @param r
	 *            �޸Ĺ����µĽ�ɫ����
	 * @return true �ɹ� false ʧ��
	 */
	Boolean update(Role r);

	/**
	 * ���ݽ�ɫ����ѯ��ɫ
	 * 
	 * @param rname
	 * @return ��ɫ����
	 */
	Role selectByRname(String rname);

	/**
	 * �ڽ�ɫȨ�޹�ϵ������ɫȨ�޹�ϵ
	 * 
	 * @param map
	 *            �ţ�rid��pid��
	 * @return true �ɹ� false ʧ��
	 */
	Boolean setPms(Map<String, Object> map);

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
	 * ���ݽ�ɫidɾ���ý�ɫ����Ȩ��
	 * @param rid
	 * @return
	 */
	Boolean removeRolePms(Integer rid);
}
