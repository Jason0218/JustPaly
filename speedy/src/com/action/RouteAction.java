package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletResponseAware;

import com.common.Page;
import com.pojo.PageModel;
import com.pojo.Route;
import com.pojo.TotalRoute;
import com.service.RouteService;

/**
 * 用来完成对线路的一切操作
 * @author weitao
 *
 */
public class RouteAction  implements ServletResponseAware{
	private RouteService routeService;
	private List<Route> list ;
	private List<TotalRoute> totalList;
	private Route route;
	private String id;
	private String inputRouteName;
	private HttpServletResponse response;
	private int curpage=1;
	private int totalRecord;
	private List<Route> list2;  
	private int totalPage;
      
	/**
	 * 查询所有线路的方法，得到的是Route对象的list集合。
	 * @return String
	 */
	public String query(){
		list = routeService.getAll();
		return "success";
	}
	
    /**
     * 分页显示所有线路表的信息 得到的是Route对象的list集合
     * @return String 
     */ 
	public String showRoute(){
	    Page page = new Page() ;
	  
		list = routeService.getAll();
	    totalRecord = list.size();
	    page.setNumPerPage(3);
	    Map<String, Integer> map = new HashMap<String,Integer>();
	    int start = (curpage-1)*page.getNumPerPage();
	    int end = curpage*page.getNumPerPage();
	    map.put("start", start);
	    map.put("end", end);
	    list2 = routeService.selectRouteByCondition(map);
	    if(totalRecord % page.getNumPerPage() == 0)
	          totalPage = totalRecord/page.getNumPerPage();
	    else
	    	  totalPage = totalRecord/page.getNumPerPage() + 1;
		return "success";
	}
	
	/**
	 *  添加线路信息  
	 * @return String
	 */
	public String insertRoute(){
			routeService.insertRoute(route);
			return "success";
	}
	
	
	/**
	 * 删除线路信息
	 * @return String
	 */
	public String deleteRoute(){
		String [] ids = id.split(",");
		for(int i=0;i<ids.length;i++)
		{	
			routeService.deleteRoute(Integer.parseInt(ids[i]));	
	    }
		return "success";
	}
	

	/**
	 * 更新线路信息
	 * @return String
	 */
	public String updateRoute()
	{
		routeService.updateRoute(route);
		return "success";
	}
	
	/**
	 * 验证线路名是否存在
	 * @return String
	 */
     public String checkRoute()
     {
    	 response.setContentType("text/html;charset=utf-8");
    	 PrintWriter out=null;
		try {
			out = response.getWriter();
		} catch (IOException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
    	 try {
    		 inputRouteName = java.net.URLDecoder.decode(inputRouteName, "utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	 list = routeService.selectRouteByName(inputRouteName);
    	 if(list.isEmpty())
			out.print("线路名称错误");
		else
			out.print(list.get(0).getId());
    	    
    	 out.flush();
		out.close();

    	 return "success";
     }
	
     
     public String checkRouteName()
     {
    	 response.setContentType("text/html;charset=utf-8");
    	 PrintWriter out=null;
		try {
			out = response.getWriter();
		} catch (IOException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}
    	 try {
    		 inputRouteName = java.net.URLDecoder.decode(inputRouteName, "utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	 list = routeService.selectRouteByName(inputRouteName);
    	 if(list.isEmpty())
			out.print("输入正确");
		else
			out.print("输入错误");    
    	out.flush();
		out.close();
     	return "success";
     }
     
	public RouteService getRouteService() {
		return routeService;
	}
	public void setRouteService(RouteService routeService) {
		this.routeService = routeService;
	}
	public List<Route> getList() {
		return list;
	}
	public void setList(List<Route> list) {
		this.list = list;
	}
	public Route getRoute() {
		return route;
	}
	public void setRoute(Route route) {
		this.route = route;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public List<TotalRoute> getTotalList() {
		return totalList;
	}
	public void setTotalList(List<TotalRoute> totalList) {
		this.totalList = totalList;
	}
	public String getInputRouteName() {
		return inputRouteName;
	}
	public void setInputRouteName(String inputRouteName) {
		this.inputRouteName = inputRouteName;
	}
	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		 this.response=response;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getCurpage() {
		return curpage;
	}

	public void setCurpage(int curpage) {
		this.curpage = curpage;
	}


	public List<Route> getList2() {
		return list2;
	}


	public void setList2(List<Route> list2) {
		this.list2 = list2;
	}


	public int getTotalPage() {
		return totalPage;
	}


	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}


}
