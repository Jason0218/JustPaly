package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.pojo.AllocateBean;
import com.pojo.AllocateCar;
import com.pojo.Car;
import com.pojo.GoodsState;
import com.pojo.SendNode;
import com.pojo.SetOutTime;
import com.service.AllocateBeanService;
import com.service.AllocateCarService;
import com.service.CarService;
import com.service.GoodsStateService;
import com.service.ISendNodeService;
import com.service.SetOutTimeService;

/**
 * AllocateBean控制层
 * 
 * @author huijunjie
 * 
 */
public class AllocateBeanAction {
	Logger log = Logger.getLogger(AllocateBeanAction.class);
	/** AllocateBean业务层 */
	private AllocateBeanService allocateBeanService;
	/** AllocateBean对象 */
	private AllocateBean allocate;
	/** AllocateBean集合 */
	private List<AllocateBean> list;
	/** 车辆service */
	private CarService carService;
	/** 车辆集合 */
	private List<Car> carList;
	/** 车牌号码 */
	private String carId;
	/** 总体积 */
	private String totalVol;
	/** 总重量 */
	private String totalWei;
	/** 站点名称 */
	private String nodenames;
	/** 目的地 */
	private String destns;
	/** 车辆调配service */
	private AllocateCarService alloCarService;
	/** 返回信息 */
	private String msg;
	/** 发车时间service */
	private SetOutTimeService timeService;
	/** 货物状态service */
	private GoodsStateService goodsStateService;
	/** 订单id */
	private String orderid;
	/** 配送点service */
	private ISendNodeService sendNodeService;

	public ISendNodeService getSendNodeService() {
		return sendNodeService;
	}

	public void setSendNodeService(ISendNodeService sendNodeService) {
		this.sendNodeService = sendNodeService;
	}

	public String getOrderid() {
		return orderid;
	}

	public void setOrderid(String orderid) {
		this.orderid = orderid;
	}

	public GoodsStateService getGoodsStateService() {
		return goodsStateService;
	}

	public void setGoodsStateService(GoodsStateService goodsStateService) {
		this.goodsStateService = goodsStateService;
	}

	public SetOutTimeService getTimeService() {
		return timeService;
	}

	public void setTimeService(SetOutTimeService timeService) {
		this.timeService = timeService;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public AllocateCarService getAlloCarService() {
		return alloCarService;
	}

	public void setAlloCarService(AllocateCarService alloCarService) {
		this.alloCarService = alloCarService;
	}

	public String getNodenames() {
		return nodenames;
	}

	public void setNodenames(String nodenames) {
		this.nodenames = nodenames;
	}

	public String getDestns() {
		return destns;
	}

	public void setDestns(String destns) {
		this.destns = destns;
	}

	public AllocateBean getAllocate() {
		return allocate;
	}

	public void setAllocate(AllocateBean allocate) {
		this.allocate = allocate;
	}

	public String getTotalVol() {
		return totalVol;
	}

	public void setTotalVol(String totalVol) {
		this.totalVol = totalVol;
	}

	public String getTotalWei() {
		return totalWei;
	}

	public void setTotalWei(String totalWei) {
		this.totalWei = totalWei;
	}

	public String getCarId() {
		return carId;
	}

	public void setCarId(String carId) {
		this.carId = carId;
	}

	public CarService getCarService() {
		return carService;
	}

	public void setCarService(CarService carService) {
		this.carService = carService;
	}

	public List<Car> getCarList() {
		return carList;
	}

	public void setCarList(List<Car> carList) {
		this.carList = carList;
	}

	public List<AllocateBean> getList() {
		return list;
	}

	public void setList(List<AllocateBean> list) {
		this.list = list;
	}

	public AllocateBeanService getAllocateBeanService() {
		return allocateBeanService;
	}

	public void setAllocateBeanService(AllocateBeanService allocateBeanService) {
		this.allocateBeanService = allocateBeanService;
	}

	/**
	 * 显示所有空闲车辆
	 * 
	 * @return suc
	 */
	public String showAllocate() {
		// 查询所有allocateBean集合
		list = allocateBeanService.selectAll(allocate);
		Car c = new Car();
		c.setState("空闲");
		// 查询空闲状态的所有车辆
		carList = carService.selectByState(c);
		log.debug("carList数量：" + carList.size());
		return "suc";
	}

	/**
	 * 验证车辆是否承受的起
	 * 
	 * @return
	 */
	public String validate() {
		// 获取response对象
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		// 创建PrintWriter对象
		PrintWriter out = null;
		try {
			// 转码
			carId = java.net.URLDecoder.decode(carId, "utf-8");
			log.debug("carId:" + carId);
			out = response.getWriter();
		} catch (UnsupportedEncodingException e) {
			log.error(e);
		} catch (IOException e) {
			log.error(e);
		}
		// 车牌号码不为空
		if (carId != null && !carId.equals("")) {
			Car c = carService.selectById(carId);
			// 判断车辆是否承载的起
			if (c.getVolume() < Double.parseDouble(totalVol)
					|| c.getDeadweight() < Double.parseDouble(totalWei)) {
				out.write("false");
			} else {
				out.write("true");
			}
			out.flush();
			out.close();
		}
		return "suc";
	}

	/**
	 * 车辆调配
	 * 
	 * @return
	 */
	public String allocateCar() {
		try {
			// 转码
			carId = java.net.URLDecoder.decode(carId, "utf-8");
			log.debug("carId:" + carId);
			nodenames = java.net.URLDecoder.decode(nodenames, "utf-8");
			log.debug("nodename:" + nodenames);
			destns = java.net.URLDecoder.decode(destns, "utf-8");
			log.debug("destn:" + destns);
		} catch (UnsupportedEncodingException e) {
			log.error(e);
		}
		// 更改车辆状态
		Car car = carService.selectById(carId);
		car.setState("出行");
		carService.updateCar(car);
		// 车辆调配表新增信息
		AllocateCar allocar = new AllocateCar();
		allocar.setCarid(car.getId());
		allocar.setNowposition(nodenames);
		allocar.setDestn(destns);
		allocar.setOrderid(Integer.parseInt(orderid));
		alloCarService.insertAllo(allocar);
		// 发车时间表新增信息
		SetOutTime time = new SetOutTime();
		time.setCarid(car.getId());
		time.setSetouttime(new Date());
		timeService.insertTime(time);
		// 货物状态表录入信息
		GoodsState gs = new GoodsState();
		gs.setBagnum(orderid);
		gs.setOrderId(Integer.parseInt(orderid));
		gs.setNowposition(nodenames);
		SendNode sendNode = sendNodeService.getOneByNodename(nodenames);
		gs.setNextposition(sendNode.getNextnode());
		goodsStateService.insertState(gs);
		// msg传给页面处理结果的响应信息
		msg = "success";
		return "suc";
	}
}
