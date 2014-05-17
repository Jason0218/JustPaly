package com.service;

import java.util.List;

import com.pojo.Permission;
import com.pojo.Role;

/**
 * 角色service 接口
 * 
 * @author czp
 * 
 */
public interface RoleService {
	/**
	 * 查询所有角色
	 * 
	 * @return 角色list集合
	 */
	List<Role> selectAll();

	/**
	 * 插入role
	 * 
	 * @param r
	 *            角色对象
	 * @return true 成功 false 失败
	 */
	Boolean insert(Role r);

	/**
	 * 根据角色名查询角色
	 * 
	 * @param rname
	 * @return 角色对象
	 */
	Role selectByRname(String rname);

	/**
	 * 插入权限角色关系
	 * 
	 * @param rid
	 *            角色id
	 * @param pid
	 *            权限id
	 * @return
	 */
	Boolean serPms(Integer rid, Integer pid);

	/**
	 * 
	 * @param rid
	 *            角色id
	 * @return true 成功 false 失败
	 */
	Boolean delete(Integer rid);

	/**
	 * 批量删除角色
	 * 
	 * @param rids
	 * @return true 成功 false 失败
	 */
	Boolean deleteMany(Integer... rids);

	/**
	 * 根据角色id查询该角色所拥有的权限list集合
	 * 
	 * @param rid
	 *            角色id
	 * @return 权限list集合
	 */
	List<Permission> showRolePms(Integer rid);

	/**
	 * 根据角色id查询该角色所没有拥有的权限list集合
	 * 
	 * @param rid
	 *            角色id
	 * @return 该角色没有的权限list集合
	 */
	List<Permission> showElseRolePms(Integer rid);

	/**
	 * 根据id查询角色
	 * 
	 * @param rid
	 *            角色id
	 * @return 角色对象role
	 */
	Role selectById(Integer rid);

	/**
	 * 根据角色id删除该角色所有权限
	 * 
	 * @param rid
	 * @return
	 */
	Boolean removeRolePms(Integer rid);
}
