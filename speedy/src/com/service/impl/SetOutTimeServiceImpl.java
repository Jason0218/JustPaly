package com.service.impl;

import com.dao.SetOutTimeDao;
import com.pojo.SetOutTime;
import com.service.SetOutTimeService;

/**
 * SetOutTimeService的实现类
 * 
 * @author huijunjie
 * 
 */
public class SetOutTimeServiceImpl implements SetOutTimeService {
	/** SetOutTimeDao接口对象 */
	private SetOutTimeDao timeDao;

	public SetOutTimeDao getTimeDao() {
		return timeDao;
	}

	public void setTimeDao(SetOutTimeDao timeDao) {
		this.timeDao = timeDao;
	}

	@Override
	public void insertTime(SetOutTime time) {
		timeDao.insertTime(time);
	}

	@Override
	public SetOutTime selectByCarId(Integer id) {
		return timeDao.selectByCarId(id);
	}

}
