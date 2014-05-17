package com.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.common.Page;
import com.dao.ISendNodeDao;
import com.pojo.SendNode;
import com.pojo.User;
import com.service.ISendNodeService;
import com.service.UserService;

/**
 * 
 * @author ChengQi
 *
 */
public class SendNodeAction {
	//配送点对象
	private SendNode sendNode;
	
	private ISendNodeService service;
	private ISendNodeDao snd;
	
	//返回的结果集
	private List<SendNode> allNodes;
	
	//分页产生的部分结果集
	private List<SendNode> sendNodeList;
	private String username;
	private String nodename;
	private int id;
	private UserService userService;

	//总页面
	private int totalPage;
	
	//总记录数目
	private int totalRecord;
	
	//当前页面，其默认值为1
	private int curPage=1;
	
	//配置对象log
	Logger log=Logger.getLogger(SendNodeAction.class);

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}


	
	
	public String getNodename() {
		return nodename;
	}

	public void setNodename(String nodename) {
		this.nodename = nodename;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public ISendNodeDao getSnd() {
		return snd;
	}

	public void setSnd(ISendNodeDao snd) {
		this.snd = snd;
	}

	public ISendNodeService getService() {
		return service;
	}

	public void setService(ISendNodeService service) {
		this.service = service;
	}

	public SendNode getSendNode() {
		return sendNode;
	}

	public void setSendNode(SendNode sendNode) {
		this.sendNode = sendNode;
	}
	public UserService getUserService() {
		return userService;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public void setAllNodes(List<SendNode> allNodes) {
		this.allNodes = allNodes;
	}

	public List<SendNode> getAllNodes() {
		return allNodes;
	}

	public String deleteNode(){
		snd.delete(id);
		return "deleteSuccess";
	}
	
/*
 * 	得到全部的配送点信息
 */
	public String getAll(){
		Page page=new Page();
		allNodes=service.getAll();
		totalRecord=allNodes.size();
	
		page.setNumPerPage(3);
	//用来存储每次查询时候的开始位置和结束位置
		HashMap <String,Integer> map=new HashMap();
		int start=(curPage-1)*page.getNumPerPage();

		int end=curPage*page.getNumPerPage();
		if(end>totalRecord){
			end=totalRecord;
		}

		map.put("start", start);
		map.put("end", end);
	//分页方法，来产生相应的页数
		if(totalRecord%page.getNumPerPage()==0){
			totalPage=totalRecord/page.getNumPerPage();
		}else{
		totalPage=totalRecord/page.getNumPerPage()+1;
		}
		sendNodeList=service.getPartSendNode(map);

		return "success";
	}
	public List<SendNode> getSendNodeList() {
		return sendNodeList;
	}

	public void setSendNodeList(List<SendNode> sendNodeList) {
		this.sendNodeList = sendNodeList;
	}

	//根据id得到完整的信息
	public String getOne(){
		sendNode=service.getOne(id);
		return "getOne";
	}
	
	//在跳入到修改页面的时候所使用的方法 
	public String readyUpdate(){
		sendNode=service.getOne(id);
		return "readyUpdateSuccess";
	}
	
	public String insertSendNode(){
		User user=userService.selectByUsername(sendNode.getUsername());
		sendNode.setUser_id(user.getId());
		sendNode.setPassword(user.getPassword());
		
log.debug("log:"+sendNode);
		service.insertSendNode(sendNode);
		
		return "insertSuccess";
	}
	/**
	 * 更新配送点数据，其中username等用户信息根据username来得到
	 * @return 在方法成功时候所对应的跳转到的jsp 或action指标
	 */
	public String updateSendNode(){

		User user=userService.selectByUsername(sendNode.getUsername());
		sendNode.setUser_id(user.getId());
		sendNode.setPassword(user.getPassword());
		service.update(sendNode,sendNode.getId());
		return "updateSuccess";
	}
	
/**
 * ajax校验方法，用来检测根据用户名能否得到用户，判断username是否合法
 * @return
 */
	public String validateUserName(){
		HttpServletResponse response=ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		try {
			username = java.net.URLDecoder.decode(username, "utf-8");
		} catch (UnsupportedEncodingException e1) {
			log.error(e1);
		}
		try {
			out=response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			log.error(e);
		}
		if(username!=null &&!username.equals("") ){

			User user=userService.selectByUsername(username);
			if(user!=null){
				out.write("usernametrue");
			}else{
				out.write("usernamefalse");
			}
			out.flush();
			out.close();
		}else{
			//System.out.println("sendNode is null");
		}
		return "validateSuccess";
	}
	
	/**
	 * 同上，校验配送点名字
	 * @return
	 */
	public String validateNodename(){
		HttpServletResponse response=ServletActionContext.getResponse();
		PrintWriter out=null;

		try {
			nodename = java.net.URLDecoder.decode(nodename, "utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			out=response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(nodename!=""&&nodename!=null ){

			sendNode=service.getOneByNodename(nodename);

			if(sendNode!=null){
				out.write("nodenamefalse");
			}else{
				out.write("nodenametrue");
			}
			out.flush();
			out.close();
		}else{
			//System.out.println("sendNode is null");
		}
		return "validateSuccess";
	}
	
	//得到全部配送点的所有信息
	public String getAllDetails(){
		
		Page page=new Page();
		allNodes=service.getAllDetails();
		totalRecord=allNodes.size();
log.debug(totalRecord);
		page.setNumPerPage(3);
		
		HashMap <String,Integer> map=new HashMap();
		int start=(curPage-1)*page.getNumPerPage();
		int end=curPage*page.getNumPerPage();
		if(end>totalRecord){
			end=totalRecord;
		}

		map.put("start", start);
		map.put("end", end);
		//如果总记录数目取余每页的记录数3，如果结果是0，那么页面就不需要额外增加一面
		//否则，就需要额外增加一面用来存储多余的记录
		if(totalRecord%page.getNumPerPage()==0){
			totalPage=totalRecord/page.getNumPerPage();
		}else{
		totalPage=totalRecord/page.getNumPerPage()+1;
		}

		sendNodeList=service.getPartSendNode(map);

		return "getAllDetailsSuccess";
	}

}
