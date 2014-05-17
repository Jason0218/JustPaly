package com.service;

import com.pojo.SetOutTime;

/**
 * SetOutTime业务层接口
 * 
 * @author huijunjie
 * 
 */
public interface SetOutTimeService {
	/**
	 * 新增发车时间
	 * 
	 * @param time
	 *            发车时间
	 */
	void insertTime(SetOutTime time);

	/**
	 * 根据车辆表id查
	 * 
	 * @param id
	 *            车辆表id
	 * @return 查询结果
	 */
	SetOutTime selectByCarId(Integer id);
}
