package com.dao;

import java.util.List;

import com.pojo.AllocateBean;

/**
 * AllocateBean的dao层接口
 * 
 * @author huijunjie
 * 
 */
public interface AllocateBeanDao {
	/**
	 * 查询所有
	 * 
	 * @return AllocateBean集合
	 */
	List<AllocateBean> selectAll(AllocateBean allocate);
}
