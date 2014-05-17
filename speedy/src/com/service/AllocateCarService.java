package com.service;

import com.pojo.AllocateCar;

/**
 * AllocateCar业务层接口
 * 
 * @author huijunjie
 * 
 */
public interface AllocateCarService {
	/**
	 * 新增车辆调配信息
	 * 
	 * @param alloCar
	 *            车辆调配对象
	 */
	void insertAllo(AllocateCar alloCar);

	/**
	 * 根据车辆表id查
	 * 
	 * @param id
	 *            车辆表id
	 * @return 查询结果
	 */
	AllocateCar selectByCarId(Integer id);
}
