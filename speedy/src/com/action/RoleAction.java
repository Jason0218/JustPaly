package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.pojo.Permission;
import com.pojo.Role;
import com.service.RoleService;

/**
 * 处理页面中角色有关请求
 * 
 * @author czp
 * 
 */
public class RoleAction extends ActionSupport {
	private Logger log = Logger.getLogger(RoleAction.class); // log4j日志对象
	private List<Role> list; // role对象集合
	private RoleService roleService; // 角色service对象
	private Role role; // 角色对象
	private String rname; // 角色名称
	private String pidlist; // 权限对象集合
	private Integer rid; // 角色id
	private String rids; // 角色id数组
	private List<Permission> rolepms; // 角色拥有的权限对象集合
	private List<Permission> roleelsepms; // 角色没有的权限对象集合

	public List<Role> getList() {
		return list;
	}

	public void setList(List<Role> list) {
		this.list = list;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getPidlist() {
		return pidlist;
	}

	public void setPidlist(String pidlist) {
		this.pidlist = pidlist;
	}

	public Integer getRid() {
		return rid;
	}

	public void setRid(Integer rid) {
		this.rid = rid;
	}

	public String getRids() {
		return rids;
	}

	public void setRids(String rids) {
		this.rids = rids;
	}

	public List<Permission> getRolepms() {
		return rolepms;
	}

	public void setRolepms(List<Permission> rolepms) {
		this.rolepms = rolepms;
	}

	public List<Permission> getRoleelsepms() {
		return roleelsepms;
	}

	public void setRoleelsepms(List<Permission> roleelsepms) {
		this.roleelsepms = roleelsepms;
	}

	/**
	 * 处理查询所有role请求
	 * 
	 * @return
	 */
	public String selectAll() {
		list = roleService.selectAll();
		return SUCCESS;
	}

	/**
	 * 处理新增角色请求
	 * 
	 * @return
	 */
	public String addRole() {
		try {
			role.setRname(java.net.URLDecoder.decode(role.getRname(), "utf-8"));
		} catch (UnsupportedEncodingException e1) {
			log.error(e1.getMessage());
		}
		roleService.insert(role);
		Integer rid;
		rid = roleService.selectByRname(role.getRname()).getRid();
		String[] str = pidlist.split(",");
		for (int i = 0; i < str.length; i++) {
			Integer pid = Integer.parseInt(str[i]);
			roleService.serPms(rid, pid);
		}
		log.info("新增角色：" + role.getRname());
		return SUCCESS;
	}

	/**
	 * 处理验证角色名输入的请求
	 * 
	 * @return
	 */
	public String validateRoleName() {
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = null;
		try {
			rname = java.net.URLDecoder.decode(rname, "utf-8");
			log.debug(rname);
			out = response.getWriter();
		} catch (IOException e1) {
			log.error(e1.getMessage());
		}
		if (rname == null || "".equals(rname)) {// 输入的角色名称为空
			out.write("kong");
		} else {// 输入不为空
			Role r = roleService.selectByRname(rname);
			if (r == null) {// 角色名称既不为空，且唯一
				out.write("ok");
			} else {// 角色名重复
				out.write("chongfu");

			}
		}
		return null;
	}

	/**
	 * 处理根据rid删除请求
	 * 
	 * @return
	 */
	public String deleteByRid() {
		roleService.delete(rid);
		return SUCCESS;
	}

	/**
	 * 处理群删请求
	 * 
	 * @return
	 */
	public String deleteMany() {
		String[] str = rids.split(",");
		Integer[] ridss = new Integer[str.length];
		log.debug(ridss);
		for (int i = 0; i < str.length; i++) {
			ridss[i] = Integer.parseInt(str[i]);
		}
		roleService.deleteMany(ridss);
		return SUCCESS;
	}

	/**
	 * 处理显示角色请求
	 * 
	 * @return
	 */
	public String showRoleDetails() {
		role = roleService.selectById(rid);
		rolepms = roleService.showRolePms(rid);
		roleelsepms = roleService.showElseRolePms(rid);
		return SUCCESS;
	}

	/**
	 * 处理更新角色所有权限请求
	 * 
	 * @return
	 */
	public String updateRolePms() {
		roleService.removeRolePms(rid);
		String[] str = pidlist.split(",");
		log.debug(str);
		for (int i = 0; i < str.length; i++) {
			Integer pid = Integer.parseInt(str[i]);
			roleService.serPms(rid, pid);
		}
		return SUCCESS;
	}
}
