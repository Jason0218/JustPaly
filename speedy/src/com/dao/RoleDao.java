package com.dao;

import java.util.List;
import java.util.Map;

import com.pojo.Permission;
import com.pojo.Role;

/**
 * 角色接口
 * 
 * @author czp
 * 
 */
public interface RoleDao {
	/**
	 * 查询所有角色
	 * 
	 * @return 角色list集合
	 */
	List<Role> selectAll();

	/**
	 * 根据id查询角色
	 * 
	 * @param rid
	 *            角色id
	 * @return 角色对象role
	 */
	Role selectById(Integer rid);

	/**
	 * 插入role
	 * 
	 * @param r
	 *            角色对象
	 * @return true 成功 false 失败
	 */
	Boolean insert(Role r);

	/**
	 * 
	 * @param rid
	 *            角色id
	 * @return true 成功 false 失败
	 */
	Boolean delete(Integer rid);

	/**
	 * 更新角色信息
	 * 
	 * @param r
	 *            修改过的新的角色对象
	 * @return true 成功 false 失败
	 */
	Boolean update(Role r);

	/**
	 * 根据角色名查询角色
	 * 
	 * @param rname
	 * @return 角色对象
	 */
	Role selectByRname(String rname);

	/**
	 * 在角色权限关系表插入角色权限关系
	 * 
	 * @param map
	 *            放（rid，pid）
	 * @return true 成功 false 失败
	 */
	Boolean setPms(Map<String, Object> map);

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
	 * 根据角色id删除该角色所有权限
	 * @param rid
	 * @return
	 */
	Boolean removeRolePms(Integer rid);
}
