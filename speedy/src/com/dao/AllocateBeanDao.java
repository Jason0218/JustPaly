package com.dao;

import java.util.List;

import com.pojo.AllocateBean;

/**
 * AllocateBean��dao��ӿ�
 * 
 * @author huijunjie
 * 
 */
public interface AllocateBeanDao {
	/**
	 * ��ѯ����
	 * 
	 * @return AllocateBean����
	 */
	List<AllocateBean> selectAll(AllocateBean allocate);
}
