package com.pojo;
/**
 * 用户名
 * @author hwz
 *
 */
public class User {
  private Integer id;
/** 用户id */
  private String username;
/** 用户名*/
  private String password;
  /** 密码*/
  private String sex;
  /** 性别*/
  private String age;
  /**年龄 */
  private String tel;
  /** 电话*/
  private String address;
  /** 地址*/
  private String email;
  /** 邮箱*/
  private Integer rid;
  /** 角色id*/
  private int node_id;
  /** 配送点*/
  private int state;
  /** 用户状态*/
public int getState() {
	return state;
}
public void setState(int state) {
	this.state = state;
}
public int getNode_id() {
	return node_id;
}
public void setNode_id(int node_id) {
	this.node_id = node_id;
}
public Integer getId() {
	return id;
}
public void setId(Integer id) {
	this.id = id;
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
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
public String getAge() {
	return age;
}
public void setAge(String age) {
	this.age = age;
}
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public Integer getRid() {
	return rid;
}
public void setRid(Integer rid) {
	this.rid = rid;
}
   
}
