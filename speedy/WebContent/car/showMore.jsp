<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆详情</title>

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
<link href="<%=path %>/car/images/skin.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="17" height="29" valign="top"
				background="<%=path %>/car/images/mail_leftbg.gif"><img
				src="<%=path %>/car/images/left-top-right.gif" width="17" height="29" /></td>
			<td width="935" height="29" valign="top"
				background="<%=path %>/car/images/content-bg.gif"><table width="100%"
					height="31" border="0" cellpadding="0" cellspacing="0"
					class="left_topbg" id="table2">
					<tr>
						<td height="31"><div class="titlebt">车辆详情</div></td>
					</tr>
				</table></td>
			<td width="16" valign="top" background="<%=path %>/car/images/mail_rightbg.gif"><img
				src="<%=path %>/car/images/nav-right-bg.gif" width="16" height="29" /></td>
		</tr>
		<tr>
			<td height="71" valign="middle" background="<%=path %>/car/images/mail_leftbg.gif">&nbsp;</td>
			<td valign="top" bgcolor="#F7F8F9"><table width="100%"
					height="138" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="13" valign="top">&nbsp;</td>
					</tr>
					<tr>
						<td valign="top"><table width="98%" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr>
									<td class="left_txt">当前位置：车辆详情</td>
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
													src="<%=path %>/car/images/title.gif" width="54" height="55"></td>
												<td width="90%" valign="top"><span class="left_txt2">在这里，您可以根据实际情况，查看公司的</span><span
													class="left_txt3">车辆详情</span><span class="left_txt2">！</span><br>
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
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;车辆详情</td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td>
										
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">车牌号码：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30" bgcolor="#f2f2f2"><input
														name="" type="text" id="carId" size="30"
														value="<s:property value='%{car.carId}'/>" readonly="readonly" style="background: #f2f2f2"/></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="msg">车辆的车牌号码</span></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"></td>
												</tr>
												<tr>
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">订单号：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30" bgcolor="#f2f2f2"><input
														name="" type="text" id="carId" size="30"
														value="<s:property value='%{allocateCar.orderid}'/>" readonly="readonly" style="background: #f2f2f2"/></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="msg">车辆调配运送的订单号</span></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"></td>
												</tr>
												<tr>
													<td height="30" align="right" class="left_txt2">车辆所在地：</td>
													<td>&nbsp;</td>
													<td height="30"><input type="text"
														name="" readonly="readonly" size="30" style="background: #f2f2f2" value="<s:property value='%{allocateCar.nowposition}'/>"/></td>
													<td height="30" class="left_txt">车辆所在地</td>
												</tr>
												<tr>
													<td height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">车辆调配目的地：</td>
													<td bgcolor="#f2f2f2">&nbsp;</td>
													<td height="30" bgcolor="#f2f2f2"><input type="text"
														name="" readonly="readonly" size="30" id="deadweight" style="background: #f2f2f2" value="<s:property value='%{allocateCar.destn}'/>"/></td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt">车辆调配目的地</td>
												</tr>
												<tr>
													<td height="30" align="right" class="left_txt2">车辆当前地点：</td>
													<td>&nbsp;</td>
													<td height="30"><input type="text"
														name="" readonly="readonly" size="30" style="background: #f2f2f2" value="<s:property value='%{goodsstate.nowposition}'/>"/></td>
													<td height="30" class="left_txt">车辆当前地点</td>
												</tr>
												<tr>
													<td height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">车辆下一目的地：</td>
													<td bgcolor="#f2f2f2">&nbsp;</td>
													<td height="30" bgcolor="#f2f2f2"><input type="text"
														name="" readonly="readonly" size="30" id="deadweight" style="background: #f2f2f2" value="<s:property value='%{goodsstate.nextposition}'/>"/></td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt">车辆下一目的地</td>
												</tr>
												<tr>
													<td height="30" align="right" class="left_txt2">车辆发车时间：
													</td>
													<td>&nbsp;</td>
													<td height="30"><input type="text" name=""
														size="30" readonly="readonly" id="volume" style="background: #f2f2f2" value="<s:property value='%{time.setouttime}'/>"/></td>
													<td height="30" class="left_txt">车辆发车时间</td>
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
								
								</tr>
							</table></td>
					</tr>
				</table></td>
			<td background="<%=path %>/car/images/mail_rightbg.gif">&nbsp;</td>
		</tr>
		<tr>
			<td valign="middle" background="<%=path %>/car/images/mail_leftbg.gif"><img
				src="<%=path %>/car/images/buttom_left2.gif" width="17" height="17" /></td>
			<td height="17" valign="top" background="<%=path %>/car/images/buttom_bgs.gif"><img
				src="<%=path %>/car/images/buttom_bgs.gif" width="17" height="17" /></td>
			<td background="<%=path %>/car/images/mail_rightbg.gif"><img
				src="<%=path %>/car/images/buttom_right2.gif" width="16" height="17" /></td>
		</tr>
	</table>

</body>

</html>