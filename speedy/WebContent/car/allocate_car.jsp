<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆调度管理</title>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #F8F9FA;
}

.STYLE1 {
	font-size: 12px
}

.STYLE3 {
	font-size: 12px;
	font-weight: bold;
}

.select_name {
	font-style: normal;
}

.STYLE4 {
	color: #03515d;
	font-size: 12px;
}
-->
</style>
<script>
var  highlightcolor='#c1ebff';
//此处clickcolor只能用win系统颜色代码才能成功,如果用#xxxxxx的代码就不行,还没搞清楚为什么:(
var  clickcolor='#51b2f6';
function  changeto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=highlightcolor&&source.id!="nc"&&cs[1].style.backgroundColor!=clickcolor)
for(var i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(var i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

function  clickto(){
source=event.srcElement;
if  (source.tagName=="TR"||source.tagName=="TABLE")
return;
while(source.tagName!="TD")
source=source.parentElement;
source=source.parentElement;
cs  =  source.children;
//alert(cs.length);
if  (cs[1].style.backgroundColor!=clickcolor&&source.id!="nc")
for(var i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(var i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}


function check1(){
	var che = document.getElementsByName("checkbox2");
	var checkbox = document.getElementById("checkbox");
	for(var i=0;i<che.length;i++){
		che[i].checked=checkbox.checked;
	}
}

var totalVol = 0;
var totalWei = 0;
function total(bagnum,volume,weight){
	var che = document.getElementById(bagnum);
	if(che.checked==true){
		var vol = parseFloat(volume);
		var wei = parseFloat(weight);
		totalVol = totalVol + vol;
		totalWei = totalWei + wei;
		document.getElementById("totalVolume").value=totalVol;
		document.getElementById("totalWeight").value=totalWei;
	}
	if(che.checked==false){
		var vol = parseFloat(volume);
		var wei = parseFloat(weight);
		totalVol = totalVol - vol;
		totalWei = totalWei - wei;
		document.getElementById("totalVolume").value=totalVol;
		document.getElementById("totalWeight").value=totalWei;
	}
}







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
	var isnu = document.getElementById("selectedCar").value;
	if(isnu != ""){
		if(result == "false"){
			msg.innerHTML = "<font style='color:red;'>对不起,该车辆承受不起</font>";
			//document.getElementById("carId").value = "";
		}else{
			msg.innerHTML = "<img src='<%=path%>/car/image/start.gif'></img>";
		}
	}else{
		msg.innerHTML = "<font style='color:red;'>请选择装货车辆</font>";
	}
}

function validate() {
	car = document.getElementById("selectedCar").value;
	var url = "<%=path%>/allocate/validate.action?carId="+car+"&totalVol="+totalVol+"&totalWei="+totalWei+"&t="+new Date().getTime();
	url = encodeURI(encodeURI(url));
	sendRequest(url);
}


function sub1(){
	var bagnums = new Array();
	var nodenames = new Array();
	var destns = new Array();
	var carId = document.getElementById("selectedCar").value;
	var checks = document.getElementsByName("checkbox2");
	for ( var i = 0; i < checks.length; i++) {
		if(checks[i].checked==true){
			bagnums.push(checks[i].id);
			nodenames.push(checks[i].alt);
			destns.push(checks[i].accept);
		}
	}
	var url = "<%=path%>/allocate/allocateCar.action?carId="+carId+"&orderid="+bagnums+"&nodenames="+nodenames+"&destns="+destns;
	url = encodeURI(encodeURI(url));
	location.href=url;
}


</script>
<link href="<%=path%>/car/images/skin.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="17" height="29" valign="top"
				background="<%=path%>/car/images/mail_leftbg.gif"><img
				src="<%=path%>/car/images/left-top-right.gif" width="17" height="29" /></td>
			<td width="935" height="29" valign="top"
				background="<%=path%>/car/images/content-bg.gif"><table
					width="100%" height="31" border="0" cellpadding="0" cellspacing="0"
					class="left_topbg" id="table2">
					<tr>
						<td height="31"><div class="titlebt">车辆调度</div></td>
					</tr>
				</table></td>
			<td width="16" valign="top"
				background="<%=path%>/car/images/mail_rightbg.gif"><img
				src="<%=path%>/car/images/nav-right-bg.gif" width="16" height="29" /></td>
		</tr>
		<tr>
			<td height="71" valign="middle"
				background="<%=path%>/car/images/mail_leftbg.gif">&nbsp;</td>
			<td valign="top" bgcolor="#F7F8F9"><table width="100%"
					height="138" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="13" valign="top">&nbsp;</td>
					</tr>
					<tr>
						<td valign="top"><table width="98%" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr>
									<td class="left_txt">当前位置：车辆调度管理</td>
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
													src="<%=path%>/car/images/title.gif" width="54" height="55"></td>
												<td width="90%" valign="top"><span class="left_txt2">在这里，您可以根据实际情况，调度公司的</span><span
													class="left_txt3">车辆</span><span class="left_txt2">！</span><br>
													<span class="left_txt2">包括</span><span class="left_txt3">车牌号，司机，运载力，运载体积</span><span
													class="left_txt2">等以及</span><span class="left_txt3">车辆的选择操作</span><span
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
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;车辆调度</td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td height="5" colspan="4" class="left_txt2"><table
											width="100%" height="10" border="0" cellpadding="0"
											cellspacing="0">
										</table></td>
								</tr>
								<tr>
									<td>
										
						<%-- <fieldset style="margin-bottom: 23px; border-color: #F7F8F9;">
											<legend style="font-size: 14px">查询条件</legend>
											<form action="<%=path%>/allocate/showAllocate.action"
												method="post">
												<table align="center">
													<tr align="center">
														<td class="select_name">发货地</td>
														<td><input type="text" name="allocate.nodename"
															value="<s:property value='%{allocate.nodename}'/>" /></td>
														<td><input type="submit" value="查询" /></td>
													</tr>
												</table>
											</form>
										</fieldset>				 --%>
										
										
										<c:if test="${msg=='success' }">
											<div align="center"><font style="color: green;">操作成功</font></div>
										</c:if>
										
										
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td height="30" background="<%=path%>/car/image/tab_05.gif"><table
														width="100%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td width="12" height="30"><img
																src="<%=path%>/car/image/tab_03.gif" width="12"
																height="30" /></td>
															<td><table width="100%" border="0" cellspacing="0"
																	cellpadding="0">
																	<tr>
																		<td width="46%" valign="middle"><table
																				width="100%" border="0" cellspacing="0"
																				cellpadding="0">
																				<tr>
																					<td width="5%"><div align="center">
																							<img src="<%=path%>/car/image/tb.gif" width="16"
																								height="16" />
																						</div></td>
																					<td width="95%" class="STYLE1"><span
																						class="STYLE3">你当前的位置</span>：[车辆调度]</td>
																				</tr>
																			</table></td>
																		<td width="54%"><table border="0" align="right"
																				cellpadding="0" cellspacing="0">
																				<tr>
																					<td width="60"><table width="87%" border="0"
																							cellpadding="0" cellspacing="0">
																							<tr>
																								<!-- <td class="STYLE1"><div align="center">
																										<input type="checkbox" name="checkbox62" id="checkAll"
																											value="checkbox"/>
																									</div></td> -->
																								<!-- <td class="STYLE1"><div align="center">全选</div></td> -->
																							</tr>
																						</table></td>
																					
																					
																				</tr>
																			</table></td>
																	</tr>
																</table></td>
															<td width="16"><img
																src="<%=path%>/car/image/tab_07.gif" width="16"
																height="30" /></td>
														</tr>
													</table></td>
											</tr>
											<tr>
												<td><table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tr>
															<td width="8" background="<%=path%>/car/image/tab_12.gif">&nbsp;</td>
															<td><table width="100%" border="0" cellpadding="0"
																	cellspacing="1" bgcolor="b5d6e6"
																	onmouseover="changeto()" onmouseout="changeback()">
																	<tr>
																		<td width="5%" height="22"
																			background="<%=path%>/car/image/bg.gif"
																			bgcolor="#FFFFFF"><div align="center">
																				<span class="STYLE1">操作</span>
																			</div></td>
																		<td width="15%" height="22"
																			background="<%=path%>/car/image/bg.gif"
																			bgcolor="#FFFFFF"><div align="center">
																				<span class="STYLE1">订单号</span>
																			</div></td>
																		<td width="15%" height="22"
																			background="<%=path%>/car/image/bg.gif"
																			bgcolor="#FFFFFF"><div align="center">
																				<span class="STYLE1">发货地</span>
																			</div></td>
																		<td width="14%" height="22"
																			background="<%=path%>/car/image/bg.gif"
																			bgcolor="#FFFFFF"><div align="center">
																				<span class="STYLE1">目的地</span>
																			</div></td>
																		<td width="12%"
																			background="<%=path%>/car/image/bg.gif"
																			bgcolor="#FFFFFF"><div align="center">
																				<span class="STYLE1">体积</span>
																			</div></td>
																		<td width="12%" height="22"
																			background="<%=path%>/car/image/bg.gif"
																			bgcolor="#FFFFFF"><div align="center">
																				<span class="STYLE1">重量</span>
																			</div></td>
																		
																	</tr>



																	<s:iterator value="list" status="st">

																		<tr>
																			<td height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<input type="checkbox" name="checkbox2" alt="${nodename}" accept="${destn}" id="${bagnum}" onclick="total('${bagnum}','${volume}','${weight}');"/>
																				</div></td>
																			<td height="20" bgcolor="#FFFFFF"><div
																					align="center" class="STYLE1">
																					<div align="center">
																						<s:property value="bagnum" />
																					</div>
																				</div></td>
																			<td height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<span class="STYLE1"><s:property
																							value="nodename" /></span>
																				</div></td>
																			<td height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<span class="STYLE1"><s:property
																							value="destn" /></span>
																				</div></td>
																			<td bgcolor="#FFFFFF"><div align="center">
																					<span class="STYLE1"><s:property
																							value="volume" /></span>
																				</div></td>
																			<td height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<span class="STYLE1"><s:property
																							value="weight" /></span>
																				</div></td>
																			
																		</tr>


																	</s:iterator>
																	
																
															
																<tr>
																<td colspan="1" height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<span class="STYLE1"></span>
																				</div></td>
																<td colspan="1" height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<span class="STYLE1">重量总计：<input type="text" id="totalWeight" readonly="readonly"/></span>
																				</div></td>
																	
																	<td colspan="1" height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<span class="STYLE1">体积总计：<input type="text" id="totalVolume" readonly="readonly"/></span>
																				</div></td>			
																				
																	<td colspan="1" height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<span class="STYLE1">选择装货车辆：
																								<select id="selectedCar" onchange="validate();">
																									<option>--请选择--</option>
																									<s:iterator value="carList">
																										<option value="<s:property value='carId'/>"><s:property value="carId"/></option>
																									</s:iterator>
																								</select>
																					</span>
																				</div></td>	
																<td colspan="1" height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<span id="msg">
																					</span>
																				</div></td>	
																<td colspan="1" height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<span>
																					<input type="button" value="提交" onclick="sub1();"/>
																					</span>
																				</div></td>	
																				</tr>
														
														
														
														
																</table></td>
															<td width="8" background="<%=path%>/car/image/tab_15.gif">&nbsp;</td>
														</tr>
													</table></td>
											</tr>
											<tr>
												<td height="35" background="<%=path%>/car/image/tab_19.gif"><table
														width="100%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td width="12" height="35"><img
																src="<%=path%>/car/image/tab_18.gif" width="12"
																height="35" /></td>
																	</tr>
													</table></td>
											</tr>
											<tr>
												<td height="150" colspan="4" class="left_txt2"><table
														width="100%" height="99" border="0" cellpadding="0"
														cellspacing="0">
													</table></td>
											</tr>
											<tr>
												<td height="150" colspan="4" class="left_txt"><table
														width="100%" height="90" border="0" cellpadding="0"
														cellspacing="0">

													</table></td>
											</tr>
										</table>
								</tr>
							</table></td>
					</tr>
				</table></td>
			<td background="<%=path%>/car/images/mail_rightbg.gif">&nbsp;</td>
		</tr>
		<tr>
			<td valign="middle" background="<%=path%>/car/images/mail_leftbg.gif"><img
				src="<%=path%>/car/images/buttom_left2.gif" width="17" height="17" /></td>
			<td height="17" valign="top"
				background="<%=path%>/car/images/buttom_bgs.gif"><img
				src="<%=path%>/car/images/buttom_bgs.gif" width="17" height="17" /></td>
			<td background="<%=path%>/car/images/mail_rightbg.gif"><img
				src="<%=path%>/car/images/buttom_right2.gif" width="16" height="17" /></td>
		</tr>
	</table>

</body>

</html>