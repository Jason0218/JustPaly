package com.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dao.ReportingDao;
import com.pojo.AcceptForm;
import com.pojo.Companyreportform;
import com.pojo.SendForm;
import com.util.PageBean;

public  class ReportingDaoImpl implements ReportingDao{

	private SqlSession sqlSession;
	
	public SqlSession getSqlSession() {
		return sqlSession;
	}

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	
	public Companyreportform getReportById(int id) {

		Companyreportform comrepform=sqlSession.selectOne("selectReport_ById",id);
	
		return comrepform;
	}

	

		public List<Companyreportform> query(final String mapperKey, final int start, final int end, final Object... values) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			for(int i=0;i<values.length;i++){
				map.put("p"+i, values[i]);
			}
			return sqlSession.selectList(mapperKey, map);
		}
		public List<SendForm> query2(final String mapperKey, final int start, final int end, final Object... values) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			for(int i=0;i<values.length;i++){
				map.put("p"+i, values[i]);
			}
			return sqlSession.selectList(mapperKey, map);
		}
		public List<AcceptForm> query3(final String mapperKey, final int start, final int end, final Object... values) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("start", start);
			map.put("end", end);
			for(int i=0;i<values.length;i++){
				map.put("p"+i, values[i]);
			}
			return sqlSession.selectList(mapperKey, map);
		}
		/**
		 * 所有查询成pageBean的mapper，要写两个mapperKey
		 * 一个是 本身查询的mapperKey；
		 * 另一个是查询所有的mapperKey+"_count"
		 * (就是说在mapper文件中要写两个查询)
		 */
		public PageBean<Companyreportform> queryForPage(String mapperKey, int currentPage, int pageSize, Object... values) {
			PageBean<Companyreportform> pageBean = new PageBean<Companyreportform>();
		//	int allRow = Integer.valueOf(String.valueOf(countRows(mapperKey+"_count", values)));//！！！！
			int allRow = countRows(mapperKey+"_count", values);
			int totalPage = PageBean.countTotalPage(pageSize, allRow);
			currentPage = currentPage > totalPage ? totalPage : currentPage;
			currentPage = currentPage <= 0 ? 1 : currentPage;
			final int start = PageBean.countOffset(pageSize, currentPage)+1;
			final int end = currentPage*pageSize;//结束页rowNum
			List<Companyreportform> list = query(mapperKey,start,end, values);
			pageBean.setPageSize(pageSize);
			pageBean.setCurrentPage(currentPage);
			pageBean.setAllRow(allRow);
			pageBean.setTotalPage(totalPage);
			pageBean.setList(list);
			pageBean.init();
			return pageBean;
		}

		/**
		 * 分页查询中用到，用于查询所有记录的条数
		 * @param mapperKey
		 * @param values
		 * @return
		 */
		private int countRows(String mapperKey, Object... values) {
			Map<String,Object> map = new HashMap<String,Object>();
			for(int i=0;i<values.length;i++){
				map.put("p"+i, values[i]);
			}
			return sqlSession.selectOne(mapperKey, map);
		}

		
		public List<Companyreportform> queryAll(String mapperKey,Object... values){
			Map<String,Object> map = new HashMap<String,Object>();
			for(int i=0;i<values.length;i++){
				map.put("p"+i, values[i]);
			}
			return sqlSession.selectList(mapperKey, map);
		}

		@Override
		public SendForm getSendFormById(int id) {
			// TODO Auto-generated method stub
			SendForm sendform=sqlSession.selectOne("selectSendReport_ById",id);
			return sendform;
		}

		@Override
		public AcceptForm getAcceptFormById(int id) {
			// TODO Auto-generated method stub
			AcceptForm acceptform=sqlSession.selectOne("selectAcceptReport_ById",id);
			return acceptform;
		}

		@Override
		public PageBean<SendForm> queryForPage2(String mapperKey, int currentPage,
				int pageSize, Object... values) {
			// TODO Auto-generated method stub
			PageBean<SendForm> pageBean = new PageBean<SendForm>();
			//	int allRow = Integer.valueOf(String.valueOf(countRows(mapperKey+"_count", values)));//！！！！
				int allRow = countRows(mapperKey+"_count", values);
				int totalPage = PageBean.countTotalPage(pageSize, allRow);
				currentPage = currentPage > totalPage ? totalPage : currentPage;
				currentPage = currentPage <= 0 ? 1 : currentPage;
				final int start = PageBean.countOffset(pageSize, currentPage)+1;
				final int end = currentPage*pageSize;//结束页rowNum
				List<SendForm> list = query2(mapperKey,start,end, values);
				pageBean.setPageSize(pageSize);
				pageBean.setCurrentPage(currentPage);
				pageBean.setAllRow(allRow);
				pageBean.setTotalPage(totalPage);
				pageBean.setList(list);
				pageBean.init();
				return pageBean;
		}

		@Override
		public List<SendForm> queryAll2(String mapperKey, Object... values) {
			// TODO Auto-generated method stub
			Map<String,Object> map = new HashMap<String,Object>();
			for(int i=0;i<values.length;i++){
				map.put("p"+i, values[i]);
			}
			return sqlSession.selectList(mapperKey, map);
		}

		@Override
		public PageBean<AcceptForm> queryForPage3(String mapperKey, int currentPage, int pageSize, Object... values) {
			// TODO Auto-generated method stub
			PageBean<AcceptForm> pageBean = new PageBean<AcceptForm>();
			//	int allRow = Integer.valueOf(String.valueOf(countRows(mapperKey+"_count", values)));//！！！！
				int allRow = countRows(mapperKey+"_count", values);
				int totalPage = PageBean.countTotalPage(pageSize, allRow);
				currentPage = currentPage > totalPage ? totalPage : currentPage;
				currentPage = currentPage <= 0 ? 1 : currentPage;
				final int start = PageBean.countOffset(pageSize, currentPage)+1;
				final int end = currentPage*pageSize;//结束页rowNum
				List<AcceptForm> list = query3(mapperKey,start,end, values);
				pageBean.setPageSize(pageSize);
				pageBean.setCurrentPage(currentPage);
				pageBean.setAllRow(allRow);
				pageBean.setTotalPage(totalPage);
				pageBean.setList(list);
				pageBean.init();
				return pageBean;
		}

		@Override
		public List<AcceptForm> queryAll3(String mapperKey, Object... values) {
			// TODO Auto-generated method stub
			Map<String,Object> map = new HashMap<String,Object>();
			for(int i=0;i<values.length;i++){
				map.put("p"+i, values[i]);
			}
			return sqlSession.selectList(mapperKey, map);
			
		}
	

	

}
