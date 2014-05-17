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
 * �������Ʋ�
 * 
 * @author huijunjie
 * 
 */
public class CarAction {
	Logger log = Logger.getLogger(CarAction.class);
	/** ����service */
	private CarService carService;
	/** ����״̬���� */
	private GoodsState goodsstate;
	/** ��������service */
	private AllocateCarService allocateService;
	/** ����ʱ��service */
	private SetOutTimeService timeService;
	/** ����״̬service */
	private GoodsStateService goodsService;
	/** �������� */
	private AllocateCar allocateCar;
	/** ����ʱ�� */
	private SetOutTime time;
	/** �������� */
	private Car car = new Car();
	/** ���ƺ��� */
	private String carId;
	/** ����list���� */
	private List<Car> carList;
	/** ��ҳ�� */
	private int totalPage;
	/** �ܼ�¼�� */
	private int totalRecord;
	/** ��ǰҳ */
	private int curpage = 1;
	private int id;
	private String ids;
	/** ��Ӧ��Ϣ */
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
	 * ���복��
	 * 
	 * @return success
	 */
	public String insertCar() {
		carService.insertCar(car);
		return "success";
	}

	/**
	 * ��֤���ƺ����Ƿ����
	 * 
	 * @return suc
	 */
	public String validateCarId() {
		// ��ȡresponse����
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		// ����PrintWriter����
		PrintWriter out = null;
		try {
			// ת��
			carId = java.net.URLDecoder.decode(carId, "utf-8");
			log.debug("carId:" + carId);
			out = response.getWriter();
		} catch (UnsupportedEncodingException e) {
			log.error(e);
		} catch (IOException e) {
			log.error(e);
		}
		if (carId != null && !carId.equals("")) {
			// �жϳ����Ƿ����
			Car c = carService.selectById(carId);
			if (c != null) {
				// ��������
				out.write("false");
			} else {
				// ����������
				out.write("true");
			}
			out.flush();
			out.close();
		}
		return "suc";
	}

	/**
	 * ��ѯ���������Ϸ��ظ�ҳ��
	 * 
	 * @return suc
	 */
	public String showCar() {
		Page page = new Page();
		// ���÷�ҳ��Ϣ
		page.setCurPage(curpage);
		page.setNumPerPage(5);
		// ���ƺ��벻Ϊ��
		if (car.getCarId() != null && !car.getCarId().equals("")) {
			try {
				// ת��
				car.setCarId(java.net.URLDecoder.decode(car.getCarId(), "utf-8"));
				log.debug("carId:" + car.getCarId());
			} catch (UnsupportedEncodingException e) {
				log.error(e);
			}
		}
		// ����״̬��Ϊ��
		if (car.getState() != null && !car.getState().equals("")) {
			try {
				// ת��
				car.setState(java.net.URLDecoder.decode(car.getState(), "utf-8"));
				log.debug("carState:" + car.getState());
			} catch (UnsupportedEncodingException e) {
				log.error(e);
			}
		}
		// ����������ѯ����ҳ��ʾ
		carList = carService.selectByCond(car, page);
		totalRecord = carService.getTotalRecord(car);
		totalPage = carService.getTotalPage(car);
		return "suc";
	}

	/**
	 * ����id��ѯ
	 * 
	 * @return suc
	 */
	public String selectById() {
		car = carService.selectByCarId(id);
		return "suc";
	}

	/**
	 * �޸ĳ���
	 * 
	 * @return suc
	 */
	public String updateCar() {
		carService.updateCar(car);
		return "suc";
	}

	/**
	 * ɾ������
	 * 
	 * @return suc
	 */
	public String deleteCar() {
		carService.deleteCar(id);
		return "suc";
	}

	/**
	 * Ⱥɾ
	 * 
	 * @return suc Ⱥɾ�ɹ� fail Ⱥɾʧ��
	 */
	public String deleteCarByIds() {
		// ����","�ָ�����ַ�������
		String[] idStrArr = ids.split(",");
		Integer[] idArr = new Integer[idStrArr.length];
		// string���͵�id����ת����int��������
		for (int i = 0; i < idStrArr.length; i++) {
			idArr[i] = Integer.parseInt(idStrArr[i]);
		}
		boolean flag = carService.deleteCarByIds(idArr);
		log.debug("flag:" + flag);
		// Ⱥɾ�ɹ�
		if (flag)
			return "suc";
		// Ⱥɾʧ�ܷ���fail��Ϣ
		msg = "fail";
		return "fail";
	}

	/**
	 * ��ʾ����
	 * 
	 * @return suc
	 */
	public String selectMore() {
		// ��ѯ����
		car = carService.selectByCarId(id);
		// ��ѯ����������Ϣ
		allocateCar = allocateService.selectByCarId(id);
		// ��ѯ����״̬��Ϣ
		goodsstate = goodsService.getByOid(allocateCar.getOrderid());
		// ��ѯ����ʱ��
		time = timeService.selectByCarId(id);
		return "suc";
	}
}
