package com.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

/**
 * dom 宸ュ叿绫�@ xiaobc 2014-4-15
 */

public class DomUtil {

	/**
	 * 鎷垮埌鍏徃鍒嗘垚鐨勫� @ xiaobc 2014-4-15
	 * 
	 * @return
	 */
	public static String get(String pre) {
		StringBuilder sb = new StringBuilder();
		SAXReader reader = new SAXReader();
		try {
			Document dom = reader.read(new File(pre+"common/divide.xml"));
			Element root = dom.getRootElement();
			String company = root.element("company").getText();
			String sendnode = root.element("sendnode").getText();
			String recnode = root.element("recnode").getText();
			sb.append(company).append(",").append(sendnode).append(",")
					.append(recnode);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return sb.toString();
	}

	/**
	 * 淇敼鍏徃鍒嗘垚鐨勫� @ xiaobc 2014-4-15
	 * 
	 * @return
	 */
	public static void update(String pre,String com, String send, String rec) {
		SAXReader reader = new SAXReader();
		Document dom = null;
		try {
			dom = reader.read(new File(pre+"common/divide.xml"));
			Element root = dom.getRootElement();
			root.element("company").setText(com);
			root.element("sendnode").setText(send);
			root.element("recnode").setText(rec);
		} catch (DocumentException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		FileWriter fw = null;
		try {
			// 缇庡寲鏍煎紡
			OutputFormat opf = OutputFormat.createPrettyPrint();
			fw = new FileWriter(pre+"common/divide.xml");
			XMLWriter xw = new XMLWriter(fw, opf);
			xw.write(dom);
			xw.close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fw.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	/**
	 * 鍒涘缓鍏徃鍒嗘垚鐨勫� @ xiaobc 2014-4-15
	 * 
	 * @return
	 */
	public static void create(String pre) {
		Document dom = DocumentHelper.createDocument();
		Element root = dom.addElement("divide");
		Element com = root.addElement("company");
		com.addText("60.0");
		root.addElement("sendnode").addText("30.0");
		root.addElement("recnode").addText("10.0");
		try {
			// 缇庡寲鏍煎紡
			OutputFormat opf = OutputFormat.createPrettyPrint();
			XMLWriter xw = new XMLWriter(new FileWriter(new File(pre+"common/divide.xml")), opf);
			xw.write(dom);
			xw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
