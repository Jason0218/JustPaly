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
 * AllocateBean���Ʋ�
 * 
 * @author huijunjie
 * 
 */
public class AllocateBeanAction {
	Logger log = Logger.getLogger(AllocateBeanAction.class);
	/** AllocateBeanҵ��� */
	private AllocateBeanService allocateBeanService;
	/** AllocateBean���� */
	private AllocateBean allocate;
	/** AllocateBean���� */
	private List<AllocateBean> list;
	/** ����service */
	private CarService carService;
	/** �������� */
	private List<Car> carList;
	/** ���ƺ��� */
	private String carId;
	/** ����� */
	private String totalVol;
	/** ������ */
	private String totalWei;
	/** վ������ */
	private String nodenames;
	/** Ŀ�ĵ� */
	private String destns;
	/** ��������service */
	private AllocateCarService alloCarService;
	/** ������Ϣ */
	private String msg;
	/** ����ʱ��service */
	private SetOutTimeService timeService;
	/** ����״̬service */
	private GoodsStateService goodsStateService;
	/** ����id */
	private String orderid;
	/** ���͵�service */
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
	 * ��ʾ���п��г���
	 * 
	 * @return suc
	 */
	public String showAllocate() {
		// ��ѯ����allocateBean����
		list = allocateBeanService.selectAll(allocate);
		Car c = new Car();
		c.setState("����");
		// ��ѯ����״̬�����г���
		carList = carService.selectByState(c);
		log.debug("carList������" + carList.size());
		return "suc";
	}

	/**
	 * ��֤�����Ƿ���ܵ���
	 * 
	 * @return
	 */
	public String validate() {
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
		// ���ƺ��벻Ϊ��
		if (carId != null && !carId.equals("")) {
			Car c = carService.selectById(carId);
			// �жϳ����Ƿ���ص���
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
	 * ��������
	 * 
	 * @return
	 */
	public String allocateCar() {
		try {
			// ת��
			carId = java.net.URLDecoder.decode(carId, "utf-8");
			log.debug("carId:" + carId);
			nodenames = java.net.URLDecoder.decode(nodenames, "utf-8");
			log.debug("nodename:" + nodenames);
			destns = java.net.URLDecoder.decode(destns, "utf-8");
			log.debug("destn:" + destns);
		} catch (UnsupportedEncodingException e) {
			log.error(e);
		}
		// ���ĳ���״̬
		Car car = carService.selectById(carId);
		car.setState("����");
		carService.updateCar(car);
		// ���������������Ϣ
		AllocateCar allocar = new AllocateCar();
		allocar.setCarid(car.getId());
		allocar.setNowposition(nodenames);
		allocar.setDestn(destns);
		allocar.setOrderid(Integer.parseInt(orderid));
		alloCarService.insertAllo(allocar);
		// ����ʱ���������Ϣ
		SetOutTime time = new SetOutTime();
		time.setCarid(car.getId());
		time.setSetouttime(new Date());
		timeService.insertTime(time);
		// ����״̬��¼����Ϣ
		GoodsState gs = new GoodsState();
		gs.setBagnum(orderid);
		gs.setOrderId(Integer.parseInt(orderid));
		gs.setNowposition(nodenames);
		SendNode sendNode = sendNodeService.getOneByNodename(nodenames);
		gs.setNextposition(sendNode.getNextnode());
		goodsStateService.insertState(gs);
		// msg����ҳ�洦��������Ӧ��Ϣ
		msg = "success";
		return "suc";
	}
}
