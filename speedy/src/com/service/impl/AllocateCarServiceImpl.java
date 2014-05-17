package com.service.impl;

import com.dao.AllocateCarDao;
import com.pojo.AllocateCar;
import com.service.AllocateCarService;

/**
 * AllocateCarService��ʵ����
 * 
 * @author huijunjie
 * 
 */
public class AllocateCarServiceImpl implements AllocateCarService {
	/** AllocateCarDao�ӿڶ��� */
	private AllocateCarDao allocateCarDao;

	public AllocateCarDao getAllocateCarDao() {
		return allocateCarDao;
	}

	public void setAllocateCarDao(AllocateCarDao allocateCarDao) {
		this.allocateCarDao = allocateCarDao;
	}

	@Override
	public void insertAllo(AllocateCar alloCar) {
		allocateCarDao.insertAllo(alloCar);
	}

	@Override
	public AllocateCar selectByCarId(Integer id) {
		return allocateCarDao.selectByCarId(id);
	}

}
