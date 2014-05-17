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
 * ����ҳ���н�ɫ�й�����
 * 
 * @author czp
 * 
 */
public class RoleAction extends ActionSupport {
	private Logger log = Logger.getLogger(RoleAction.class); // log4j��־����
	private List<Role> list; // role���󼯺�
	private RoleService roleService; // ��ɫservice����
	private Role role; // ��ɫ����
	private String rname; // ��ɫ����
	private String pidlist; // Ȩ�޶��󼯺�
	private Integer rid; // ��ɫid
	private String rids; // ��ɫid����
	private List<Permission> rolepms; // ��ɫӵ�е�Ȩ�޶��󼯺�
	private List<Permission> roleelsepms; // ��ɫû�е�Ȩ�޶��󼯺�

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
	 * �����ѯ����role����
	 * 
	 * @return
	 */
	public String selectAll() {
		list = roleService.selectAll();
		return SUCCESS;
	}

	/**
	 * ����������ɫ����
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
		log.info("������ɫ��" + role.getRname());
		return SUCCESS;
	}

	/**
	 * ������֤��ɫ�����������
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
		if (rname == null || "".equals(rname)) {// ����Ľ�ɫ����Ϊ��
			out.write("kong");
		} else {// ���벻Ϊ��
			Role r = roleService.selectByRname(rname);
			if (r == null) {// ��ɫ���ƼȲ�Ϊ�գ���Ψһ
				out.write("ok");
			} else {// ��ɫ���ظ�
				out.write("chongfu");

			}
		}
		return null;
	}

	/**
	 * �������ridɾ������
	 * 
	 * @return
	 */
	public String deleteByRid() {
		roleService.delete(rid);
		return SUCCESS;
	}

	/**
	 * ����Ⱥɾ����
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
	 * ������ʾ��ɫ����
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
	 * ������½�ɫ����Ȩ������
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
