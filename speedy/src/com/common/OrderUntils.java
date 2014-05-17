package com.common;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.action.OrderAction;
import com.dao.OrderDao;
import com.pojo.GoodsState;
import com.pojo.Order;
/**
 * 
 * @author zhangjiayi
 *
 */
public class OrderUntils
{   
	 private static Log logger=LogFactory.getLog(OrderUntils.class);
	/**
	 * 封装order和订单状态信息
	 * @param orderList 订单列表
	 * @param od 
	 * @return
	 */
	public static ArrayList<HashMap<String, Object>> getOrderANDstate(
			List<Order> orderList, OrderDao od)
	{
		ArrayList<HashMap<String, Object>> orderStateList = new ArrayList<HashMap<String, Object>>();
         
		for (int i = 0; i < orderList.size(); i++)
		{
			Order o = orderList.get(i);
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("order", o);

			GoodsState goodState = od.selectGoodsStateByOrderId(o.getId());
			//判断订单的状态
			if (goodState == null)
			{ 
				map.put("state", "未发货");

			} else if (goodState.getNextposition().length()>0)//在货物状态表中存在
			{
         
				map.put("state", "已发货");

			} else
			{
				
				map.put("state", "已结单");

			}
			orderStateList.add(map);

		}

		return orderStateList;

	}


/**
 * 获取当前时间格式化并封装成java.sql.Date对象
 * @return
 */
	public static Date getNowDate()
	{
		int year = 0;
		int month = 0;
		int day = 0;
		Calendar c = Calendar.getInstance();// 获得系统当前日期
		year = c.get(Calendar.YEAR);
		month = c.get(Calendar.MONTH) + 1;// 系统日期从0开始算起
		day = c.get(Calendar.DAY_OF_MONTH);
		String strToFormat= year+"-"+month+"-"+day;

		String formatPattern = "yyyy-MM-dd";

		SimpleDateFormat sdf = new SimpleDateFormat(formatPattern);

		java.util.Date udate = null;

		try
		{

			udate = sdf.parse(strToFormat); // 这里可能抛出异常

		}

		catch (Exception e)
		{
				logger.error(e.getMessage());//日期类型转换异常
			
		}

		java.sql.Date sdate = new java.sql.Date(udate.getTime());
		return sdate;

	}
}
