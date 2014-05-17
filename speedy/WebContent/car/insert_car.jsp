<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆新增</title>

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
<!-- <script type="text/javascript" src="js/validate.js"></script> -->
<script type="text/javascript">
var car;
var xmlHttp ;
var msg ;
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

//处理返回信息的函数
function processResponse(){
	if(xmlHttp.readyState == 4){
		show();
	}
}

function show(){
	msg = document.getElementById("msg");
	var result = xmlHttp.responseText;
	var isnu = document.getElementById("carId").value;
	if(isnu != ""){
		if(result == "false"){
			msg.innerHTML = "<font style='color:red;'>该车辆已存在</font>";
			//document.getElementById("carId").value = "";
		}else{
			msg.innerHTML = "<img src='image/start.gif'></img>";
		}
	}else{
		msg.innerHTML = "<font style='color:red;'>对不起,车牌号码不能为空</font>";
	}
}

function validateCarId() {
	car = document.getElementById("carId").value;
	var url = "validateCarId.action?carId="+car+"&t="+new Date().getTime();
	url = encodeURI(encodeURI(url));
	sendRequest(url);
}

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
									<td class="left_txt">当前位置：车辆新增</td>
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
													class="left_txt3">车辆信息</span><span class="left_txt2">！</span><br>
													<span class="left_txt2">包括</span><span class="left_txt3">车牌号，司机，运载力，运载体积</span><span
													class="left_txt2">等以及</span><span class="left_txt3">车辆状态设置</span><span
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
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;车辆新增设置</td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td>
										<form name="form1" method="POST" id="myForm"
											action="<%=path%>/car/insertCar">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">车牌号码：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30" bgcolor="#f2f2f2"><input
														name="car.carId" type="text" id="carId" size="30"
														onblur="validateCarId()" /></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="msg">新增车辆的车牌号码</span></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"></td>
												</tr>
												<tr>
													<td height="30" align="right" class="left_txt2">司机：</td>
													<td>&nbsp;</td>
													<td height="30"><input type="text"
														name="car.carDriver" size="30" /></td>
													<td height="30" class="left_txt">司机名称</td>
												</tr>
												<tr>
													<td height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">运载力：</td>
													<td bgcolor="#f2f2f2">&nbsp;</td>
													<td height="30" bgcolor="#f2f2f2"><input type="text"
														name="car.deadweight" size="30" id="deadweight"/></td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt">车辆所能承受的重量</td>
												</tr>
												<tr>
													<td height="30" align="right" class="left_txt2">运载体积：
													</td>
													<td>&nbsp;</td>
													<td height="30"><input type="text" name="car.volume"
														size="30" id="volume"/></td>
													<td height="30" class="left_txt">车辆所能运载的最大体积</td>
												</tr>
												<tr>
													<td height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">车辆状态：</td>
													<td bgcolor="#f2f2f2">&nbsp;</td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt"><select
														name="car.state">
															<option>--请选择--</option>
															<option value="空闲">空闲</option>
															<option value="出行">出行</option>
													</select></td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt">车辆当前状态</td>
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