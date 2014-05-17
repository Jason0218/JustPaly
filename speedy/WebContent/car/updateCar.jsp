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
<title>车辆修改</title>

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
						<td height="31"><div class="titlebt">车辆修改</div></td>
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
									<td class="left_txt">当前位置：车辆修改</td>
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
												<td width="90%" valign="top"><span class="left_txt2">在这里，您可以根据实际情况，修改公司的</span><span
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
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;车辆修改设置</td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td>
										<form name="form1" method="POST" id="myForm"
											action="<%=path%>/car/updateCar.action">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr><td><input type="hidden" name="car.id" value="<s:property value='%{car.id}'/>"/></td></tr>
												<tr>
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">车牌号码：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30" bgcolor="#f2f2f2"><input
														name="car.carId" type="text" id="carId" size="30"
														value="<s:property value='%{car.carId}'/>" readonly="readonly" style="background: #f2f2f2"/></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="msg">修改车辆的车牌号码</span></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"></td>
												</tr>
												<tr>
													<td height="30" align="right" class="left_txt2">司机：</td>
													<td>&nbsp;</td>
													<td height="30"><input type="text"
														name="car.carDriver" size="30" value="<s:property value='%{car.carDriver}'/>"/></td>
													<td height="30" class="left_txt">司机名称</td>
												</tr>
												<tr>
													<td height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">运载力：</td>
													<td bgcolor="#f2f2f2">&nbsp;</td>
													<td height="30" bgcolor="#f2f2f2"><input type="text"
														name="car.deadweight" size="30" id="deadweight" value="<s:property value='%{car.deadweight}'/>"/></td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt">车辆所能承受的重量</td>
												</tr>
												<tr>
													<td height="30" align="right" class="left_txt2">运载体积：
													</td>
													<td>&nbsp;</td>
													<td height="30"><input type="text" name="car.volume"
														size="30" id="volume" value="<s:property value='%{car.volume}'/>"/></td>
													<td height="30" class="left_txt">车辆所能运载的最大体积</td>
												</tr>
												<tr>
													<td height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">车辆状态：</td>
													<td bgcolor="#f2f2f2">&nbsp;</td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt"><select
														name="car.state">
															<c:if test="${car.state=='空闲' }">
															<option value="空闲" selected="selected">空闲</option>
															<option value="出行">出行</option>
															</c:if>
															<c:if test="${car.state=='出行' }">
															<option value="空闲">空闲</option>
															<option value="出行" selected="selected">出行</option>
															</c:if>
													</select></td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt">车辆当前状态</td>
												</tr>
												<tr>
													<td height="30" align="right" class="left_txt2"></td>
													<td>&nbsp;</td>
													<td height="30"><input type="submit" value="提交"/> <input
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