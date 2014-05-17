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
 * 控制层 用户相关处理
 * 
 * @author hwz
 * 
 */
public class UserAction {
	/** 用户状态service */
	private UserService userService;
	/** 用户对象 */
	private User user = new User();

	/** 用户名 */
	private String username;
	/** 用户list集合 */
	private List<User> userList;
	/** 总的页数 */
	private int totalPage;
	/** 当前页 */
	private int curpage = 1;
	/** 总的记录数 */
	private int totalRec;
	private int id;
	private String msg = "";
	private String yzm;
	/** 订单service */
	OrderService orderService;
	/** 角色service */
	RoleService roleService;
	/** 权限list */
	List<Permission> pmsList;
	/** 角色list集合 */
	private List<Role> rolist;
	/** 配送点list集合 */
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
	 * 新增用户
	 * 
	 * @return success
	 */
	public String insertUser() {
		userService.insertUser(user);
		return "success";
	}

	/**
	 * 根据用户名查询
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
	 * 更新修改用户信息
	 * 
	 * @return success
	 */
	public String updateUser() {
		log.debug(user.getId() + "," + user.getUsername());

		userService.updateUser(user);
		return "success";
	}

	/**
	 * 验证用户名是否已经存在
	 * 
	 * @return success
	 */
	public String validateUserName() {
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			username = java.net.URLDecoder.decode(username, "utf-8");
			// 转码...处理乱码问题
			out = response.getWriter();
		} catch (UnsupportedEncodingException e) {
			log.error(e);
		} catch (IOException e) {
			log.error(e);
		}
		if (username != null && !username.equals("")) {// 判断用户是否存在
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
	 * 查出用户集合返回给页面
	 * 
	 * @return success
	 */
	public String showUser() {
		// 设置分页
		Page page = new Page();
		page.setCurPage(curpage);
		page.setNumPerPage(5);
		if (user.getUsername() != null && !user.getUsername().equals("")) {
			try {
				user.setUsername(java.net.URLDecoder.decode(user.getUsername(),
						"utf-8"));
				// 处理乱码问题
			} catch (UnsupportedEncodingException e) {
				log.error(e);
			}
		}
		if (user.getSex() != null && !user.getSex().equals("")) {
			try {
				user.setSex(java.net.URLDecoder.decode(user.getSex(), "utf-8"));
				// 处理乱码问题
			} catch (UnsupportedEncodingException e) {
				log.error(e);
			}
		}
		if (user.getAddress() != null && !user.getAddress().equals("")) {
			try {
				user.setAddress(java.net.URLDecoder.decode(user.getAddress(),
						"utf-8"));
				// 处理乱码问题
			} catch (UnsupportedEncodingException e) {
				log.error(e);
			}
		}
		log.debug(user.getUsername());
		// 根据条件查询分页显示
		userList = userService.selectByCondition(user, page);
		log.debug(userList.size());
		totalRec = userService.getTotalRec(user);
		totalPage = userService.getTotalPage(user);
		return "success";
	}

	/**
	 * 后台登陆判断执行
	 * 
	 * @return success 登陆成功 error 用户禁用or用户名或密码错误
	 */
	public String execute() {
		User userFinded = userService.selectByUsername(u1.getUsername());
		// 判断用户名
		if ((ServletActionContext.getRequest().getSession()
				.getAttribute("radomString").toString()).equalsIgnoreCase(yzm)) {

			if (userFinded != null
					&& userFinded.getPassword().equals(u1.getPassword())) {
				// 判断密码
				if (userFinded.getState() == 0) {
					// 判断用户状态
					HttpSession session = ServletActionContext.getRequest()
							.getSession();
					session.setAttribute("usr", userFinded);
					log.debug(userFinded.getUsername());

					pmsList = roleService.showRolePms(userFinded.getRid());
					session.setAttribute("pmsList", pmsList);
					msg = "";
					return "success";
				} else {
					msg = "该用户已被禁用";
					return "error";
				}
			} else {
				msg = "用户名或密码错误！";
				return "error";
			}
		}
		msg = "验证码错误！";
		return "error";
	}

	/**
	 * 后台退出
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
	 * 根据id删除
	 * 
	 * @return success
	 */
	public String deleteUser() {
		userService.deleteUser(id);
		return "success";
	}

	/**
	 * 群删
	 * 
	 * @return success 群删成功 fail 群删失败
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
	 * 更新用户状态
	 * 
	 * @return success
	 */
	public String updateState() {
		userService.updateState(user);
		return "success";
	}

}
