package com.dao;

import java.util.List;
import java.util.Map;

import com.pojo.AssQResult;
import com.pojo.AssociateList;
import com.pojo.Car;
import com.pojo.Goods;
import com.pojo.GoodsState;
import com.pojo.Order;
/**
 * ���ӵ�dao
 * @author fh
 *
 */
public interface AssociateListDao {
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
		 * ����������ҳ��ѯ���ӵ�
		 * 
		 * @param params
		 *            ��ѯ��������ҳ����
		 * @return ��ѯ���
		 */
		List<AssQResult> selectByCond(Map<String, Object> params);
		/**
		 * ����������ѯ�ܼ�¼��
		 * 
		 * @param params
		 *            ��ѯ����
		 * @return �ܼ�¼��
		 */
		int getTotalRecord(Map<String, Object> params);
		
		void insertAss(AssociateList ass);
}
