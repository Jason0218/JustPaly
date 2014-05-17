<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="s" uri="/struts-tags" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<link href="images/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function moveAllSelectedToAnotherSelectObject() {  
	 var objSelect = document.getElementById("fromObjSelectId");
	 var toObjectSelectId = document.getElementById("toObjectSelectId"); 
     for(var i=0;i<objSelect.options.length;i=i+1) {  
    	 if(objSelect.options[i].selected)  
    		 toObjectSelectId.value = toObjectSelectId.value+objSelect.options[i].value+",";
		  }           
		}	

function checkName()
{
	var route_id = document.getElementById("route_id");
	var checkRouteName = document.getElementById("checkRouteName");
	var inputRouteName = document.getElementById("inputRouteName");
	var index=inputRouteName.selectedIndex;
	var url = "RouteAction_checkName?inputRouteName="+inputRouteName.options[index].text+"&t="+new Date().getTime();
	url = encodeURI(encodeURI(url));
    var xmlHttp = getXMLHttp();
	xmlHttp.onreadystatechange = function() {
			if (xmlHttp.readyState == 4) {
				 checkRouteName.value= xmlHttp.responseText;	
				 if(checkRouteName.value=="线路名称错误")
					 {
					     route_id.value = "";
					 }
				 else
					 {
					    route_id.value = xmlHttp.responseText;
					 }
					 
		}
	}
	xmlHttp.open("get",url, true);
	xmlHttp.send(null);
}



/**
**获取XMLHTTPRequest对象
*/
function getXMLHttp() {
	var xmlHttp = null;
	try {
		// Firefox, Opera 8.0+, Safari
		xmlHttp = new XMLHttpRequest();
	} catch (e) {

		// Internet Explorer
		try {
			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {

			try {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				alert("您的浏览器不支持AJAX！");
				xmlHttp = null;
			}
		}
	}
	return xmlHttp;
}

function selectRouteNameChanged()
{
	var selectRouteName  = document.getElementById("selectRouteName");
	var index=selectRouteName.selectedIndex;
	var inputRouteName = document.getElementById("inputRouteName");
	inputRouteName.value = selectRouteName.options[index].text;
}

function checkRouteNum()
{
	var checkRouteNums = document.getElementById("checkRouteNums");
	var spanCheck = document.getElementById("spanCheck");
	if(checkRouteNums.value.length>6)
	{
		spanCheck.innerHTML = "<font color='red'>输入的线路编号过长</font>";
		checkRouteNums.value = ""; 
	}    
	else if(checkRouteNums.value.length<2)
    {
        spanCheck.innerHTML = "<font color='red'>输入的线路编号过短</font>";
        checkRouteNums.value="";
   	}
	else
		spanCheck.innerHTML = "<font color='blue'>输入正确</font>";
}


function checkForm()
{
	var checkRouteNums = document.getElementById("checkRouteNums");
	var inputRouteName = document.getElementById("inputRouteName"); 
    var routefrom = document.getElementById("routefrom"); 
	var routeto = document.getElementById("routeto"); 
	var toObjectSelectId = document.getElementById("toObjectSelectId");
	if(checkRouteNums.value==""||inputRouteName.value=="--请选择--"||routefrom.value=="--请选择--"||routeto.value=="--请选择--"||toObjectSelectId.value=="")
    {
		alert("请输入完数据！");
		return false;
    }
	else if(inputRouteName.value != routefrom.value + routeto.value)
	{
		alert("输入错误！");
		return false;
	}
	else{
		return true;
	}		 
}
</script>
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
						<td height="31"><div class="titlebt">总线路新增</div></td>
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
									<td class="left_txt">当前位置：总线路新增</td>
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
													class="left_txt3">总线路信息</span><span class="left_txt2">！</span><br>
													<span class="left_txt2">包括</span><span class="left_txt3">线路编号，线路名称，出发城市，目的地城市，途径城市等</span><span
													class="left_txt2"></span><span class="left_txt3"></span><span
													class="left_txt2"> </span></td>
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
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;总线路新增设置</td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td>
										<form name="form1" 
											action="TotalRouteAction_insert" method="post" onsubmit="return checkForm();">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												
												<tr>
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">线路总编号：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30" bgcolor="#f2f2f2">
													<input name="totalRoute.routenum" id="checkRouteNums" type="text"  size="30" onblur="checkRouteNum()"
														/><span id="spanCheck">请输入线路编号</span></td>		
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt">该线路的编号</td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="carIdSpan"></span></td>
												<tr>
												<tr>
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">总线路名称：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30" bgcolor="#f2f2f2">
													<select id="inputRouteName" name="totalRoute.route.routename" onchange="checkName()">
														     <option>----请选择----</option>
														     <s:iterator value="list" var="route" > 
														      <option value="<s:property value="#route.routename"/>"><s:property value="#route.routename"/></option> 
														        </s:iterator>         
														</select>
														<span id="yanzhengname"></span>
														</td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt">该线路从城市到城市</td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="checkRouteName"></span></td>
												<tr style="display:none">
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2" 
														class="left_txt2">线路外键id：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30" bgcolor="#f2f2f2">
													<input name="totalRoute.route_id"  type="text"  size="30"  id="route_id"
														/></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt">线路表的主键</td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="carIdSpan"></span></td>
												<tr>
													<td height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">出发地：</td>
													<td bgcolor="#f2f2f2">&nbsp;</td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt"><select
														name="totalRoute.startnode" id="routefrom">
															<option>--请选择--</option>
															<option value="上海">上海</option>
															<option value="武汉">武汉</option>
															<option value="合肥">合肥</option>
															<option value="南京">南京</option>
															<option value="北京">北京</option>
															<option value="广州">广州</option>
															<option value="深圳">深圳</option>
															<option value="南通">南通</option>
															<option value="扬州">扬州</option>
															
													</select></td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt">目的地城市所在地</td>
												</tr>
											
												
												<tr>
													<td height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">目的地：</td>
													<td bgcolor="#f2f2f2">&nbsp;</td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt"><select
														name="totalRoute.endpoint"  id="routeto">
															<option>--请选择--</option>
															<option value="上海">上海</option>
															<option value="武汉">武汉</option>
															<option value="合肥">合肥</option>
															<option value="南京">南京</option>
															<option value="北京">北京</option>
															<option value="广州">广州</option>
															<option value="深圳">深圳</option>
															<option value="南通">南通</option>
															<option value="扬州">扬州</option>
															
													</select></td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt">目的地城市所在地</td>
												</tr>
													<tr>
													<td height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">途径地：</td>
													<td bgcolor="#f2f2f2">&nbsp;</td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt"><select
														 id="fromObjSelectId" multiple="multiple">
															<option value="上海">上海</option>
															<option value="武汉">武汉</option>
															<option value="合肥">合肥</option>
															<option value="南京">南京</option>
															<option value="北京">北京</option>
															<option value="广州">广州</option>
															<option value="深圳">深圳</option>	
													</select>
													<input type="button" value="添加" id="" onclick="moveAllSelectedToAnotherSelectObject()">
													<input  name="totalRoute.acrossnoade" id="toObjectSelectId" type="text">
													</td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt">需要经过的城市</td>
												</tr>
												<tr>
													<td height="30" align="right" class="left_txt2"></td>
													<td>&nbsp;</td>
													<td height="30"><input type="submit" value="提交"  id="submit" onclick="s()"/> <input
														type="reset" value="重置" /></td>
													<td height="30" class="left_txt">&nbsp;</td>
												</tr>
												<tr>
													<td height="90" colspan="4" class="left_txt2"><table
															width="100%" height="99" border="0" cellpadding="0"
															cellspacing="0">
														</table></td>
												</tr>
												<tr>
													<td height="90" colspan="4" class="left_txt"><table
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