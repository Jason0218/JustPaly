package com.pojo;

public class SendNode {
	//对象数据库t_sendNode表中的每个字段
	private int id;
	private String nodename;
	private double innerprice;
	private int user_id;
	private String username;
	private String password;
	private String forwordnode;
	private String nextnode;
	private String nodetype;
	private int empcount;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNodename() {
		return nodename;
	}
	public void setNodename(String nodename) {
		this.nodename = nodename;
	}
	public double getInnerprice() {
		return innerprice;
	}
	public void setInnerprice(double innerprice) {
		this.innerprice = innerprice;
	}
	
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getForwordnode() {
		return forwordnode;
	}
	public void setForwordnode(String forwordnode) {
		this.forwordnode = forwordnode;
	}
	public String getNextnode() {
		return nextnode;
	}
	public void setNextnode(String nextnode) {
		this.nextnode = nextnode;
	}
	public String getNodetype() {
		return nodetype;
	}
	public void setNodetype(String nodetype) {
		this.nodetype = nodetype;
	}
	public int getEmpcount() {
		return empcount;
	}
	public void setEmpcount(int empcount) {
		this.empcount = empcount;
	}
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "id:  "+id+"   "+"nodename  "+nodename+"innerprice:  "+innerprice+"user_id: "+user_id+"username:  "+username+"password:  "+password+"forwordnode:  "+forwordnode+"nextnode:  "+nextnode+"nodetype:  "+nodetype;
		
	}
	
}
