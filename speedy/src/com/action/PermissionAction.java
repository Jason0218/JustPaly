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
 * �����й�Permission������� ��
 * 
 * @author czp
 * 
 */
public class PermissionAction extends ActionSupport {

	private Logger log = Logger.getLogger(PermissionAction.class); // log4j��־
	private PermissionService permissionService; // Ȩ��service����
	private List<Permission> list; // Ȩ�޶��󼯺�
	private String pname; // Ȩ������
	private Permission pms; // Ȩ�޶���
	private Integer pid; // Ȩ��id
	private String msg = ""; // ���ص���Ϣ
	private String pids; // Ⱥɾʱ��pid����

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
	 * ���� �������Ȩ�޼�������
	 * 
	 * @return
	 */
	public String getAllPermission() {
		list = permissionService.selectAll();
		return SUCCESS;
	}

	/**
	 * ���� ��֤Ȩ�����Ƿ�������
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
		if (pname == null || "".equals(pname)) {// ����Ϊ��
			out.write("kong");
		} else {// ���벻Ϊ��
			Permission p = permissionService.selectByPname(pname);
			if (p == null) {// ���벻Ϊ�գ���Ψһ
				out.write("ok");

			} else {// Ȩ�������ظ�
				out.write("chongfu");
			}
		}
		return null;
	}

	/**
	 * ��������Ȩ������
	 * 
	 * @return
	 */
	public String insertPms() {
		permissionService.insertPms(pms);
		log.info("����Ȩ�ޣ�" + pms.getPname());
		return SUCCESS;
	}

	/**
	 * ����ɾ������Permission����
	 * 
	 * @return
	 */
	public String deleteByPid() {
		boolean flag = permissionService.deleteById(pid);
		if (flag) {// ��Ȩ������ɾ����ɾ���ɹ�
			msg = "";
			return SUCCESS;
		}
		msg = "fail";// ɾ��ʧ��
		return ERROR;
	}

	/**
	 * ����ȺɾȨ������
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
		if (flag) {// ����Ȩ�޶�����ɾ����ɾ���ɹ�
			msg = "";
			return SUCCESS;
		}
		msg = "fail";// ���ڲ���ɾ����Ȩ�ޣ�ɾ��ʧ��
		return ERROR;
	}

	/**
	 * ������Ȩ����ϸ��Ϣ����
	 * 
	 * @return
	 */
	public String showPmsDetails() {
		pms = permissionService.selectById(pid);
		return SUCCESS;
	}

	/**
	 * �������Ȩ����Ϣ����
	 * 
	 * @return
	 */
	public String updatePms() {
		permissionService.updatePms(pms);
		return SUCCESS;
	}
}
