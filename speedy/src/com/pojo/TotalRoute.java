package com.pojo;
/**
 * 总线路信息实体，可以为线路插入中间站
 * @author weitao
 *
 */
public class TotalRoute {

	private int id;
	
	private String routenum;
	
	private int route_id;
	
	private String startnode;
	
	private String acrossnoade;
	
	private String endpoint;
	
	private Route route;

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

	public int getRoute_id() {
		return route_id;
	}

	public void setRoute_id(int route_id) {
		this.route_id = route_id;
	}

	

	public String getAcrossnoade() {
		return acrossnoade;
	}

	public void setAcrossnoade(String acrossnoade) {
		this.acrossnoade = acrossnoade;
	}

	public String getEndpoint() {
		return endpoint;
	}

	public void setEndpoint(String endpoint) {
		this.endpoint = endpoint;
	}

	public Route getRoute() {
		return route;
	}

	public void setRoute(Route route) {
		this.route = route;
	}

	public String getStartnode() {
		return startnode;
	}

	public void setStartnode(String startnode) {
		this.startnode = startnode;
	}
	
}
