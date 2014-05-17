package com.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.common.Page;
import com.pojo.AllocateCar;
import com.pojo.Car;
import com.pojo.GoodsState;
import com.pojo.SetOutTime;
import com.service.AllocateCarService;
import com.service.CarService;
import com.service.GoodsStateService;
import com.service.SetOutTimeService;
import com.sun.org.apache.xalan.internal.xsltc.util.IntegerArray;

/**
 * 车辆控制层
 * 
 * @author huijunjie
 * 
 */
public class CarAction {
	Logger log = Logger.getLogger(CarAction.class);
	/** 车辆service */
	private CarService carService;
	/** 货物状态对象 */
	private GoodsState goodsstate;
	/** 车辆调配service */
	private AllocateCarService allocateService;
	/** 发车时间service */
	private SetOutTimeService timeService;
	/** 货物状态service */
	private GoodsStateService goodsService;
	/** 车辆调配 */
	private AllocateCar allocateCar;
	/** 发车时间 */
	private SetOutTime time;
	/** 车辆对象 */
	private Car car = new Car();
	/** 车牌号码 */
	private String carId;
	/** 车辆list集合 */
	private List<Car> carList;
	/** 总页数 */
	private int totalPage;
	/** 总记录数 */
	private int totalRecord;
	/** 当前页 */
	private int curpage = 1;
	private int id;
	private String ids;
	/** 响应信息 */
	private String msg = "";

	public GoodsStateService getGoodsService() {
		return goodsService;
	}

	public void setGoodsService(GoodsStateService goodsService) {
		this.goodsService = goodsService;
	}

	public GoodsState getGoodsstate() {
		return goodsstate;
	}

	public void setGoodsstate(GoodsState goodsstate) {
		this.goodsstate = goodsstate;
	}

	public AllocateCar getAllocateCar() {
		return allocateCar;
	}

	public void setAllocateCar(AllocateCar allocateCar) {
		this.allocateCar = allocateCar;
	}

	public SetOutTime getTime() {
		return time;
	}

	public void setTime(SetOutTime time) {
		this.time = time;
	}

	public AllocateCarService getAllocateService() {
		return allocateService;
	}

	public void setAllocateService(AllocateCarService allocateService) {
		this.allocateService = allocateService;
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

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCurpage() {
		return curpage;
	}

	public void setCurpage(int curpage) {
		this.curpage = curpage;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public List<Car> getCarList() {
		return carList;
	}

	public void setCarList(List<Car> carList) {
		this.carList = carList;
	}

	public String getCarId() {
		return carId;
	}

	public void setCarId(String carId) {
		this.carId = carId;
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}

	public CarService getCarService() {
		return carService;
	}

	public void setCarService(CarService carService) {
		this.carService = carService;
	}

	/**
	 * 插入车辆
	 * 
	 * @return success
	 */
	public String insertCar() {
		carService.insertCar(car);
		return "success";
	}

	/**
	 * 验证车牌号码是否存在
	 * 
	 * @return suc
	 */
	public String validateCarId() {
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
		if (carId != null && !carId.equals("")) {
			// 判断车辆是否存在
			Car c = carService.selectById(carId);
			if (c != null) {
				// 车辆存在
				out.write("false");
			} else {
				// 车辆不存在
				out.write("true");
			}
			out.flush();
			out.close();
		}
		return "suc";
	}

	/**
	 * 查询出车辆集合返回给页面
	 * 
	 * @return suc
	 */
	public String showCar() {
		Page page = new Page();
		// 设置分页信息
		page.setCurPage(curpage);
		page.setNumPerPage(5);
		// 车牌号码不为空
		if (car.getCarId() != null && !car.getCarId().equals("")) {
			try {
				// 转码
				car.setCarId(java.net.URLDecoder.decode(car.getCarId(), "utf-8"));
				log.debug("carId:" + car.getCarId());
			} catch (UnsupportedEncodingException e) {
				log.error(e);
			}
		}
		// 车辆状态不为空
		if (car.getState() != null && !car.getState().equals("")) {
			try {
				// 转码
				car.setState(java.net.URLDecoder.decode(car.getState(), "utf-8"));
				log.debug("carState:" + car.getState());
			} catch (UnsupportedEncodingException e) {
				log.error(e);
			}
		}
		// 根据条件查询并分页显示
		carList = carService.selectByCond(car, page);
		totalRecord = carService.getTotalRecord(car);
		totalPage = carService.getTotalPage(car);
		return "suc";
	}

	/**
	 * 根据id查询
	 * 
	 * @return suc
	 */
	public String selectById() {
		car = carService.selectByCarId(id);
		return "suc";
	}

	/**
	 * 修改车辆
	 * 
	 * @return suc
	 */
	public String updateCar() {
		carService.updateCar(car);
		return "suc";
	}

	/**
	 * 删除车辆
	 * 
	 * @return suc
	 */
	public String deleteCar() {
		carService.deleteCar(id);
		return "suc";
	}

	/**
	 * 群删
	 * 
	 * @return suc 群删成功 fail 群删失败
	 */
	public String deleteCarByIds() {
		// 根据","分割，返回字符串数组
		String[] idStrArr = ids.split(",");
		Integer[] idArr = new Integer[idStrArr.length];
		// string类型的id数组转换成int类型数组
		for (int i = 0; i < idStrArr.length; i++) {
			idArr[i] = Integer.parseInt(idStrArr[i]);
		}
		boolean flag = carService.deleteCarByIds(idArr);
		log.debug("flag:" + flag);
		// 群删成功
		if (flag)
			return "suc";
		// 群删失败返回fail信息
		msg = "fail";
		return "fail";
	}

	/**
	 * 显示详情
	 * 
	 * @return suc
	 */
	public String selectMore() {
		// 查询车辆
		car = carService.selectByCarId(id);
		// 查询车辆调配信息
		allocateCar = allocateService.selectByCarId(id);
		// 查询货物状态信息
		goodsstate = goodsService.getByOid(allocateCar.getOrderid());
		// 查询发车时间
		time = timeService.selectByCarId(id);
		return "suc";
	}
}
