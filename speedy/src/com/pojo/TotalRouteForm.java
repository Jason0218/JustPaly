package com.pojo;

public class TotalRouteForm {

	private int id;
	
	private String routenum;
	
	private String Route_id;
	
	private String statenode;
	
	private String acrossnode;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoutenum() {
		return routenum;
	}

	public void setRoutenum(String routenum) {
		this.routenum = routenum;
	}

	public String getRoute_id() {
		return Route_id;
	}

	public void setRoute_id(String route_id) {
		Route_id = route_id;
	}

	public String getStatenode() {
		return statenode;
	}

	public void setStatenode(String statenode) {
		this.statenode = statenode;
	}

	public String getAcrossnode() {
		return acrossnode;
	}

	public void setAcrossnode(String acrossnode) {
		this.acrossnode = acrossnode;
	}

	public String getEndpoint() {
		return endpoint;
	}

	public void setEndpoint(String endpoint) {
		this.endpoint = endpoint;
	}

	private String endpoint;
}
