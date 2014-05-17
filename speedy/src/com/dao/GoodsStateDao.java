package com.dao;

import com.pojo.GoodsState;

/**
 * 货物状态表dao层接口
 * 
 * @author huijunjie
 * 
 */
public interface GoodsStateDao {
	/**
	 * 新增货物状态
	 * 
	 * @param gs
	 *            货物状态对象
	 */
	void insertState(GoodsState gs);

	/**
	 * 修改货物状态
	 * 
	 * @param gs
	 *            要修改的货物状态信息
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
