package com.dao;

import com.pojo.GoodsState;

/**
 * ����״̬��dao��ӿ�
 * 
 * @author huijunjie
 * 
 */
public interface GoodsStateDao {
	/**
	 * ��������״̬
	 * 
	 * @param gs
	 *            ����״̬����
	 */
	void insertState(GoodsState gs);

	/**
	 * �޸Ļ���״̬
	 * 
	 * @param gs
	 *            Ҫ�޸ĵĻ���״̬��Ϣ
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
