package com.pojo;

/**
 * 员工表
 * 
 * @author hjj
 * 
 */
public class Employee {
	/** 员工表id */
	private Integer id;
	/** 员工名字 */
	private String name;
	/** 性别 */
	private String sex;
	/** 年龄 */
	private String age;
	/** 角色id */
	private Integer role_id;
	/** 配送点id */
	private Integer node_id;
	/** 电话 */
	private String tel;
	/** 电子邮件 */
	private String email;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public Integer getRole_id() {
		return role_id;
	}

	public void setRole_id(Integer role_id) {
		this.role_id = role_id;
	}

	public Integer getNode_id() {
		return node_id;
	}

	public void setNode_id(Integer node_id) {
		this.node_id = node_id;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
