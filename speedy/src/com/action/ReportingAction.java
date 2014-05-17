
package com.action;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.pojo.AcceptForm;
import com.pojo.Companyreportform;
import com.pojo.SendForm;
import com.pojo.User;
import com.service.ReportingService;
import com.util.PageBean;
/**
 * 报表
 * @author yetao
 *
 */
public class ReportingAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;

	private ReportingService reportService;
	private PageBean<Companyreportform> pageBean;
	private PageBean<SendForm>pageBean2;
	private PageBean<AcceptForm>pageBean3;
	private int page=1;
	private Companyreportform comrepform;
	private int id;
	private static int times=1;
	private SendForm sendform;
	private AcceptForm acceptform;
	Logger log=Logger.getLogger(ReportingAction.class);
//	public int getTimes() {
//		return times;
//	}
//	public void setTimes(int times) {
//		this.times = times;
//	}
	public SendForm getSendform() {
		return sendform;
	}
	public void setSendform(SendForm sendform) {
		this.sendform = sendform;
	}
	public AcceptForm getAcceptform() {
		return acceptform;
	}
	public void setAcceptform(AcceptForm acceptform) {
		this.acceptform = acceptform;
	}
	public Companyreportform getComrepform() {
		return comrepform;
	}
	public void setComrepform(Companyreportform comrepform) {
		this.comrepform = comrepform;
	}
	public String tocompany() throws Exception{
	   // this.service.queryForPage(mapperKey, currentPage, pageSize, year)
		return "tocompany";
	}
	public String skipToBranch() throws Exception {
		return "tobranches";
	}
	public String skipToSendnodeFormdetail() throws Exception{
		String str=null;
		String formType=ServletActionContext.getRequest().getParameter("formType");
		String year=ServletActionContext.getRequest().getParameter("year");
		String season=ServletActionContext.getRequest().getParameter("season");
		String month=ServletActionContext.getRequest().getParameter("month");
		ServletActionContext.getRequest().setAttribute("formType", formType);
        ServletActionContext.getRequest().setAttribute("year", year);
        ServletActionContext.getRequest().setAttribute("season", season);
        ServletActionContext.getRequest().setAttribute("month", month);
        	if(formType.equals("发货")){
        		if(year.equals("请选择")&&season.equals("请选择")&&month.equals("请选择"))
        	pageBean2=this.reportService.queryForPage2("SendnodeformQueryAll", page, 5, year);
        		   else if(!year.equals("请选择")&&season.equals("请选择")&&month.equals("请选择")){
        	        	
        	        	pageBean2=this.reportService.queryForPage2("selectSendReport_ByYear", page, 5, year);
        	        }
        	        else if(!year.equals("请选择")&&!season.equals("请选择")&&month.equals("请选择")){
        	        	
        	        	pageBean2=this.reportService.queryForPage2("selectSendReport_BySeason", page, 5, year,season);
        	        }
        	        
        	        else if(!year.equals("请选择")&&!season.equals("请选择")&&!month.equals("请选择")){
        	        	
        			pageBean2=this.reportService.queryForPage2("selectSendReport_ByMonth",page, 5, year,season,month);
        	        }
        		str="tosendformdetail";
        	}else if(formType.equals("收货")){
        		if(year.equals("请选择")&&season.equals("请选择")&&month.equals("请选择"))
                	pageBean3=this.reportService.queryForPage3("AcceptformQueryAll", page, 5, year);
                		   else if(!year.equals("请选择")&&season.equals("请选择")&&month.equals("请选择")){
                	        	
                	        	pageBean3=this.reportService.queryForPage3("selectAcceptReport_ByYear", page, 5, year);
                	        }
                	        else if(!year.equals("请选择")&&!season.equals("请选择")&&month.equals("请选择")){
                	        	
                	        	pageBean3=this.reportService.queryForPage3("selectAcceptReport_BySeason", page, 5, year,season);
                	        }
                	        
                	        else if(!year.equals("请选择")&&!season.equals("请选择")&&!month.equals("请选择")){
                	        	
                			pageBean3=this.reportService.queryForPage3("selectAcceptReport_ByMonth",page, 5, year,season,month);
                	        }
        		str="toacceptformdetail";
        	}
        	
        	return str;
       
        
	
	}
	public String skipToCompanyFormdetail() throws Exception {
		String year=ServletActionContext.getRequest().getParameter("year");
		String season=ServletActionContext.getRequest().getParameter("season");
		String month=ServletActionContext.getRequest().getParameter("month");
        ServletActionContext.getRequest().setAttribute("year", year);
        ServletActionContext.getRequest().setAttribute("season", season);
        ServletActionContext.getRequest().setAttribute("month", month);
//        System.out.println("year:"+year);
//        System.out.println("season:"+season);
//        System.out.println("month:"+month);
        if(year.equals("请选择")&&season.equals("请选择")&&month.equals("请选择")){
        	
        	pageBean=this.reportService.queryForPage("CompanyreportformQueryAll", page, 5, year);
        }
        else if(!year.equals("请选择")&&season.equals("请选择")&&month.equals("请选择")){
        	
        	pageBean=this.reportService.queryForPage("selectReport_ByYear", page, 5, year);
        }
        else if(!year.equals("请选择")&&!season.equals("请选择")&&month.equals("请选择")){
        	
        	pageBean=this.reportService.queryForPage("selectReport_BySeason", page, 5, year,season);
        }
        
        else if(!year.equals("请选择")&&!season.equals("请选择")&&!month.equals("请选择")){
        	
		pageBean=this.reportService.queryForPage("queryForPageByYear",page, 5, year,season,month);
        }
        
       
       
        return "tocompanydetail";
	}
	
	public String printXls()throws Exception 
	{
		
		String year=ServletActionContext.getRequest().getParameter("year");
		String season=ServletActionContext.getRequest().getParameter("season");
		String month=ServletActionContext.getRequest().getParameter("month");
		
		ServletActionContext.getRequest().setAttribute("year", year);
        ServletActionContext.getRequest().setAttribute("season", season);
        ServletActionContext.getRequest().setAttribute("month", month);
        List<Companyreportform> computers=null;
       
       
		if(year.equals("请选择")&&season.equals("请选择")&&month.equals("请选择")){
        	//System.out.println("if:01");
        	
        	computers=this.reportService.queryAll("queryForAllByNone",year);
        	
        	pageBean=this.reportService.queryForPage("CompanyreportformQueryAll", page, 5, year);
        	
        }
        else if(!year.equals("请选择")&&season.equals("请选择")&&month.equals("请选择")){
        	//System.out.println("if:02");
        	computers=this.reportService.queryAll("queryForAllByYear",year);
        	pageBean=this.reportService.queryForPage("selectReport_ByYear", page, 5, year);
        	
        }
        else if(!year.equals("请选择")&&!season.equals("请选择")&&month.equals("请选择")){
        	//System.out.println("if:03");
        	computers=this.reportService.queryAll("queryForAllBySeason",year,season);
        	pageBean=this.reportService.queryForPage("selectReport_BySeason", page, 5, year,season);
        	
        }
        
        else if(!year.equals("请选择")&&!season.equals("请选择")&&!month.equals("请选择")){
        	//System.out.println("if:04");
        	 computers=this.reportService.queryAll("queryForAllByMonth",year,season,month);
        	 pageBean=reportService.queryForPage("queryForPageByYear",page, 5, year,season,month);
        	
        }
		
		
		File file = new File("C:/Documents and Settings/new/桌面/公司报表"+times+".xls");
		  if(!file.exists()){
		   file.createNewFile();
		  }
		  write2excel(computers, file);
		  times++;
	 

		return "tocompanydetail";
		
	}
	public String printXls2()throws Exception 
	{
		String formType=ServletActionContext.getRequest().getParameter("formType");
		String year=ServletActionContext.getRequest().getParameter("year");
		String season=ServletActionContext.getRequest().getParameter("season");
		String month=ServletActionContext.getRequest().getParameter("month");
		ServletActionContext.getRequest().setAttribute("formType", formType);
		ServletActionContext.getRequest().setAttribute("year", year);
        ServletActionContext.getRequest().setAttribute("season", season);
        ServletActionContext.getRequest().setAttribute("month", month);
        List<SendForm> computers=null;
        //if(formType.equals("发货")){
        	if(year.equals("请选择")&&season.equals("请选择")&&month.equals("请选择")){
            	
            	
            	computers=this.reportService.queryAll2("SendByNone",year);
            	
            	
            	pageBean2=this.reportService.queryForPage2("SendnodeformQueryAll", page, 5, year);
            	
            }
            else if(!year.equals("请选择")&&season.equals("请选择")&&month.equals("请选择")){
            	
            	computers=this.reportService.queryAll2("SendByYear",year);
            	pageBean2=this.reportService.queryForPage2("selectSendReport_ByYear", page, 5, year);
            	
            	
            }
            else if(!year.equals("请选择")&&!season.equals("请选择")&&month.equals("请选择")){
            	
            	computers=this.reportService.queryAll2("SendBySeason",year,season);
            	
            	pageBean2=this.reportService.queryForPage2("selectSendReport_BySeason", page, 5, year,season);
            	
            }
            
            else if(!year.equals("请选择")&&!season.equals("请选择")&&!month.equals("请选择")){
            	
            	 computers=this.reportService.queryAll2("SendByMonth",year,season,month);
            	
            	 pageBean2=this.reportService.queryForPage2("selectSendReport_ByMonth", page, 5, year,season,month);
            	 
            }
        
        
       
		
		
		File file = new File("C:/Documents and Settings/new/桌面/配送点发货报表"+times+".xls");
		  if(!file.exists()){
		   file.createNewFile();
		  }
		  write2excel2(computers, file);
		  times++;
	 

		return "tosendformdetail";
		
	}
	public String printXls3()throws Exception 
	{
		String formType=ServletActionContext.getRequest().getParameter("formType");
		String year=ServletActionContext.getRequest().getParameter("year");
		String season=ServletActionContext.getRequest().getParameter("season");
		String month=ServletActionContext.getRequest().getParameter("month");
		ServletActionContext.getRequest().setAttribute("formType", formType);
		ServletActionContext.getRequest().setAttribute("year", year);
        ServletActionContext.getRequest().setAttribute("season", season);
        ServletActionContext.getRequest().setAttribute("month", month);
        List<AcceptForm> computers=null;
        
        //else if(formType.equals("收货")){
        	if(year.equals("请选择")&&season.equals("请选择")&&month.equals("请选择")){
            	
            	
            	computers=this.reportService.queryAll3("AcceptByNone",year);
            	
            	
            	
            	pageBean3=this.reportService.queryForPage3("AcceptformQueryAll", page, 5, year);
            }
            else if(!year.equals("请选择")&&season.equals("请选择")&&month.equals("请选择")){
            	
            	computers=this.reportService.queryAll3("AcceptByYear",year);
            	
            	pageBean3=this.reportService.queryForPage3("selectAcceptReport_ByYear", page, 5, year);
            	
            }
            else if(!year.equals("请选择")&&!season.equals("请选择")&&month.equals("请选择")){
            	
            	computers=this.reportService.queryAll3("AcceptBySeason",year,season);
            	
            	pageBean3=this.reportService.queryForPage3("selectAcceptReport_BySeason", page, 5, year,season);
            }
            
            else if(!year.equals("请选择")&&!season.equals("请选择")&&!month.equals("请选择")){
            	
            	 computers=this.reportService.queryAll3("AcceptByMonth",year,season,month);
            	
            	 pageBean3=this.reportService.queryForPage3("selectAcceptReport_ByMonth", page, 5, year,season,month);
            }
    		
        
        
		
		
		File file = new File("C:/Documents and Settings/new/桌面/配送点收货报表"+times+".xls");
		  if(!file.exists()){
		   file.createNewFile();
		  }
		  write2excel3(computers, file);
		  times++;
	 

		return "toacceptformdetail";
		
	}
	public static void write2excel(List<Companyreportform> computers,File file) {
		  HSSFWorkbook excel = new HSSFWorkbook();
		  HSSFSheet sheet = excel.createSheet("总公司报表");
		  HSSFRow firstRow = sheet.createRow(0);
		  HSSFCell cells[] = new HSSFCell[6];
		  String[] titles = new String[] { "报表ID", "报表时间","报表生成时间", "配送点名称", "货物总重量",
		    "货物总体积","利润" };
		  for (int i = 0; i < 7; i++) {
		   cells[0] = firstRow.createCell(i);
		   cells[0].setCellValue(titles[i]);
		  }
		  for (int i = 0; i < computers.size(); i++) {
		   HSSFRow row = sheet.createRow(i + 1);
		   Companyreportform computer = computers.get(i);
		   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		   String formdateString=formatter.format(computer.getFormdate());
		   String formbirthdateString = formatter.format(computer.getFormbirthdate());
		   HSSFCell cell = row.createCell(0);
		   cell.setCellValue(computer.getId());
		   cell = row.createCell(1);
		   cell.setCellValue(formdateString);
		   cell=row.createCell(2);
		   cell.setCellValue(formbirthdateString);
		   cell=row.createCell(3);
		   cell.setCellValue(computer.getSendnode().getNodename());
		   cell = row.createCell(4);
		   cell.setCellValue(computer.getTotalweight());
		   cell = row.createCell(5);
		   cell.setCellValue(computer.getTotalvolume());
		   cell = row.createCell(6);
		   cell.setCellValue(computer.getTotalincome());
		   
		  }
		        FileOutputStream out = null;
		        try {
		            out = new FileOutputStream(file);
		            excel.write(out);
		            out.close();
		        } catch (FileNotFoundException e) {
		            e.printStackTrace();
		        } catch (IOException e) {
		            e.printStackTrace();
		        }
		 }
	public static void write2excel2(List<SendForm> computers,File file) {
		  HSSFWorkbook excel = new HSSFWorkbook();
		  HSSFSheet sheet = excel.createSheet("配送点发货报表");
		  HSSFRow firstRow = sheet.createRow(0);
		  HSSFCell cells[] = new HSSFCell[6];
		  String[] titles = new String[] { "报表ID", "报表时间","报表生成时间", "配送点名称", "货物总重量",
		    "货物总体积","利润" };
		  for (int i = 0; i < 7; i++) {
		   cells[0] = firstRow.createCell(i);
		   cells[0].setCellValue(titles[i]);
		  }
		  for (int i = 0; i < computers.size(); i++) {
		   HSSFRow row = sheet.createRow(i + 1);
		   SendForm computer = computers.get(i);
		   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		   String formdateString=formatter.format(computer.getFormdate());
		   String formbirthdateString = formatter.format(computer.getFormbirthdate());
		   HSSFCell cell = row.createCell(0);
		   cell.setCellValue(computer.getId());
		   cell = row.createCell(1);
		   cell.setCellValue(formdateString);
		   cell=row.createCell(2);
		   cell.setCellValue(formbirthdateString);
		   cell=row.createCell(3);
		   cell.setCellValue(computer.getSendnode().getNodename());
		   cell = row.createCell(4);
		   cell.setCellValue(computer.getTotalweight());
		   cell = row.createCell(5);
		   cell.setCellValue(computer.getTotalvolume());
		   cell = row.createCell(6);
		   cell.setCellValue(computer.getTotalincome());
		   
		  }
		        FileOutputStream out = null;
		        try {
		            out = new FileOutputStream(file);
		            excel.write(out);
		            out.close();
		        } catch (FileNotFoundException e) {
		            e.printStackTrace();
		        } catch (IOException e) {
		            e.printStackTrace();
		        }
		 }
	public static void write2excel3(List<AcceptForm> computers,File file) {
		  HSSFWorkbook excel = new HSSFWorkbook();
		  HSSFSheet sheet = excel.createSheet("配送点收货报表");
		  HSSFRow firstRow = sheet.createRow(0);
		  HSSFCell cells[] = new HSSFCell[6];
		  String[] titles = new String[] { "报表ID", "报表时间","报表生成时间", "配送点名称", "货物总重量",
		    "货物总体积","利润" };
		  for (int i = 0; i < 7; i++) {
		   cells[0] = firstRow.createCell(i);
		   cells[0].setCellValue(titles[i]);
		  }
		  for (int i = 0; i < computers.size(); i++) {
		   HSSFRow row = sheet.createRow(i + 1);
		   AcceptForm computer = computers.get(i);
		   SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		   String formdateString=formatter.format(computer.getFormdate());
		   String formbirthdateString = formatter.format(computer.getFormbirthdate());
		   HSSFCell cell = row.createCell(0);
		   cell.setCellValue(computer.getId());
		   cell = row.createCell(1);
		   cell.setCellValue(formdateString);
		   cell=row.createCell(2);
		   cell.setCellValue(formbirthdateString);
		   cell=row.createCell(3);
		   cell.setCellValue(computer.getSendnode().getNodename());
		   cell = row.createCell(4);
		   cell.setCellValue(computer.getTotalweight());
		   cell = row.createCell(5);
		   cell.setCellValue(computer.getTotalvolume());
		   cell = row.createCell(6);
		   cell.setCellValue(computer.getTotalincome());
		   
		  }
		        FileOutputStream out = null;
		        try {
		            out = new FileOutputStream(file);
		            excel.write(out);
		            out.close();
		        } catch (FileNotFoundException e) {
		            e.printStackTrace();
		        } catch (IOException e) {
		            e.printStackTrace();
		        }
		 }
	
	public String queryReportById(){
	
	comrepform=reportService.getReportById(id);
    System.out.println(comrepform);
	return "tocompanyOne";
	}
	public String SendformById(){ 
		
		
			
		
		sendform=reportService.getSendFormById(id);
		System.out.println(sendform);
		
		
		return "tosendformOne";
		
	}
	public String AcceptformById(){
		acceptform=reportService.getAcceptFormById(id);
		System.out.println(acceptform);
		System.out.println(acceptform.getTotalincome());
		return "toacceptformOne";
	}
	
	public void autoDo(){
		
	}
	public PageBean<Companyreportform> getPageBean() {
		return pageBean;
	}
	public void setPageBean(PageBean<Companyreportform> pageBean) {
		this.pageBean = pageBean;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public ReportingService getReportService() {
		return reportService;
	}
	public void setReportService(ReportingService reportService) {
		this.reportService = reportService;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String validateid1(){
		HttpServletResponse response=ServletActionContext.getResponse();
//		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		
		try {
			out=response.getWriter();


			sendform =reportService.getSendFormById(id);
			if(sendform!=null){
				out.write("idnumbertrue");
			}else{
				out.write("idnumberfalse");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			log.error(e);
		}finally{
		   if(out!=null){
			out.flush();
			out.close();
		   }
		}
		
		return "validateSuccess";
	}
	public String validateid2(){
		HttpServletResponse response=ServletActionContext.getResponse();
//		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		
		try {
			out=response.getWriter();
			acceptform =reportService.getAcceptFormById(id);
			if(acceptform!=null){
				out.write("idnumbertrue");
			
			}else{
				out.write("idnumberfalse");
				
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			log.error(e);
		}finally{
			if(out!=null){
			out.flush();
			out.close();
			}
		}
		
		return "validateSuccess";
		
		
	}
	public String validateid3(){
		HttpServletResponse response=ServletActionContext.getResponse();
//		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=null;
		
		try {
			out=response.getWriter();
			comrepform=reportService.getReportById(id);
			if(comrepform!=null){
				out.write("idnumbertrue");
			}else{
				out.write("idnumberfalse");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			log.error(e);
		}finally{
			if(out!=null){
			out.flush();
			out.close();
			}
		}
		return "validateSuccess";
	}
	public PageBean<SendForm> getPageBean2() {
		return pageBean2;
	}
	public void setPageBean2(PageBean<SendForm> pageBean2) {
		this.pageBean2 = pageBean2;
	}
	public PageBean<AcceptForm> getPageBean3() {
		return pageBean3;
	}
	public void setPageBean3(PageBean<AcceptForm> pageBean3) {
		this.pageBean3 = pageBean3;
	}
	
}



