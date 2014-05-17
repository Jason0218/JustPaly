<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.STYLE1 {
	font-size: 12px
}

.STYLE3 {
	font-size: 12px;
	font-weight: bold;
}

.STYLE4 {
	color: #03515d;
	font-size: 12px;
}

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #F8F9FA;
}
</style>
<script type="text/javascript">

function deleteMany(){
	var ech=document.getElementsByName("ech");
	var selboxes=new Array();
	for ( var i = 0; i < ech.length; i++) {
		if(ech[i].checked==true){
		selboxes.push(ech[i].value);
		}
	}
	
	if(selboxes==""){
		alert("请选择要删除的角色！");
	}else{
	location.href="deleteManyPms.action?pids="+selboxes;
	}
}



function c1(){
	var a=document.getElementById("all");
	var a2=document.getElementById("all2");
	var ech=document.getElementsByName("ech");
	a2.checked=a.checked;
	for ( var i = 0; i < ech.length; i++) {
		ech[i].checked=a.checked;
	}
}

function c2(){
	var a=document.getElementById("all");
	var a2=document.getElementById("all2");
	var ech=document.getElementsByName("ech");
	a.checked=a2.checked;
	for ( var i = 0; i < ech.length; i++) {
		ech[i].checked=a2.checked;
	}
}


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
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
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
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}
</script>
<link href="../admin/images/skin.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="17" height="29" valign="top"
				background="../admin/images/mail_leftbg.gif"><img
				src="../admin/images/left-top-right.gif" width="20" height="29" /></td>
			<td width="935" height="29" valign="top"
				background="../admin/images/content-bg.gif"><table width="100%"
					height="31" border="0" cellpadding="0" cellspacing="0"
					class="left_topbg" id="table2">
					<tr>
						<td height="31"><div class="titlebt">查询权限</div></td>
					</tr>
				</table></td>
			<td width="16" valign="top"
				background="../admin/images/mail_rightbg.gif"><img
				src="../admin/images/nav-right-bg.gif" width="16" height="29" /></td>
		</tr>
		<tr>
			<td height="71" valign="middle"
				background="../admin/images/mail_leftbg.gif">&nbsp;</td>
			<td valign="top" bgcolor="#F7F8F9"><table width="100%"
					height="138" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="13" valign="top">&nbsp;</td>
					</tr>
					<tr>
						<td valign="top"><table width="98%" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr>
									<td class="left_txt">当前位置：查询权限</td>
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
													src="../admin/images/title.gif" width="54" height="55"></td>
												<td width="90%" valign="top"><span class="left_txt2">在这里，您可以查询权限的信息</span><span
													class="left_txt3"></span><span class="left_txt2">！</span><br>
													<span class="left_txt2">包括：</span><span class="left_txt3">权限名</span><span
													class="left_txt2">权限模块，权限路径</span><span
													class="left_txt3"></span><span class="left_txt2">。 </span></td>
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
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;查询信息</td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td><table width="80%" border="0" cellspacing="0"
											cellpadding="0" style="margin: auto;">
											
												<center>
													<c:if test="${msg eq 'fail'}">
													<font style="color: red;">删除失败！请先删除拥有该权限的角色！</font>
													</c:if>		
												</center>
												<form action="" method="post">




													<table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tr>
															<td height="30" background="../quanxian/image/tab_05.gif"><table
																	width="100%" border="0" cellspacing="0" cellpadding="0">
																	<tr>
																		<td width="12" height="30"><img
																			src="../quanxian/image/tab_03.gif" width="12" height="30" /></td>
																		<td><table width="100%" border="0"
																				cellspacing="0" cellpadding="0">
																				<tr>
																					<td width="46%" valign="middle"><table
																							width="100%" border="0" cellspacing="0"
																							cellpadding="0">
																							<tr>
																								<td width="5%"><div align="center">
																										<img src="../quanxian/image/tb.gif" width="16" height="16" />
																									</div></td>
																								<td width="95%" class="STYLE1"><span
																									class="STYLE3">你当前的位置</span>：[角色信息]</td>
																							</tr>
																							
																						</table></td>
																					<td width="54%"><table border="0"
																							align="right" cellpadding="0" cellspacing="0">
																							<tr>
																								<td width="60"><table width="87%"
																										border="0" cellpadding="0" cellspacing="0">
																										<tr>
																											<td class="STYLE1"><div align="center">
																													<input type="checkbox" name="checkbox62"
																														value="checkbox" id="all" onclick="c1()"/>
																												</div></td>
																											<td class="STYLE1"><div align="center">全选</div></td>
																										</tr>
																									</table></td>
																								<td width="60"><table width="90%"
																										border="0" cellpadding="0" cellspacing="0">
																										<tr>
																											<td class="STYLE1"><div align="center">
																													<img src="../quanxian/image/22.gif" width="14"
																														height="14" />
																												</div></td>
																											<td class="STYLE1"><div align="center">新增</div></td>
																										</tr>
																									</table></td>
																								<td width="60"><table width="90%"
																										border="0" cellpadding="0" cellspacing="0">
																										<tr>
																											<td class="STYLE1"><div align="center">
																													<img src="../quanxian/image/33.gif" width="14"
																														height="14" />
																												</div></td>
																											<td class="STYLE1"><div align="center">修改</div></td>
																										</tr>
																									</table></td>
																								<td width="52"><table width="88%"
																										border="0" cellpadding="0" cellspacing="0">
																										<tr>
																											<td class="STYLE1"><div align="center">
																													<img src="../quanxian/image/11.gif" width="14"
																														height="14" />
																												</div></td>
																											<td class="STYLE1"><div align="center"><a href="javaScript:deleteMany();">删除</a></div></td>
																										</tr>
																									</table></td>
																							</tr>
																						</table></td>
																				</tr>
																			</table></td>
																		<td width="16"><img src="../quanxian/image/tab_07.gif"
																			width="16" height="30" /></td>
																	</tr>
																</table></td>
														</tr>
														<tr>
															<td><table width="100%" border="0" cellspacing="0"
																	cellpadding="0">
																	<tr>
																		<td width="8" background="../quanxian/image/tab_12.gif">&nbsp;</td>
																		<td><table width="100%" border="0"
																				cellpadding="0" cellspacing="1" bgcolor="b5d6e6"
																				onmouseover="changeto()" onmouseout="changeback()">
																				<tr>
																					<td width="3%" height="22"
																						background="../quanxian/image/bg.gif" bgcolor="#FFFFFF"><div
																							align="center">
																							<input type="checkbox" name="checkbox"
																								value="checkbox" id="all2" onclick="c2()"/>
																						</div></td>
																					<td width="3%" height="22"
																						background="../quanxian/image/bg.gif" bgcolor="#FFFFFF"><div
																							align="center">
																							<span class="STYLE1">权限编号</span>
																						</div></td>
																					<td width="12%" height="22"
																						background="../quanxian/image/bg.gif" bgcolor="#FFFFFF"><div
																							align="center">
																							<span class="STYLE1">权限名称</span>
																						</div></td>
																						<td width="12%" height="22"
																						background="../quanxian/image/bg.gif" bgcolor="#FFFFFF"><div
																							align="center">
																							<span class="STYLE1">权限路径</span>
																						</div></td>
																					<td width="15%" height="22"
																						background="../quanxian/image/bg.gif" bgcolor="#FFFFFF"
																						class="STYLE1"><div align="center">基本操作</div></td>
																				</tr>
																				<s:iterator value="list">
																					<tr>

																						<td height="20" bgcolor="#FFFFFF"><div
																								align="center">
																								<input type="checkbox" name="ech"
																									value="<s:property value='pid'/>" />
																							</div></td>
																						<td height="20" bgcolor="#FFFFFF"><div
																								align="center" class="STYLE1">
																								<div align="center">
																									<s:property value="pid" />
																								</div>
																							</div></td>
																						<td height="20" bgcolor="#FFFFFF"><div
																								align="center" class="STYLE1">
																								<div align="center">
																									<s:property value="pname" />
																								</div>
																							</div></td>
																							<td height="20" bgcolor="#FFFFFF"><div
																								align="center" class="STYLE1">
																								<div align="center">
																									<s:property value="purl" />
																								</div>
																							</div></td>
																							
																							
																						<td height="20" bgcolor="#FFFFFF"><div
																								align="center">
																								<span class="STYLE4"><a href="showPmsDetails.action?pid=<s:property value='pid'/>"><img
																									src="../quanxian/image/edt.gif" width="16" height="16" border="0"/>编辑</a>&nbsp;
																									&nbsp;<a href="deleteByPid.action?pid=<s:property value='pid'/>"><img src="../quanxian/image/del.gif" width="16"
																									height="16" border="0"/>删除</a></span>
																							</div></td>
																					</tr>
																				</s:iterator>
																			</table></td>
																		<td width="8" background="../quanxian/image/tab_15.gif">&nbsp;</td>
																	</tr>
																</table></td>
														</tr>
														<tr>
															<td height="35" background="../quanxian/image/tab_19.gif"><table
																	width="100%" border="0" cellspacing="0" cellpadding="0">
																	<tr>
																		<td width="12" height="35"><img
																			src="../quanxian/image/tab_18.gif" width="12" height="35" /></td>
																		<td><table width="100%" border="0"
																				cellspacing="0" cellpadding="0">
																				<tr>
																					<%-- <td class="STYLE4">&nbsp;&nbsp;共有 120 条记录，当前第
																			1/10 页</td>
																		<td><table border="0" align="right"
																				cellpadding="0" cellspacing="0">
																				<tr>
																					<td width="40"><img src="../quanxian/image/first.gif"
																						width="37" height="15" /></td>
																					<td width="45"><img src="../quanxian/image/back.gif"
																						width="43" height="15" /></td>
																					<td width="45"><img src="../quanxian/image/next.gif"
																						width="43" height="15" /></td>
																					<td width="40"><img src="../quanxian/image/last.gif"
																						width="37" height="15" /></td>
																					<td width="100"><div align="center">
																							<span class="STYLE1">转到第 <input
																								name="textfield" type="text" size="4"
																								style="height: 12px; width: 20px; border: 1px solid #999999;" />
																								页
																							</span>
																						</div></td>
																					<td width="40"><img src="../quanxian/image/go.gif"
																						width="37" height="15" /></td>
																				</tr>
																			</table></td> --%>
																				</tr>
																			</table></td>
																		<td width="16"><img src="../quanxian/image/tab_20.gif"
																			width="16" height="35" /></td>
																	</tr>
																</table>
														<tr>
															<td height="30" colspan="3">&nbsp;</td>
														</tr>
													</table></td>
								</tr>
							</table></td>
						<td background="../admin/images/mail_rightbg.gif">&nbsp;</td>
					</tr>

					<tr>
						<!-- <td valign="middle" background="images/mail_leftbg.gif"><img
				src="images/buttom_left2.gif" width="17" height="17" /></td> -->
						<td height="17" valign="top"
							background="../admin/images/buttom_bgs.gif"><img
							src="../admin/images/buttom_bgs.gif" width="17" height="17" /></td>
						<!-- 	<td background="images/mail_rightbg.gif"><img
				src="images/buttom_right2.gif" width="16" height="17" /></td> -->
					</tr>
				</table>
</body>