package com.service.impl;

import java.util.Date;

import com.dao.GoodsStateDao;
import com.dao.ISendNodeDao;
import com.pojo.GoodsState;
import com.pojo.SendNode;
import com.service.GoodsStateService;

/**
 * GoodsStateService��ʵ����
 * 
 * @author huijunjie
 * 
 */
public class GoodsStateServiceImpl implements GoodsStateService {
	/** GoodsStateDao�ӿڶ��� */
	private GoodsStateDao goodsStateDao;
	/** ISendNodeDao�ӿڶ��� */
	private ISendNodeDao sendNodeDao;

	public GoodsStateDao getGoodsStateDao() {
		return goodsStateDao;
	}

	public void setGoodsStateDao(GoodsStateDao goodsStateDao) {
		this.goodsStateDao = goodsStateDao;
	}

	public ISendNodeDao getSendNodeDao() {
		return sendNodeDao;
	}

	public void setSendNodeDao(ISendNodeDao sendNodeDao) {
		this.sendNodeDao = sendNodeDao;
	}

	@Override
	public void insertState(GoodsState gs) {
		goodsStateDao.insertState(gs);
	}

	@Override
	public void updateState(GoodsState gs) {
		goodsStateDao.updateState(gs);
	}

	@Override
	public GoodsState getByOid(Integer oid) {
		return goodsStateDao.getByOid(oid);
	}

}
