package com.service;

import com.pojo.AllocateCar;

/**
 * AllocateCarҵ���ӿ�
 * 
 * @author huijunjie
 * 
 */
public interface AllocateCarService {
	/**
	 * ��������������Ϣ
	 * 
	 * @param alloCar
	 *            �����������
	 */
	void insertAllo(AllocateCar alloCar);

	/**
	 * ���ݳ�����id��
	 * 
	 * @param id
	 *            ������id
	 * @return ��ѯ���
	 */
	AllocateCar selectByCarId(Integer id);
}
