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
<title>交接单表生成管理</title>

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



function sendUrl(curpage,orderId,goodsAmount,nname,destn){
	var url = "jiaojie/showAssQResult.action?curpage="+curpage+"&assQResult.orderId="+orderId+"&assQResult.goodsAmount="+goodsAmount+"&assQResult.nname="+nname+"&assQResult.destn="+destn;
	//alert(url);
	url = encodeURI(encodeURI(url));
	location.href=url;
	return;
}

function check1(){
	var che = document.getElementsByName("checkbox2");
	var checkbox = document.getElementById("checkbox");
	var checkAll = document.getElementById("checkAll");
	for(var i=0;i<che.length;i++){
		che[i].checked=checkbox.checked;
	}
	checkAll.checked=checkbox.checked;
}

function check2(){
	var che = document.getElementsByName("checkbox2");
	var checkbox = document.getElementById("checkbox");
	var checkAll = document.getElementById("checkAll");
	for(var i=0;i<che.length;i++){
		che[i].checked=checkAll.checked;
	}
	checkbox.checked=checkAll.checked;
}
function createChecked(curpage){
	var checks = document.getElementsByName("checkbox2");
	var oid;
	var ndname;
	var dsn;
	var ids = new Array();
	for ( var i = 0; i < checks.length; i++) {
		if(checks[i].checked==true){
			//ids.push(checks[i].value);
			oid=document.getElementsByName("oid")[i].value;
			dsn=document.getElementsByName("dsn")[i].value;
			dsn=encodeURI(encodeURI(dsn));
			ndname=document.getElementsByName("ndname")[i].value;
			ndname=encodeURI(encodeURI(ndname));
			location.href="shengcheng.action?oid="+oid+"&dsn="+dsn+"&ndname="+ndname;
		}
	}
	
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
						<td height="31"><div class="titlebt">交接单信息</div></td>
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
									<td class="left_txt">当前位置：订单交接</td>
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
												<td width="90%" valign="top"><span class="left_txt2">在这里，您可以让系统生成并管理</span><span
													class="left_txt3">交接单信息</span><span class="left_txt2">！</span><br>
													<span class="left_txt2">包括</span><span class="left_txt3">订单号，货物数量，交接地，目的地</span><span
													class="left_txt2"></span><span class="left_txt3"></span><span
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
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;交接单信息</td>
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
										<fieldset style="margin-bottom: 23px; border-color: #F7F8F9;">
											<legend style="font-size: 14px">交接单生成</legend>
											<form action="<%=path%>/jiaojie/selectByCond2.action"
												method="post">
												<table align="center">
													<tr align="center">
														<td class="select_name">收寄地：</td>
														<td><input type="text" name="sjd"
															value="${sjd}" /></td>
														<td class="select_name">交接地</td>
														<td><input type="text" name="assQResult.nname"
															value="${assQResult.nname}" /></td>
													</tr>
													<tr align="center">
														<td class="select_name">目的地</td>
														<td><input type="text" name="assQResult.destn"
															value="${assQResult.destn}" /></td>
														
																
															
														
														<td><input type="submit" value="查询" /></td>
													</tr>
												</table>
											</form>
										</fieldset>

								


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
																						class="STYLE3">你当前的位置</span>：[交接单信息]</td>
																				</tr>
																			</table></td>
																		<td width="54%"><table border="0" align="right"
																				cellpadding="0" cellspacing="0">
																				<tr>
																					<td width="60"><table width="87%" border="0"
																							cellpadding="0" cellspacing="0">
																							<tr>
																								<td class="STYLE1"><div align="center">
																										<input type="checkbox" name="checkbox62" id="checkAll"
																											value="checkbox" onclick="check2();"/>
																									</div></td>
																								<td class="STYLE1"><div align="center">全选</div></td>
																							</tr>
																						</table></td>
																					<td width="60"><table width="90%" border="0"
																							cellpadding="0" cellspacing="0">
																							<tr>
																							
																								
																							</tr>
																						</table></td>
																					<td width="60"><table width="90%" border="0"
																							cellpadding="0" cellspacing="0">
																						
																						</table></td>
																					<td width="52"><table width="88%" border="0"
																							cellpadding="0" cellspacing="0">
																							<tr>
																								<td class="STYLE1"><div align="center">
																										<img src="<%=path%>/car/image/33.gif"
																											width="14" height="14" />
																									</div></td>
																								<td class="STYLE1"><div align="center"><a href="javascript:void(0);" onclick="javascript:createChecked();">生成</a></div></td>
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
																		<td width="3%" height="22"
																			background="<%=path%>/car/image/bg.gif"
																			bgcolor="#FFFFFF"><div align="center">
																				<input type="checkbox" name="checkbox" id="checkbox"
																					value="checkbox"  onclick="check1();"/>
																			</div></td>
																		<td width="20%" height="22"
																			background="<%=path%>/car/image/bg.gif"
																			bgcolor="#FFFFFF"><div align="center">
																				<span class="STYLE1">订单号</span>
																			</div></td>
																		<td width="12%" height="22"
																			background="<%=path%>/car/image/bg.gif"
																			bgcolor="#FFFFFF"><div align="center">
																				<span class="STYLE1">货物数量</span>
																			</div></td>
																		<td width="14%" height="22"
																			background="<%=path%>/car/image/bg.gif"
																			bgcolor="#FFFFFF"><div align="center">
																				<span class="STYLE1">交接地</span>
																			</div></td>
																		<td width="18%"
																			background="<%=path%>/car/image/bg.gif"
																			bgcolor="#FFFFFF"><div align="center">
																				<span class="STYLE1">目的地</span>
																			</div></td>
																	
																		
																	</tr>



																	<s:iterator value="assQResultList">

																		<tr>
																			<td height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<input type="checkbox" name="checkbox2"
																						value="<s:property value='id' />" />
																				</div></td>
																				<td height="20" bgcolor="#FFFFFF"><div
																					align="center" class="STYLE1">
																					<div align="center">
																						<s:property value="orderId" /><input name="oid" value="<s:property value='orderId' />" style="display: none;">
																					</div>
																				</div></td>
																			<td height="20" bgcolor="#FFFFFF"><div
																					align="center" class="STYLE1">
																					<div align="center">
																						<s:property value="goodsAmount" />
																					</div>
																				</div></td>
																			<td height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<span class="STYLE1"><s:property
																							value="assQResult.nname" />
																							<input name="ndname" value="<s:property value='assQResult.nname' />" style="display: none;">
																							</span>
																				</div></td>
																			<td height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<span class="STYLE1"><s:property
																							value="destn" />
																							<input name="dsn" value="<s:property value='destn' />" style="display: none;">
																							</span>
																				</div></td>
																			
																		
																		</tr>


																	</s:iterator>





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
															<td><table width="100%" border="0" cellspacing="0"
																	cellpadding="0">
																	<tr>
																		<td class="STYLE4">&nbsp;&nbsp;共有 <s:property
																				value="%{totalRecord}" />条记录
																		</td>
													<%-- 					<td><table border="0" align="right"
																				cellpadding="0" cellspacing="0">
																				<tr>
																					 <td width="40">
																					<a href="javascript:void(0);" onclick="sendUrl(1,'${assQResult.orderId}','${assQResult.goodsAmount}','${assQResult.nname}','${assQResult.destn}')">
																					<a
																						href="<%=path%>/jiaojie/showAssQResult.action?curpage=1&assQResult.orderId=<s:property value='%{assQResult.orderId}'/>&assQResult.goodsAmount=<s:property value='%{assQResult.goodsAmount}'/>&assQResult.nname=<s:property value='%{assQResult.nname}'/>&assQResult.destn=<s:property value='%{assQResult.destn}'/>"><img
																							src="<%=path%>/car/image/first.gif" width="37"
																							height="15" border="0" /></a></td>


																					<c:if test="${curpage==1}">
																						<td width="45">
																						<a href="javascript:void(0);" onclick="sendUrl(1,'${car.carId}','${car.deadweight}','${car.volume}','${car.state}')">
																						<a
																							href="<%=path%>/jiaojie/showAssQResult.action?curpage=1&assQResult.orderId=<s:property value='%{assQResult.orderId}'/>&assQResult.goodsAmount=<s:property value='%{assQResult.goodsAmount}'/>&assQResult.nname=<s:property value='%{assQResult.nname}'/>&assQResult.destn=<s:property value='%{assQResult.destn}'/>">
																							<img
																								src="<%=path%>/car/image/back.gif" width="43"
																								height="15" border="0" /></a></td>
																					</c:if>
																					<c:if test="${curpage!=1}">
																						<td width="45">
																						<a href="javascript:void(0);" onclick="sendUrl('${curpage-1}','${assQResult.orderId}','${assQResult.goodsAmount}','${assQResult.nname}','${assQResult.destn}')">
																						<a
																							href="<%=path%>/jiaojie/showAssQResult.action?curpage=1&assQResult.orderId=<s:property value='%{assQResult.orderId}'/>&assQResult.goodsAmount=<s:property value='%{assQResult.goodsAmount}'/>&assQResult.nname=<s:property value='%{assQResult.nname}'/>&assQResult.destn=<s:property value='%{assQResult.destn}'/>"><img
																								src="<%=path%>/car/image/back.gif" width="43"
																								height="15" border="0" /></a></td>
																					</c:if>

																					<c:if test="${curpage eq totalPage}">
																						<td width="45">
																						<a href="javascript:void(0);" onclick="sendUrl('${totalPage}','${assQResult.orderId}','${assQResult.goodsAmount}','${assQResult.nname}','${assQResult.destn}')">
																						<a
																							href="<%=path%>/jiaojie/showAssQResult.action?curpage=1&assQResult.orderId=<s:property value='%{assQResult.orderId}'/>&assQResult.goodsAmount=<s:property value='%{assQResult.goodsAmount}'/>&assQResult.nname=<s:property value='%{assQResult.nname}'/>&assQResult.destn=<s:property value='%{assQResult.destn}'/>"><img
																								src="<%=path%>/car/image/next.gif" width="43"
																								height="15" border="0" /></a></td>
																					</c:if>
																					<c:if test="${curpage ne totalPage}">
																						<td width="45">
																						<a href="javascript:void(0);" onclick="sendUrl('${curpage+1}','${assQResult.orderId}','${assQResult.goodsAmount}','${assQResult.nname}','${assQResult.destn}')">
																						<a
																							href="<%=path%>/jiaojie/showAssQResult.action?curpage=1&assQResult.orderId=<s:property value='%{assQResult.orderId}'/>&assQResult.goodsAmount=<s:property value='%{assQResult.goodsAmount}'/>&assQResult.nname=<s:property value='%{assQResult.nname}'/>&assQResult.destn=<s:property value='%{assQResult.destn}'/>"><img
																								src="<%=path%>/car/image/next.gif" width="43"
																								height="15" border="0" /></a></td>
																					</c:if>
 --%>

																				<%-- 	<td width="40">
																					<a href="javascript:void(0);" onclick="sendUrl('${totalPage}','${assQResult.orderId}','${assQResult.goodsAmount}','${assQResult.nname}','${assQResult.destn}')">
																					<a
																						href="<%=path%>/jiaojie/showAssQResult.action?curpage=1&assQResult.orderId=<s:property value='%{assQResult.orderId}'/>&assQResult.goodsAmount=<s:property value='%{assQResult.goodsAmount}'/>&assQResult.nname=<s:property value='%{assQResult.nname}'/>&assQResult.destn=<s:property value='%{assQResult.destn}'/>"><img
																							src="<%=path%>/car/image/last.gif" width="37"
																							height="15" border="0" /></a></td>
																					<td width="100"><div align="center">
																							<span class="STYLE1">转到第 <input
																								name="textfield" id="gotoPage" type="text"
																								size="4"
																								style="height: 12px; width: 20px; border: 1px solid #999999;" />
																								页
																							</span>
																						</div></td>
																					<td width="40"><a
																						href="javascript:gotoPage(${totalPage});"><img
																							src="<%=path%>/car/image/go.gif" width="37"
																							height="15" border="0" /></a></td> --%>
																				</tr>
																			</table></td>
																	</tr>
																</table></td>
															<td width="16"><img
																src="<%=path%>/car/image/tab_20.gif" width="16"
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