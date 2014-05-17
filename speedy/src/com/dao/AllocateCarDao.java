package com.dao;

import com.pojo.AllocateCar;

/**
 * ���������dao��ӿ�
 * 
 * @author huijunjie
 * 
 */
public interface AllocateCarDao {
	/**
	 * ��������������Ϣ
	 * 
	 * @param alloCar
	 *            ����������Ϣ
	 */
	void insertAllo(AllocateCar alloCar);

	/**
	 * ���ݳ�����id��
	 * 
	 * @param id
	 *            ������id
	 * @return ����������Ϣ
	 */
	AllocateCar selectByCarId(Integer id);
}
