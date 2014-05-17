package demo;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import org.apache.struts2.ServletActionContext;

import com.pojo.User;

import cpabe.Common;
import cpabe.Cpabe;

public class CpabeAction {
	User user;
	Cpabe cp = new Cpabe();
	final static boolean DEBUG = true;
	
	 String policy;
	//�ļ���·��
	static String pubfile = "file_dir/pub_key";//��Կ�洢·��
	static String mskfile = "file_dir/master_key";//����Կ�洢·��
	static String prvfile = "file_dir/prv_key";//˽Կ�洢·��

	static String inputfile = "file_dir/input.pdf";//������Ϣ�Ĵ洢·��
	static String encfile = "file_dir/input.pdf.cpabe";//���Ĵ洢·��
	static String decfile = "file_dir/input.pdf.new";//���Ĵ洢·��

	 String attr_str="role:BOSS role:superadmin role:shengadmin role:nodeadmin role:caradmin "
			+ "addr:beijing addr:shanghai addr:guangzhou addr:nanjing addr:shenzhen "
			+ " sex:nan sex:nv";

//	 String student_policy_and = ""+user.getUsername()+" "+user.getAddress()+" "+user.getSex()+" 3of3";
//	 String student_policy_or = ""+user.getUsername()+" "+user.getAddress()+" "+user.getSex()+" 1of3";
	


		public void setup()throws IOException{
			boolean back=false;
		println("//start to setup");
		try {
			cp.setup(pubfile, mskfile);
			back=true;
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			back=false;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		println("//end to setup");
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.println(back);
		}
		public void enc() {
		println("//start to enc");
		
		try {
			//����������Ķ���������˵��ļ���
			Common.spitFile(inputfile, user.getTel().getBytes());
			//�ж����뻹�ǻ�����
			if(!user.getAddress().equals("0")&&!user.getUsername().equals("0")&&!user.getSex().equals("0")){
				policy="student_policy_and";
			}else{
				policy="student_policy_or";}
			cp.enc(pubfile, policy, inputfile, encfile);
			String success="��Ϣ���ܳɹ�";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		println("//end to enc");
		}
		public void keygen()throws Exception{
		println("//start to keygen");
		try {
			cp.keygen(pubfile, prvfile, mskfile, attr_str);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sk=new String(Common.suckFile(prvfile));
		PrintWriter out = ServletActionContext.getResponse().getWriter();
		out.println(sk);
		println("//end to keygen");
		}
		public String dec()throws Exception{
		println("//start to dec");
		String msg=null;
		String good="��ϲ�����ɹ����ʼ�����Ϣ!";
		try {
			cp.dec(pubfile, prvfile, encfile, decfile);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		msg=new String(Common.suckFile(decfile));
		println("//end to dec");
		return "success";
		}
//		//��ȡ����
//	public void getSk()throws Exception{
//		String ct=null;
//		try {
//		 ct=new String(Common.suckFile(encfile));
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		PrintWriter out = ServletActionContext.getResponse().getWriter();
//		out.println(ct);
//	}
	//��ӡ���ķ�װ
	private static void println(Object o) {
		if (DEBUG)
			System.out.println(o);
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
