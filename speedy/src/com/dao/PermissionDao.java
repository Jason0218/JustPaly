package com.dao;

import java.util.List;

import com.pojo.Permission;

/**
 * 权限接口
 * @author czp
 *
 */
public interface PermissionDao {
	/**
	 * 查询所有权限方法
	 * @return  permission对象集合
	 */
	List<Permission> selectAll();
	
	/**
	 * 根据权限名称查询权限
	 * @param pname 权限名称
	 * @return  权限对象
	 */
	Permission selectByPname(String pname);
	
	/**
	 * 插入权限
	 * @param pms
	 * @return
	 */
	Boolean insertPms(Permission pms);
	/**
	 * 根据pid删除权限信息
	 * @param pid
	 * @return 
	 */
	Boolean deleteById(Integer pid);
	
	/**
	 * 根据pid查询rid
	 * @param pid
	 * @return
	 */
	List selectRidByPid(Integer pid);
	
	/**
	 * 根据pid查询Permission对象
	 * @param pid
	 * @return
	 */
	Permission selectById(Integer pid);
	
	/**
	 * 更新权限信息
	 * @param pms
	 * @return
	 */
	Boolean updatePms(Permission pms);
}
