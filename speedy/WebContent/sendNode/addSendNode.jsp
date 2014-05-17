<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>增加配送点</title>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #F8F9FA;
}
-->
</style>

<script type="text/javascript">
//验证用户名的标志
var flagUsername=false;

//站点名字
var flagNodename=false;

//上行站点
var flagForwordnode=false;

//下行站点
var flagNextnode=false;

//验证价格标志
var flagPrice=false;

//验证员工数目标志
var flagEmpCount=false;

function ajaxFunction() {
	var XMLHttp = null;
	try {
		// Firefox, Opera 8.0+, Safari
		XMLHttp = new XMLHttpRequest();
	} catch (e) {

		// Internet Explorer
		try {
			XMLHttp = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {

			try {
				XMLHttp = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				alert("您的浏览器不支持Ajax");
				return false;
			}
		}
	}
	return XMLHttp;
}

//发送请求函数
function sendRequest(url){

	xmlHttp = ajaxFunction();//调用创建请求对象的函数
	//alert(xmlHttp);
	xmlHttp.open("GET",url,true);
	xmlHttp.onreadystatechange = processResponse;//指定响应函数
	xmlHttp.send(null);
}
function sendRequest1(url){

	xmlHttp = ajaxFunction();//调用创建请求对象的函数
	//alert(xmlHttp);
	xmlHttp.open("GET",url,true);
	xmlHttp.onreadystatechange = fResponse;//指定响应函数
	xmlHttp.send(null);
}
function sendRequest2(url){

	xmlHttp = ajaxFunction();//调用创建请求对象的函数
	//alert(xmlHttp);
	xmlHttp.open("GET",url,true);
	xmlHttp.onreadystatechange = sResponse;//指定响应函数
	xmlHttp.send(null);
}
function sendRequest3(url){

	xmlHttp = ajaxFunction();//调用创建请求对象的函数
	//alert(xmlHttp);
	xmlHttp.open("GET",url,true);
	xmlHttp.onreadystatechange = tResponse;//指定响应函数
	xmlHttp.send(null);
}

//处理返回信息的函数 
function processResponse(){
	if(xmlHttp.readyState == 4){
		show();
	}
}
function fResponse(){
	if(xmlHttp.readyState == 4){
		show1();
	}
}
function sResponse(){
	if(xmlHttp.readyState == 4){
		show2();
	}
}
function tResponse(){
	if(xmlHttp.readyState == 4){
		show3();
	}
}

function show(){

	var msg1 = document.getElementById("msg1");

	var result = xmlHttp.responseText;
	
	var usernamestr = document.getElementById("username").value;
		if(usernamestr != ""){
		if(result == "usernamefalse"){
			msg1.innerHTML = "<font style='color:red;'>该用户不存在</font>";
			flagUsername=false;
		//document.getElementById("carId").value = "";
		}
		if(result=="usernametrue"){
			msg1.innerHTML = "<img src='image/start.gif'></img>";
			flagUsername=true;
			}
		}else{
			msg1.innerHTML="<font style='color:red;'>请输入用户名</font>";
			flagUsername=false;
		}
}
function show1(){
	var msg2 = document.getElementById("msg2");
	var result = xmlHttp.responseText;

	var nodenamestr1 = document.getElementById("nodename1").value;
		if(nodenamestr1!= ""){
		if(result == "nodenamefalse"){
			msg2.innerHTML = "<font style='color:red;'>该站点已经存在</font>";
			flagNodename=false;
		//document.getElementById("carId").value = "";
		}
		if(result=="nodenametrue"){
			msg2.innerHTML = "<img src='image/start.gif'></img>";
			flagNodename=true;
			}
		}else{
			msg2.innerHTML="<font style='color:red;'>请输入站点名</font>";
			flagNodename=false;
		}
}
function show2(){
	var msg3 = document.getElementById("msg3");	
	var result = xmlHttp.responseText;
	

	var nodenamestr2 = document.getElementById("nodename2").value;
		if( nodenamestr2 != ""){
		if(result == "nodenametrue"){
			msg3.innerHTML = "<font style='color:red;'>该站点不存在</font>";
			flagForwordnode=false;
		//document.getElementById("carId").value = "";
		}
		if(result=="nodenamefalse"){
			msg3.innerHTML = "<img src='image/start.gif'></img>";
			flagForwordnode=true;
			}
		}else{
			msg3.innerHTML="<font style='color:green;'>注意站点名为空</font>";
			flagForwordnode=true;
			
		}
}
function show3(){
	var msg4 = document.getElementById("msg4");
	var result = xmlHttp.responseText;

	var nodenamestr3 = document.getElementById("nodename3").value;
		if(nodenamestr3 != ""){
		if(result == "nodenametrue"){
			msg4.innerHTML = "<font style='color:red;'>该站点不存在</font>";
			flagNextnode=false;
		//document.getElementById("carId").value = "";
		}
		if(result=="nodenamefalse"){
			msg4.innerHTML = "<img src='image/start.gif'></img>";
			flagNextnode=true;
			}
		}else{
			msg4.innerHTML="<font style='color:green;'>注意站点名为空</font>";
			flagNextnode=true;
		
		}
}

function validateUserName() {

	username = document.getElementById("username").value;
	var url = "sendNode_validateUserName?username="+username+"&t="+new Date().getTime();
	url = encodeURI(encodeURI(url));
	sendRequest(url);
}
function validateNodename1() {
	nodename=document.getElementById("nodename1").value;
	var url = "sendNode_validateNodename?nodename="+nodename+"&t="+new Date().getTime();
	url = encodeURI(encodeURI(url));
	sendRequest1(url);
}
function validateNodename2() {

	nodename=document.getElementById("nodename2").value;
	
	var url = "sendNode_validateNodename?nodename="+nodename+"&t="+new Date().getTime();
	url = encodeURI(encodeURI(url));
	sendRequest2(url);
}
function validateNodename3() {
	nodename=document.getElementById("nodename3").value;
	var url = "sendNode_validateNodename?nodename="+nodename+"&t="+new Date().getTime();
	url = encodeURI(encodeURI(url));
	sendRequest3(url);
}
/*
function sub(){
	var str = /^\d+(\.\d+)?$/;
	var deadweight = document.getElementById("deadweight").value;
	var volume = document.getElementById("volume").value;
	//alert(str.test(deadweight));
	if(!str.test(deadweight)){
		alert("<"+deadweight+">运载力输入有误,请查核！");
		return false;
	}else if(!str.test(volume)){
		alert("<"+volume+">运载体积输入有误,请查核！");
		return false ;
	}else{
		document.getElementById("myForm").submit();
	}
}
*/

function validatePrice(){
	var price=document.getElementById("innerPrice").value;
	var str=/^\d+(\.\d+)?$/;
	var msg4=document.getElementById("msgPrice");
	if(!str.test(price)){
		msg4.innerHTML = "<font style='color:red;'>输入的数字格式不符合规范</font>";
		document.getElementById("innerPrice").value="";
		flagPrice=false;
	}else{
		msg4.innerHTML = "ok";
		flagPrice=true;
	}
}

function validateEmpcount(){
	var empcount=document.getElementById("empcount").value;
	var str=/^\d+$/;
	var msg5=document.getElementById("msgEmpcount");
	if(!str.test(empcount)){
		msg5.innerHTML = "<font style='color:red;'>请输入整数字</font>";
		document.getElementById("empcount").value="";
		flagEmpCount=false;
	}else{
		msg5.innerHTML = "ok";
		flagEmpCount=true;
	}
	
}

function sub(){
	if(flagUsername==true&&flagNodename==true&&flagForwordnode==true&&flagNextnode==true&&flagPrice==true&&flagEmpCount==true){
		document.getElementById("myForm").submit();
		}else{
			alert("请完善信息");
		}
}
</script>
<link href="images/skin.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="17" height="29" valign="top"
				background="images/mail_leftbg.gif"><img
				src="images/left-top-right.gif" width="17" height="29" /></td>
			<td width="935" height="29" valign="top"
				background="images/content-bg.gif"><table width="100%"
					height="31" border="0" cellpadding="0" cellspacing="0"
					class="left_topbg" id="table2">
					<tr>
						<td height="31"><div class="titlebt">车辆新增</div></td>
					</tr>
				</table></td>
			<td width="16" valign="top" background="images/mail_rightbg.gif"><img
				src="images/nav-right-bg.gif" width="16" height="29" /></td>
		</tr>
		<tr>
			<td height="71" valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
			<td valign="top" bgcolor="#F7F8F9"><table width="100%"
					height="138" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="13" valign="top">&nbsp;</td>
					</tr>
					<tr>
						<td valign="top"><table width="98%" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr>
									<td class="left_txt">配送点新增</td>
								</tr>
								<tr>
									<td height="20"><table width="100%" height="1" border="0"
											cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
											<tr>
												<td></td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td><table width="100%" height="55" border="0"
											cellpadding="0" cellspacing="0">
											<tr>
												<td width="10%" height="55" valign="middle"><img
													src="images/title.gif" width="54" height="55"></td>
												<td width="90%" valign="top"><span class="left_txt2">在这里，您可以根据实际情况，新增公司的</span><span
													class="left_txt3">配送点</span><span class="left_txt2">！</span><br>
													<span class="left_txt2">包括</span><span class="left_txt3">配送点名字，负责人名字</span><span
													class="left_txt2">等以及</span><span class="left_txt3">站点类型</span><span
													class="left_txt2">。 </span></td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td><table width="100%" height="31" border="0"
											cellpadding="0" cellspacing="0" class="nowtable">
											<tr>
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;配送点新增设置</td>
											</tr>
										</table></td>
								</tr>
								
								
								<tr>
									<td>
										<form name="form1" method="POST" id="myForm"
											action="<%=path%>/sendNode_insertSendNode">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
						<!--  /////////////////////////////////////////////////////////////////////////-->
												<tr>
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">负责人名字：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30" bgcolor="#f2f2f2">
														<input name="sendNode.username" title="请输入负责人名" type="text" id="username" size="30" onblur="validateUserName()" />
													</td>
						
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="msg1">新增的负责人名字</span></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"></td>
												</tr>
	
												<tr>
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">站点名字：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30" bgcolor="#f2f2f2">
														<input name="sendNode.nodename" title="请输入站点名字" type="text" id="nodename1" size="30" onblur="validateNodename1()" />
													</td>
													
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="msg2">新增的站点名字</span></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"></td>
												</tr>
												
												
												<tr>
													<td height="30" align="right" class="left_txt2">内部价格</td>
													<td>&nbsp;</td>
													<td height="30"><input type="text"
														name="sendNode.innerprice" id="innerPrice" size="30" onblur="validatePrice()" /></td>
													<td height="30" class="left_txt"><span id="msgPrice">新增的内部价格</span></td>
												</tr>
												
												<tr>
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">上行站点：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30" bgcolor="#f2f2f2">
														<input name="sendNode.forwordnode" title="请输入站点名字" type="text" id="nodename2" size="30" onblur="validateNodename2()" />
													</td>
													
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="msg3">新增的站点名字</span></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"></td>
												</tr>
												<tr>
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">下行站点：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30" bgcolor="#f2f2f2">
														<input name="sendNode.nextnode" title="请输入站点名字" type="text" id="nodename3" size="30" onblur="validateNodename3()" />
													</td>
													
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="msg4">新增的站点名字</span></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"></td>
												</tr>
													<tr>
													<td height="30" align="right" class="left_txt2">站点人数</td>
													<td>&nbsp;</td>
													<td height="30"><input type="text"
														name="sendNode.empcount" id="empcount" size="30" onblur="validateEmpcount()"/></td>
													<td height="30" class="left_txt"><span id="msgEmpcount">该站点的人数</span></td>
												</tr>
	
												<tr>
													<td height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">站点类型：</td>
													<td bgcolor="#f2f2f2">&nbsp;</td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt"><select
														name="sendNode.nodetype">
														<!--  	<option>--请选择--</option>-->
															<option value="主线">主线</option>
															<option value="支线">支线</option>
													</select></td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt">配送点站点类型</td>
												</tr>
												<tr>
													<td height="30" align="right" class="left_txt2"></td>
													<td>&nbsp;</td>
													<td height="30"><input type="button" value="提交" onclick="sub()"/> <input
														type="reset" value="重置" /></td>
													<td height="30" class="left_txt">&nbsp;</td>
												</tr>
												<tr>
													<td height="115" colspan="4" class="left_txt2"><table
															width="100%" height="99" border="0" cellpadding="0"
															cellspacing="0">
														</table></td>
												</tr>
												<tr>
													<td height="115" colspan="4" class="left_txt"><table
															width="100%" height="90" border="0" cellpadding="0"
															cellspacing="0">

														</table></td>
												</tr>
											</table>
										</form>
								</tr>
							</table></td>
					</tr>
				</table></td>
			<td background="images/mail_rightbg.gif">&nbsp;</td>
		</tr>
		<tr>
			<td valign="middle" background="images/mail_leftbg.gif"><img
				src="images/buttom_left2.gif" width="17" height="17" /></td>
			<td height="17" valign="top" background="images/buttom_bgs.gif"><img
				src="images/buttom_bgs.gif" width="17" height="17" /></td>
			<td background="images/mail_rightbg.gif"><img
				src="images/buttom_right2.gif" width="16" height="17" /></td>
		</tr>
	</table>

</body>

</html>