package com.dao;

import com.pojo.SetOutTime;

/**
 * 发车时间表dao层接口
 * 
 * @author huijunjie
 * 
 */
public interface SetOutTimeDao {
	/**
	 * 新增发车时间
	 * 
	 * @param time
	 *            发车时间对象
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
