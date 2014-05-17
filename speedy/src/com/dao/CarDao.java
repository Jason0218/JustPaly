package com.dao;

import java.util.List;
import java.util.Map;

import com.common.Page;
import com.pojo.Car;

/**
 * ������ӿ�
 * 
 * @author huijunjie
 * @version 1.0 2014/04/10
 */
public interface CarDao {
	/**
	 * ����������Ϣ
	 * 
	 * @param car
	 *            Ҫ�����ĳ�������
	 */
	void insertCar(Car car);

	/**
	 * ���ݳ��ƺ����ѯ����
	 * 
	 * @param carId
	 *            ���ƺ���
	 * @return ��ѯ���
	 */
	Car selectById(String carId);

	/**
	 * ���ݳ���״̬��ѯ����
	 * 
	 * @param state
	 *            ����״̬
	 * @return ��ѯ���
	 */
	List<Car> selectByState(Car car);

	/**
	 * �޸ĳ�����Ϣ
	 * 
	 * @param car
	 *            ��װ������Ϣ
	 */
	void updateCar(Car car);

	/**
	 * ���ݳ�����id��ѯ����
	 * 
	 * @param id
	 *            ������id
	 * @return ��ѯ���
	 */
	Car selectByCarId(Integer id);

	/**
	 * ����������ҳ��ѯ����
	 * 
	 * @param params
	 *            ��ѯ��������ҳ����
	 * @return ��ѯ���
	 */
	List<Car> selectByCond(Map<String, Object> params);

	/**
	 * ����idɾ������
	 * 
	 * @param id
	 *            ������id
	 */
	void deleteCar(Integer id);

	/**
	 * ����������ѯ�ܼ�¼��
	 * 
	 * @param params
	 *            ��ѯ����
	 * @return �ܼ�¼��
	 */
	int getTotalRecord(Map<String, Object> params);
}
