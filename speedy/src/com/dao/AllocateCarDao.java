package com.dao;

import com.pojo.AllocateCar;

/**
 * 车辆调配表dao层接口
 * 
 * @author huijunjie
 * 
 */
public interface AllocateCarDao {
	/**
	 * 新增车辆调配信息
	 * 
	 * @param alloCar
	 *            车辆调配信息
	 */
	void insertAllo(AllocateCar alloCar);

	/**
	 * 根据车辆表id查
	 * 
	 * @param id
	 *            车辆表id
	 * @return 车辆调配信息
	 */
	AllocateCar selectByCarId(Integer id);
}
