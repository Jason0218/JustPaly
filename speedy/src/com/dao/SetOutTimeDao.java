package com.dao;

import com.pojo.SetOutTime;

/**
 * ����ʱ���dao��ӿ�
 * 
 * @author huijunjie
 * 
 */
public interface SetOutTimeDao {
	/**
	 * ��������ʱ��
	 * 
	 * @param time
	 *            ����ʱ�����
	 */
	void insertTime(SetOutTime time);

	/**
	 * ���ݳ�����id��
	 * 
	 * @param id
	 *            ������id
	 * @return ��ѯ���
	 */
	SetOutTime selectByCarId(Integer id);
}
