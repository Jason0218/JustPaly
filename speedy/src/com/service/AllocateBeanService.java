package com.service;

import java.util.List;

import com.pojo.AllocateBean;

/**
 * AllocateBean业务层接口
 * 
 * @author huijunjie
 * 
 */
public interface AllocateBeanService {
	/**
	 * 查询所有
	 * 
	 * @return AllocateBean集合
	 */
	List<AllocateBean> selectAll(AllocateBean allocate);
}
