package com.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.common.Page;
import com.dao.AssociateListDao;
import com.pojo.AssQResult;
import com.pojo.AssociateList;
import com.pojo.Goods;
import com.pojo.GoodsState;
import com.pojo.Order;
import com.service.AssociateListService;

public class AssociateListServiceImpl implements AssociateListService {

	private AssociateListDao associateListDao;
	@Override
	public List<GoodsState> selectByNodeName(String nname) {
		// TODO Auto-generated method stub
		return associateListDao.selectByNodeName(nname);
	}

	@Override
	public List<Order> selectByOrderId(Integer orderid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Goods> selectGoodOfOrder(Integer orderid) {
		// TODO Auto-generated method stub
		return null;
	}

	public AssociateListDao getAssociateListDao() {
		return associateListDao;
	}

	public void setAssociateListDao(AssociateListDao associateListDao) {
		this.associateListDao = associateListDao;
	}

	@Override
	public List<AssQResult> selectByCond(AssQResult assQResult, Page page,String sjd) {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("orderId", assQResult.getOrderId());
		params.put("goodsAmount", assQResult.getGoodsAmount());
		params.put("nname", assQResult.getNname());
		params.put("destn", assQResult.getDestn());
		params.put("sjd", sjd);
		int start = page.getBeginIndex();
		int end = page.getEndIndex();
		params.put("start", start);
		params.put("end", end);
		return associateListDao.selectByCond(params);
	}

	@Override
	public int getTotalPage(AssQResult assQResult) {
		int totalRecord = getTotalRecord(assQResult);
		Page page = new Page();
		page.setTotal(totalRecord);
		return page.getTotalPage();
	}

	@Override
	public int getTotalRecord(AssQResult assQResult) {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("orderId", assQResult.getOrderId());
		params.put("goodsAmount", assQResult.getGoodsAmount());
		params.put("nname", assQResult.getNname());
		params.put("destn", assQResult.getDestn());
		int totalRecord = associateListDao.getTotalRecord(params);
		return totalRecord;
	}

	@Override
	public void insertAss(AssociateList ass) {
		// TODO Auto-generated method stub
		associateListDao.insertAss(ass);
	}

}
