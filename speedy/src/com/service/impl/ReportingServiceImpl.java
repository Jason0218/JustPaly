package com.service.impl;

import java.util.List;

import com.dao.ReportingDao;
import com.pojo.AcceptForm;
import com.pojo.Companyreportform;
import com.pojo.SendForm;
import com.service.ReportingService;
import com.util.PageBean;


public  class ReportingServiceImpl implements ReportingService{
	private ReportingDao reDao;
   
	

	public ReportingDao getReDao() {
		return reDao;
	}



	public void setReDao(ReportingDao reDao) {
		this.reDao = reDao;
	}



	




	




	@Override
	public Companyreportform getReportById(int id) {
		// TODO Auto-generated method stub
		
		return reDao.getReportById(id);
	}

	@Override
	public PageBean<Companyreportform> queryForPage(String mapperKey, int page,
			int pageSize, Object... values) {
		
		
		
		return reDao.queryForPage(mapperKey,page,pageSize,values);
	}

	@Override
	public List<Companyreportform> queryAll(String mapperKey, Object... values) {
		return reDao.queryAll(mapperKey, values);
	}

	@Override
	public SendForm getSendFormById(int id) {
		// TODO Auto-generated method stub
		return reDao.getSendFormById(id);
	}

	@Override
	public AcceptForm getAcceptFormById(int id) {
		// TODO Auto-generated method stub
		return reDao.getAcceptFormById(id);
	}

	@Override
	public List<SendForm> queryAll2(String mapperKey, Object... values) {
		// TODO Auto-generated method stub
		return reDao.queryAll2(mapperKey,values);
	}

	@Override
	public PageBean<SendForm> queryForPage2(String mapperKey, int page,
			int pageSize, Object... values) {
		// TODO Auto-generated method stub
		return reDao.queryForPage2(mapperKey,page,pageSize,values);
	}

	@Override
	public List<AcceptForm> queryAll3(String mapperKey, Object... values) {
		// TODO Auto-generated method stub
		return reDao.queryAll3(mapperKey,values);
	}

	@Override
	public PageBean<AcceptForm> queryForPage3(String mapperKey, int page,
			int pageSize, Object... values) {
		// TODO Auto-generated method stub
		return reDao.queryForPage3(mapperKey,page,pageSize,values);
	}

	
    
   
}
