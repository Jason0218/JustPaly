package com.action;

import java.io.UnsupportedEncodingException;
import java.util.List;
import com.pojo.TotalRoute;
import com.service.TotalRouteService;

/**
 * 用来完成总线路的信息操作
 * @author weitao
 *
 */
public class TotalRouteAction {

	private int id;
	private TotalRouteService totalRouteService;
	private List<TotalRoute> totalRouteList;
	private String totalRouteNum;
	private String totalRouteName;
	private TotalRoute totalRoute;
	private String ids;
	public TotalRouteService getTotalRouteService() {
		return totalRouteService;
	}

	public void setTotalRouteService(TotalRouteService totalRouteService) {
		this.totalRouteService = totalRouteService;
	}
	/*
	 * 连表查询新路信息
	 */
	public String queryTotalRoutes(){
		totalRouteList = totalRouteService.getAll();
		return "success";
	}
	/*
	 * 通过id连表查询数据
	 */
    public String  queryTotalRoutesById()
    {
    	totalRouteList = totalRouteService.getAllById(id);
	    return "success";    
    }
    /*
     * 通过编号连表查询
     */
     public String queryTotalRoutesByNum()
     {
    	 totalRouteList = totalRouteService.getAllByNum(totalRouteNum);
    	 return "success";
     }
    /*
     * 通过线路名连表查询
     */
     public String queryTotalRoutesByName()
     {
    	 try {
			totalRouteName = new String(totalRouteName.getBytes("ISO-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	 totalRouteList = totalRouteService.getAllByName(totalRouteName);
    	 return "success";
     }
       /*
        *   删除总线路信息
        */
     public String deleteTotalRoutes()
     {
    	String [] idss = ids.split(",");
 		for(int i=0;i<idss.length;i++)
 		{	
 			totalRouteService.deleteTotalRoute(Integer.parseInt(idss[i]));	
 	    }
    	 return "success";
     }
     
     /*
      * 插入总线路信息
      */
     public String insertTotalRoutes()
     {
    	 totalRouteService.insertTotalRoute(totalRoute);
    	 return "success";
     }
     
     
     public String updateTotalRoutes()
 	{
 		totalRouteService.updateTotalRoute(totalRoute);
 		return "success";
 	}
	public List<TotalRoute> getTotalRouteList() {
		return totalRouteList;
	}

	
	public void setTotalRouteList(List<TotalRoute> totalRouteList) {
		this.totalRouteList = totalRouteList;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTotalRouteNum() {
		return totalRouteNum;
	}

	public void setTotalRouteNum(String totalRouteNum) {
		this.totalRouteNum = totalRouteNum;
	}

	public String getTotalRouteName() {
		return totalRouteName;
	}

	public void setTotalRouteName(String totalRouteName) {
		this.totalRouteName = totalRouteName;
	}

	public TotalRoute getTotalRoute() {
		return totalRoute;
	}

	public void setTotalRoute(TotalRoute totalRoute) {
		this.totalRoute = totalRoute;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

}
