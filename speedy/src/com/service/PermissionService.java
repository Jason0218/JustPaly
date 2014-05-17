package com.service;

import java.util.List;

import com.pojo.Permission;

/**
 * 权限service接口
 * 
 * @author czp
 * 
 */
public interface PermissionService {
	/**
	 * 查询所有权限方法
	 * 
	 * @return permission对象集合
	 */
	List<Permission> selectAll();

	/**
	 * 根据权限名称查询权限
	 * 
	 * @param pname
	 *            权限名称
	 * @return 权限对象
	 */
	Permission selectByPname(String pname);

	/**
	 * 插入权限
	 * 
	 * @param pms
	 * @return
	 */
	Boolean insertPms(Permission pms);

	/**
	 * 根据pid删除权限信息
	 * 
	 * @param pid
	 * @return
	 */
	Boolean deleteById(Integer pid);

	/**
	 * 根据pid数组群删
	 * 
	 * @param pids
	 * @return
	 */
	Boolean deleteByIds(Integer... pids);

	/**
	 * 根据pid查询Permission对象
	 * 
	 * @param pid
	 * @return
	 */
	Permission selectById(Integer pid);

	/**
	 * 更新权限信息
	 * 
	 * @param pms
	 * @return
	 */
	Boolean updatePms(Permission pms);
}
