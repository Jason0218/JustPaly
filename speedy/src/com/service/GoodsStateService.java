package com.service;

import com.pojo.GoodsState;

/**
 * GoodsState业务层接口
 * 
 * @author huijunjie
 * 
 */
public interface GoodsStateService {
	/**
	 * 新增货物状态
	 * 
	 * @param gs
	 *            要新增的货物状态
	 */
	void insertState(GoodsState gs);

	/**
	 * 更新货物状态信息
	 * 
	 * @param gs
	 *            要新增的货物状态
	 */
	void updateState(GoodsState gs);

	/**
	 * 根据订单id获得货物状态信息
	 * 
	 * @param oid
	 *            订单id
	 * @return 查询结果
	 */
	GoodsState getByOid(Integer oid);
}
