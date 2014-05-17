package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import org.apache.log4j.Logger;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.common.Page;

import com.pojo.Permission;
import com.pojo.Role;
import com.pojo.SendNode;
import com.pojo.User;
import com.service.OrderService;
import com.service.RoleService;
import com.service.UserService;

/**
 * ���Ʋ� �û���ش���
 * 
 * @author hwz
 * 
 */
public class UserAction {
	/** �û�״̬service */
	private UserService userService;
	/** �û����� */
	private User user = new User();

	/** �û��� */
	private String username;
	/** �û�list���� */
	private List<User> userList;
	/** �ܵ�ҳ�� */
	private int totalPage;
	/** ��ǰҳ */
	private int curpage = 1;
	/** �ܵļ�¼�� */
	private int totalRec;
	private int id;
	private String msg = "";
	private String yzm;
	/** ����service */
	OrderService orderService;
	/** ��ɫservice */
	RoleService roleService;
	/** Ȩ��list */
	List<Permission> pmsList;
	/** ��ɫlist���� */
	private List<Role> rolist;
	/** ���͵�list���� */
	private List<SendNode> nolist;
	private User u1;
	private String ids;
	Logger log = Logger.getLogger(UserAction.class);

	public User getU1() {
		return u1;
	}

	public void setU1(User u1) {
		this.u1 = u1;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public OrderService getOrderService() {
		return orderService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public List<SendNode> getNolist() {
		return nolist;
	}

	public void setNolist(List<SendNode> nolist) {
		this.nolist = nolist;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public RoleService getRoleService() {
		return roleService;
	}

	public void setRoleService(RoleService roleService) {
		this.roleService = roleService;
	}

	public int getTotalRec() {
		return totalRec;
	}

	public void setTotalRec(int totalRec) {
		this.totalRec = totalRec;
	}

	public List<User> getUserList() {
		return userList;
	}

	public void setUserList(List<User> userList) {
		this.userList = userList;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurpage() {
		return curpage;
	}

	public void setCurpage(int curpage) {
		this.curpage = curpage;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getYzm() {
		return yzm;
	}

	public void setYzm(String yzm) {
		this.yzm = yzm;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public List<Permission> getPmsList() {
		return pmsList;
	}

	public void setPmsList(List<Permission> pmsList) {
		this.pmsList = pmsList;
	}

	public List<Role> getRolist() {
		return rolist;
	}

	public void setRolist(List<Role> rolist) {
		this.rolist = rolist;
	}

	/**
	 * �����û�
	 * 
	 * @return success
	 */
	public String insertUser() {
		userService.insertUser(user);
		return "success";
	}

	/**
	 * �����û�����ѯ
	 * 
	 * @return success
	 */
	public String selectByUsername() {
		user = userService.selectByUserId(id);
		rolist = roleService.selectAll();
		nolist = orderService.selectAllNode();
		return "success";
	}

	/**
	 * �����޸��û���Ϣ
	 * 
	 * @return success
	 */
	public String updateUser() {
		log.debug(user.getId() + "," + user.getUsername());

		userService.updateUser(user);
		return "success";
	}

	/**
	 * ��֤�û����Ƿ��Ѿ�����
	 * 
	 * @return success
	 */
	public String validateUserName() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			username = java.net.URLDecoder.decode(username, "utf-8");
			// ת��...������������
			out = response.getWriter();
		} catch (UnsupportedEncodingException e) {
			log.error(e);
		} catch (IOException e) {
			log.error(e);
		}
		if (username != null && !username.equals("")) {// �ж��û��Ƿ����
			User u = userService.selectByUsername(username);
			if (u != null) {
				out.write("false");
			} else {
				out.write("true");
			}
			out.flush();
			out.close();
		}
		return "success";
	}

	/**
	 * ����û����Ϸ��ظ�ҳ��
	 * 
	 * @return success
	 */
	public String showUser() {
		// ���÷�ҳ
		Page page = new Page();
		page.setCurPage(curpage);
		page.setNumPerPage(5);
		if (user.getUsername() != null && !user.getUsername().equals("")) {
			try {
				user.setUsername(java.net.URLDecoder.decode(user.getUsername(),
						"utf-8"));
				// ������������
			} catch (UnsupportedEncodingException e) {
				log.error(e);
			}
		}
		if (user.getSex() != null && !user.getSex().equals("")) {
			try {
				user.setSex(java.net.URLDecoder.decode(user.getSex(), "utf-8"));
				// ������������
			} catch (UnsupportedEncodingException e) {
				log.error(e);
			}
		}
		if (user.getAddress() != null && !user.getAddress().equals("")) {
			try {
				user.setAddress(java.net.URLDecoder.decode(user.getAddress(),
						"utf-8"));
				// ������������
			} catch (UnsupportedEncodingException e) {
				log.error(e);
			}
		}
		log.debug(user.getUsername());
		// ����������ѯ��ҳ��ʾ
		userList = userService.selectByCondition(user, page);
		log.debug(userList.size());
		totalRec = userService.getTotalRec(user);
		totalPage = userService.getTotalPage(user);
		return "success";
	}

	/**
	 * ��̨��½�ж�ִ��
	 * 
	 * @return success ��½�ɹ� error �û�����or�û������������
	 */
	public String execute() {
		User userFinded = userService.selectByUsername(u1.getUsername());
		// �ж��û���
		if ((ServletActionContext.getRequest().getSession()
				.getAttribute("radomString").toString()).equalsIgnoreCase(yzm)) {

			if (userFinded != null
					&& userFinded.getPassword().equals(u1.getPassword())) {
				// �ж�����
				if (userFinded.getState() == 0) {
					// �ж��û�״̬
					HttpSession session = ServletActionContext.getRequest()
							.getSession();
					session.setAttribute("usr", userFinded);
					log.debug(userFinded.getUsername());

					pmsList = roleService.showRolePms(userFinded.getRid());
					session.setAttribute("pmsList", pmsList);
					msg = "";
					return "success";
				} else {
					msg = "���û��ѱ�����";
					return "error";
				}
			} else {
				msg = "�û������������";
				return "error";
			}
		}
		msg = "��֤�����";
		return "error";
	}

	/**
	 * ��̨�˳�
	 * 
	 * @return success
	 */
	public String logout() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("usr");
		session.removeAttribute("pmsList");
		return "success";
	}

	/**
	 * ����idɾ��
	 * 
	 * @return success
	 */
	public String deleteUser() {
		userService.deleteUser(id);
		return "success";
	}

	/**
	 * Ⱥɾ
	 * 
	 * @return success Ⱥɾ�ɹ� fail Ⱥɾʧ��
	 */
	public String deleteUserByIds() {
		String[] idStrArr = ids.split(",");
		Integer[] idArr = new Integer[idStrArr.length];
		for (int i = 0; i < idStrArr.length; i++) {
			idArr[i] = Integer.parseInt(idStrArr[i]);
		}
		boolean flag = userService.deleteUserByIds(idArr);
		if (flag)
			return "success";
		msg = "fail";
		return "fail";
	}

	/**
	 * �����û�״̬
	 * 
	 * @return success
	 */
	public String updateState() {
		userService.updateState(user);
		return "success";
	}

}
