package com.action;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.common.Page;
import com.dao.GoodsStateDao;
import com.opensymphony.xwork2.ActionContext;
import com.pojo.AssQResult;
import com.pojo.AssociateList;
import com.pojo.User;

import com.pojo.GoodsState;
import com.service.AssociateListService;
import com.service.GoodsStateService;
import com.service.ISendNodeService;

/**
 * 交接单
 * 
 * @author fh,czp
 * 
 */
public class AssociateListAction {
	private String ndname;

	public String getNdname() {
		return ndname;
	}

	public void setNdname(String ndname) {
		this.ndname = ndname;
	}

	private String dsn;
	private ISendNodeService snService;

	public ISendNodeService getSnService() {
		return snService;
	}

	public void setSnService(ISendNodeService snService) {
		this.snService = snService;
	}

	public String getDsn() {
		return dsn;
	}

	public void setDsn(String dsn) {
		this.dsn = dsn;
	}

	private GoodsStateService gsService;

	public GoodsStateService getGsService() {
		return gsService;
	}

	public void setGsService(GoodsStateService gsService) {
		this.gsService = gsService;
	}

	private String sjd;
	private List<GoodsState> gsList;
	private AssociateListService associateListService;
	private String nname;
	private String destn;
	private GoodsState goodsState;
	private AssQResult assQResult;
	private List<AssQResult> assQResultList;
	private int totalPage;
	private int totalRecord;
	private int curpage = 1;
	private Integer oid;

	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public List<GoodsState> getGslist() {
		return gsList;
	}

	public void setGslist(List<GoodsState> gslist) {
		this.gsList = gslist;
	}

	public AssociateListService getAssociateListService() {
		return associateListService;
	}

	public void setAssociateListService(
			AssociateListService associateListService) {
		this.associateListService = associateListService;
	}

	public String getNname() {
		return nname;
	}

	public void setNname(String nname) {
		this.nname = nname;
	}

	public GoodsState getGoodsState() {
		return goodsState;
	}

	public void setGoodsState(GoodsState goodsState) {
		this.goodsState = goodsState;
	}

	public String queryGS() {
		gsList = associateListService.selectByNodeName(nname);
		return "success";
	}

	public List<GoodsState> getGsList() {
		return gsList;
	}

	public void setGsList(List<GoodsState> gsList) {
		this.gsList = gsList;
	}

	public AssQResult getAssQResult() {
		return assQResult;
	}

	public void setAssQResult(AssQResult assQResult) {
		this.assQResult = assQResult;
	}

	public List<AssQResult> getAssQResultList() {
		return assQResultList;
	}

	public void setAssQResultList(List<AssQResult> assQResultList) {
		this.assQResultList = assQResultList;
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

	public int getCurpage() {
		return curpage;
	}

	public void setCurpage(int curpage) {
		this.curpage = curpage;
	}

	/**
	 * 查询信息
	 * 
	 * @return
	 */
	public String showAssQResult() {
		Page page = new Page();
		page.setCurPage(curpage);
		page.setNumPerPage(5);
		if (assQResult.getNname() != null && !assQResult.getNname().equals("")) {
			try {
				assQResult.setNname(java.net.URLDecoder.decode(
						assQResult.getNname(), "utf-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		if (assQResult.getDestn() != null && !assQResult.getDestn().equals("")) {
			try {
				assQResult.setDestn(java.net.URLDecoder.decode(
						assQResult.getDestn(), "utf-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}

		assQResultList = associateListService.selectByCond(assQResult, page,
				sjd);
		totalRecord = associateListService.getTotalRecord(assQResult);
		totalPage = associateListService.getTotalPage(assQResult);
		return "success";
	}

	public String getDestn() {
		return destn;
	}

	public void setDestn(String destn) {
		this.destn = destn;
	}

	public String getSjd() {
		return sjd;
	}

	public void setSjd(String sjd) {
		this.sjd = sjd;
	}

	/**
	 * 生成交接单
	 * 
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String shengcheng() throws UnsupportedEncodingException {
		AssociateList ass = new AssociateList();
		ass.setAssociateDate(new Date());
		ass.setDestn(java.net.URLDecoder.decode(dsn, "utf-8"));
		ass.setEmployeeId(((User) (ServletActionContext.getRequest()
				.getSession().getAttribute("usr"))).getId());
		ass.setOrderId(oid);
		ass.setNodeId(snService.getOneByNodename(
				java.net.URLDecoder.decode(ndname, "utf-8")).getId());
		ass.setCarId(1);
		associateListService.insertAss(ass);

		GoodsState gs = gsService.getByOid(oid);
		gs.setArriveTime(new Date());
		gs.setNowposition(java.net.URLDecoder.decode(ndname, "utf-8"));
		String nextnode = snService.getOneByNodename(
				java.net.URLDecoder.decode(ndname, "utf-8")).getNextnode();
		gs.setNextposition(nextnode);
		gsService.updateState(gs);
		return "success";
	}
}
