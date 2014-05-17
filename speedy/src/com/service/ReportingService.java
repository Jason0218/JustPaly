package com.service;

import java.util.List;

import com.pojo.AcceptForm;
import com.pojo.Companyreportform;
import com.pojo.SendForm;
import com.util.PageBean;

public interface ReportingService {

	SendForm getSendFormById(int id);
	AcceptForm getAcceptFormById(int id);
	Companyreportform getReportById(int id);
	
	
	 PageBean<Companyreportform> queryForPage(String mapperKey,int page, int pageSize, Object...values);

	 	public List<Companyreportform> queryAll(String mapperKey,Object... values);
	 	public List<SendForm> queryAll2(String mapperKey,Object... values);
	 	 PageBean<SendForm> queryForPage2(String mapperKey,int page, int pageSize, Object...values);
	 	public List<AcceptForm> queryAll3(String mapperKey,Object... values);
	 	 PageBean<AcceptForm> queryForPage3(String mapperKey,int page, int pageSize, Object...values);
	 	
	 
}
