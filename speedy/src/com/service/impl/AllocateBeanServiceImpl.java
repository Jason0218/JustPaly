package com.service.impl;

import java.util.List;

import com.dao.AllocateBeanDao;
import com.pojo.AllocateBean;
import com.service.AllocateBeanService;

/**
 * AllocateBeanService的实现类
 * 
 * @author huijunjie
 * 
 */
public class AllocateBeanServiceImpl implements AllocateBeanService {
	/** AllocateBeanDao接口对象 */
	private AllocateBeanDao allocateBeanDao;

	public AllocateBeanDao getAllocateBeanDao() {
		return allocateBeanDao;
	}

	public void setAllocateBeanDao(AllocateBeanDao allocateBeanDao) {
		this.allocateBeanDao = allocateBeanDao;
	}

	@Override
	public List<AllocateBean> selectAll(AllocateBean allocate) {
		return allocateBeanDao.selectAll(allocate);
	}

}
