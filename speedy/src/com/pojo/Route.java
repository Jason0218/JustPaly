package com.pojo;
/**
 * 线路实体类，主要用来表示线路的基本信息。
 * @author weitao
 *
 */
public class Route {

	private int id;
	
	private String routename;
	
	private String routefrom;
	
	private String routeto;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoutename() {
		return routename;
	}

	public void setRoutename(String routename) {
		this.routename = routename;
	}

	public String getRoutefrom() {
		return routefrom;
	}

	public void setRoutefrom(String routefrom) {
		this.routefrom = routefrom;
	}

	public String getRouteto() {
		return routeto;
	}

	public void setRouteto(String routeto) {
		this.routeto = routeto;
	}

	@Override
	public String toString() {
		return "Route [id=" + id + ", routename=" + routename + ", routefrom="
				+ routefrom + ", routeto=" + routeto + "]";
	}	
}
