package com.service;

import java.util.List;
import java.util.Map;

import com.common.Page;
import com.pojo.Car;

/**
 * ����ҵ���
 * 
 * @author huijunjie
 * @version 1.0
 */
public interface CarService {
	/**
	 * ����������Ϣ
	 * 
	 * @param car
	 *            Ҫ�����ĳ�������
	 */
	void insertCar(Car car);

	/**
	 * ����idɾ������
	 * 
	 * @param id
	 *            ������id
	 */
	void deleteCar(Integer id);

	/**
	 * ����idȺɾ
	 * 
	 * @param ids
	 *            id����
	 * @return true ɾ���ɹ� false ɾ��ʧ��
	 */
	boolean deleteCarByIds(Integer... ids);

	/**
	 * �޸ĳ�����Ϣ
	 * 
	 * @param car
	 *            ��װ������Ϣ
	 */
	void updateCar(Car car);

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
	 * ���ݳ�����id��ѯ����
	 * 
	 * @param id
	 *            ������id
	 * @return ��ѯ���
	 */
	Car selectByCarId(Integer id);

	/**
	 * ���ݲ�ѯ������ѯ����
	 * 
	 * @param car
	 *            ��ѯ����
	 * @param page
	 *            ��ҳ����
	 * @return ��ѯ���
	 */
	List<Car> selectByCond(Car car, Page page);

	/**
	 * ���ݲ�ѯ���������ҳ��
	 * 
	 * @param car
	 *            ��ѯ����
	 * @return ��ҳ��
	 */
	int getTotalPage(Car car);

	/**
	 * ���ݲ�ѯ��������ܼ�¼��
	 * 
	 * @param car
	 *            ��ѯ����
	 * @return �ܼ�¼��
	 */
	int getTotalRecord(Car car);
}
