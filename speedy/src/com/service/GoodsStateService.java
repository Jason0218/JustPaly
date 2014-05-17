package com.service;

import com.pojo.GoodsState;

/**
 * GoodsStateҵ���ӿ�
 * 
 * @author huijunjie
 * 
 */
public interface GoodsStateService {
	/**
	 * ��������״̬
	 * 
	 * @param gs
	 *            Ҫ�����Ļ���״̬
	 */
	void insertState(GoodsState gs);

	/**
	 * ���»���״̬��Ϣ
	 * 
	 * @param gs
	 *            Ҫ�����Ļ���״̬
	 */
	void updateState(GoodsState gs);

	/**
	 * ���ݶ���id��û���״̬��Ϣ
	 * 
	 * @param oid
	 *            ����id
	 * @return ��ѯ���
	 */
	GoodsState getByOid(Integer oid);
}
