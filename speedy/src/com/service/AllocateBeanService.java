package com.service;

import java.util.List;

import com.pojo.AllocateBean;

/**
 * AllocateBeanҵ���ӿ�
 * 
 * @author huijunjie
 * 
 */
public interface AllocateBeanService {
	/**
	 * ��ѯ����
	 * 
	 * @return AllocateBean����
	 */
	List<AllocateBean> selectAll(AllocateBean allocate);
}
