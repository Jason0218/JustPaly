package com.jpbc;

import java.io.IOException;
import java.io.PrintWriter;

import org.apache.struts2.ServletActionContext;

public class JPBC {
	 
	public void init() throws IOException {
		
		boolean back;
		try {
			System.out.println("++++++++++++++++++++++++++++++++++++++++");
			SetUp setup=new SetUp();
			setup.setup();
			System.out.println("----------------------------------------------");
			back=true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			back=false;
		}
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.println(back);

	}

}
