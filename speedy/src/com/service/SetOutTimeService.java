package com.service;

import com.pojo.SetOutTime;

/**
 * SetOutTimeҵ���ӿ�
 * 
 * @author huijunjie
 * 
 */
public interface SetOutTimeService {
	/**
	 * ��������ʱ��
	 * 
	 * @param time
	 *            ����ʱ��
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
