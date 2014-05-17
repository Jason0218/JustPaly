package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.pojo.Permission;
import com.service.PermissionService;

/**
 * 处理有关Permission的请求的 类
 * 
 * @author czp
 * 
 */
public class PermissionAction extends ActionSupport {

	private Logger log = Logger.getLogger(PermissionAction.class); // log4j日志
	private PermissionService permissionService; // 权限service对象
	private List<Permission> list; // 权限对象集合
	private String pname; // 权限名称
	private Permission pms; // 权限对象
	private Integer pid; // 权限id
	private String msg = ""; // 返回的信息
	private String pids; // 群删时的pid数组

	public PermissionService getPermissionService() {
		return permissionService;
	}

	public void setPermissionService(PermissionService permissionService) {
		this.permissionService = permissionService;
	}

	public List<Permission> getList() {
		return list;
	}

	public void setList(List<Permission> list) {
		this.list = list;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Permission getPms() {
		return pms;
	}

	public void setPms(Permission pms) {
		this.pms = pms;
	}

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getPids() {
		return pids;
	}

	public void setPids(String pids) {
		this.pids = pids;
	}

	/**
	 * 处理 获得所有权限集合请求
	 * 
	 * @return
	 */
	public String getAllPermission() {
		list = permissionService.selectAll();
		return SUCCESS;
	}

	/**
	 * 处理 验证权限名是否充分请求
	 * 
	 * @return
	 */
	public String validatePmsName() {
		HttpServletResponse response = ServletActionContext.getResponse();
		PrintWriter out = null;
		try {
			pname = java.net.URLDecoder.decode(pname, "utf-8");
			log.debug(pname);
			out = response.getWriter();
		} catch (IOException e1) {
			log.error(e1.getMessage());
		}
		if (pname == null || "".equals(pname)) {// 输入为空
			out.write("kong");
		} else {// 输入不为空
			Permission p = permissionService.selectByPname(pname);
			if (p == null) {// 输入不为空，且唯一
				out.write("ok");

			} else {// 权限名称重复
				out.write("chongfu");
			}
		}
		return null;
	}

	/**
	 * 处理新增权限请求
	 * 
	 * @return
	 */
	public String insertPms() {
		permissionService.insertPms(pms);
		log.info("新增权限：" + pms.getPname());
		return SUCCESS;
	}

	/**
	 * 处理删除单个Permission请求
	 * 
	 * @return
	 */
	public String deleteByPid() {
		boolean flag = permissionService.deleteById(pid);
		if (flag) {// 该权限允许删除，删除成功
			msg = "";
			return SUCCESS;
		}
		msg = "fail";// 删除失败
		return ERROR;
	}

	/**
	 * 处理群删权限请求
	 * 
	 * @return
	 */
	public String deleteManyPms() {
		String[] str = pids.split(",");
		Integer[] pidss = new Integer[str.length];
		log.debug(pidss);
		for (int i = 0; i < str.length; i++) {
			pidss[i] = Integer.parseInt(str[i]);
		}
		boolean flag = permissionService.deleteByIds(pidss);
		if (flag) {// 所有权限都允许删除，删除成功
			msg = "";
			return SUCCESS;
		}
		msg = "fail";// 存在不能删除的权限，删除失败
		return ERROR;
	}

	/**
	 * 处理获得权限详细信息请求
	 * 
	 * @return
	 */
	public String showPmsDetails() {
		pms = permissionService.selectById(pid);
		return SUCCESS;
	}

	/**
	 * 处理更新权限信息请求
	 * 
	 * @return
	 */
	public String updatePms() {
		permissionService.updatePms(pms);
		return SUCCESS;
	}
}
