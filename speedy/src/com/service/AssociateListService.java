package com.service;

import java.util.List;


import com.common.Page;
import com.pojo.AssQResult;
import com.pojo.AssociateList;
import com.pojo.Car;
import com.pojo.Goods;
import com.pojo.GoodsState;
import com.pojo.Order;

public interface AssociateListService {
/**
 * ��ѯ����״̬����һվΪ������վ�Ļ���״̬��
 * @param nname
 * @return ���ػ���״̬��
 */
	List<GoodsState> selectByNodeName(String nname);
/**
 * 	����id�鶩����
 * @param orderid
 * @return ���ض�����
 */
	List<Order> selectByOrderId(Integer orderid);
/**
 * 	�Ӷ������ȡ�����
 * @param order
 * @return ���ػ����
 */
	List<Goods> selectGoodOfOrder(Integer orderid);
	/**
	 * ���������齻�ӱ���������
	 * @param assQResult
	 * @param page
	 * @return
	 */
	List<AssQResult> selectByCond(AssQResult assQResult, Page page,String sjd);
	/**
	 * ���ݲ�ѯ���������ҳ��
	 * 
	 * @param car
	 *            ��ѯ����
	 * @return ��ҳ��
	 */
	int getTotalPage(AssQResult assQResult);

	/**
	 * ���ݲ�ѯ��������ܼ�¼��
	 * 
	 * @param car
	 *            ��ѯ����
	 * @return �ܼ�¼��
	 */
	int getTotalRecord(AssQResult assQResult);
	
	void insertAss(AssociateList ass);
}
