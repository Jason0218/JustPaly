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
<title>用户信息管理</title>

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
//分页
function gotoPage(totalPage){
	var page = document.getElementById("gotoPage").value;
	var str = /^\d+$/;
	if(!str.test(page)){
		alert("输入不合法,请输入页码");
		document.getElementById("gotoPage").value="";
	}else{
		if(page>totalPage){
			location.href="user/showUser.action?curpage="+totalPage;
			return ;
		}else{
			location.href="user/showUser.action?curpage="+page;
			return ;
		}
	}
}
//组合查询条件
function sendUrl(curpage,username,sex,age,address){
	var url = "user/showUser.action?curpage="+curpage+"&user.username="+username+"&user.sex="+sex+"&user.age="+age+"&user.address="+address;
	//alert(url);
	url = encodeURI(encodeURI(url));
	location.href=url;
	return;
}

//复选框
function check1(){
	var che = document.getElementsByName("checkbox2");
	var checkbox = document.getElementById("checkbox");
	var checkAll = document.getElementById("checkAll");
	for(var i=0;i<che.length;i++){
		che[i].checked=checkbox.checked;
	}
	checkAll.checked=checkbox.checked;
}
//复选框
function check2(){
	var che = document.getElementsByName("checkbox2");
	var checkbox = document.getElementById("checkbox");
	var checkAll = document.getElementById("checkAll");
	for(var i=0;i<che.length;i++){
		che[i].checked=checkAll.checked;
	}
	checkbox.checked=checkAll.checked;
}
//修改状态
function confirmDelete(id,curpage,state){	
	var url="<%=path%>/user/updateState.action?user.id="+id+"&curpage="+curpage+"&user.state="+state;
	location.href=url;	
}
//删除
function delectChecked(curpage){
	var checks = document.getElementsByName("checkbox2");
	var ids = new Array();
	for ( var i = 0; i < checks.length; i++) {
		if(checks[i].checked==true){
			ids.push(checks[i].value);
		}
	}
	if(ids==""){
		alert("请选择需要删除的用户");
	}else{
		if(confirm("确认删除吗?")){
			var url="<%=path%>/user/deleteByIds.action?ids="+ids+"&curpage="+curpage;
			location.href=url;
		}
	}
}
</script>
<link href="<%=path%>/user/images/skin.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="17" height="29" valign="top"
				background="<%=path%>/user/images/mail_leftbg.gif"><img
				src="<%=path%>/user/images/left-top-right.gif" width="17"
				height="29" /></td>
			<td width="935" height="29" valign="top"
				background="<%=path%>/user/images/content-bg.gif"><table
					width="100%" height="31" border="0" cellpadding="0" cellspacing="0"
					class="left_topbg" id="table2">
					<tr>
						<td height="31"><div class="titlebt">用户信息</div></td>
					</tr>
				</table></td>
			<td width="16" valign="top"
				background="<%=path%>/user/images/mail_rightbg.gif"><img
				src="<%=path%>/user/images/nav-right-bg.gif" width="16" height="29" /></td>
		</tr>
		<tr>
			<td height="71" valign="middle"
				background="<%=path%>/user/images/mail_leftbg.gif">&nbsp;</td>
			<td valign="top" bgcolor="#F7F8F9"><table width="100%"
					height="138" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="13" valign="top">&nbsp;</td>
					</tr>
					<tr>
						<td valign="top"><table width="98%" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr>
									<td class="left_txt">当前位置：用户信息管理</td>
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
													src="<%=path%>/user/images/title.gif" width="54"
													height="55"></td>
												<td width="90%" valign="top"><span class="left_txt2">在这里，您可以根据实际情况，查询</span><span
													class="left_txt3">用户信息</span><span class="left_txt2">！</span><br>
													<span class="left_txt2">包括</span><span class="left_txt3">用户名，性别</span><span
													class="left_txt2">，年龄，电话，地址，邮箱</span><span
													class="left_txt3">以及用户的修改操作</span><span class="left_txt2">。
												</span></td>
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
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;用户信息</td>
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
										<fieldset style="margin-bottom: 15px; border-color: #f2f2f2;">
											<legend style="font-size: 14px">用户查询</legend>
											<form action="<%=path%>/user/selectUserByCondition.action"
												method="post">
												<table align="center">
													<tr align="center">
														<td class="select_name">用户名：</td>
														<td><input type="text" name="user.username"
															value="<s:property value='%{user.username}'/>" /></td>
														<td>&nbsp;</td>
														<td class="select_name">性别：</td>
														<td><select name="user.sex">
																<c:if test="${user.sex=='男' }">
																	<option value="">--请选择--</option>
																	<option value="男" selected="selected">男</option>
																	<option value="女">女</option>
																</c:if>
																<c:if test="${user.sex=='女' }">
																	<option value="">--请选择--</option>
																	<option value="男">男</option>
																	<option value="女" selected="selected">女</option>
																</c:if>
																<c:if test="${user.sex=='' or user.sex==null }">
																	<option value="">--请选择--</option>
																	<option value="男">男</option>
																	<option value="女">女</option>
																</c:if>
														</select></td>

														<td><input type="submit" value="查询" /></td>

													</tr>


													<tr align="center">
														<td class="select_name">年龄：</td>
														<td><input type="text" name="user.age"
															value="<s:property value='%{user.age}'/>" /></td>

														<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
														<td class="select_name">地址：</td>
														<td><input type="text" name="user.address"
															value="<s:property value='%{user.address}'/>" /></td>


													</tr>
												</table>
											</form>
										</fieldset>




										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td height="30" background="<%=path%>/user/image/tab_05.gif"><table
														width="100%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td width="12" height="30"><img
																src="<%=path%>/user/image/tab_03.gif" width="12"
																height="30" /></td>
															<td><table width="100%" border="0" cellspacing="0"
																	cellpadding="0">
																	<tr>
																		<td width="46%" valign="middle"><table
																				width="100%" border="0" cellspacing="0"
																				cellpadding="0">
																				<tr>
																					<td width="5%"><div align="center">
																							<img src="<%=path%>/user/image/tb.gif" width="16"
																								height="16" />
																						</div></td>
																					<td width="95%" class="STYLE1"><span
																						class="STYLE3">你当前的位置</span>：[用户信息]</td>
																				</tr>
																			</table></td>
																		<td width="54%"><table border="0" align="right"
																				cellpadding="0" cellspacing="0">
																				<tr>
																					<td width="60"><table width="87%" border="0"
																							cellpadding="0" cellspacing="0">
																							<tr>
																								<td class="STYLE1"><div align="center">
																										<input type="checkbox" name="checkbox62"
																											id="checkAll" value="checkbox"
																											onclick="check2();" />
																									</div></td>
																								<td class="STYLE1"><div align="center">全选</div></td>
																							</tr>
																						</table></td>
																					<td width="60"><table width="90%" border="0"
																							cellpadding="0" cellspacing="0">
																							<%-- 	<tr>
																								<td class="STYLE1"><div align="center">
																										<img src="<%=path%>/user/image/33.gif"
																											width="14" height="14" />
																									</div></td>
																								<td class="STYLE1"><div align="center">修改</div></td>
																							</tr> --%>
																						</table></td>
																					<td width="60"><table width="90%" border="0"
																							cellpadding="0" cellspacing="0">
																							<tr>
																								<td class="STYLE1"><div align="center">
																										<img src="<%=path%>/user/image/22.gif"
																											width="14" height="14" />
																									</div></td>
																								<td class="STYLE1"><div align="center">
																										<a href="<%=path%>/user/adduser.jsp">新增</a>
																									</div></td>
																							</tr>
																						</table></td>

																					<td width="52"><table width="88%" border="0"
																							cellpadding="0" cellspacing="0">
																							<tr>
																								<td class="STYLE1"><div align="center">
																										<img src="<%=path%>/user/image/11.gif"
																											width="14" height="14" />
																									</div></td>
																								<td class="STYLE1"><div align="center">
																										<a href="javascript:void(0);"
																											onclick="javascript:delectChecked('${curpage}');">删除</a>
																									</div></td>
																							</tr>
																						</table></td>
																				</tr>
																			</table></td>
																	</tr>
																</table></td>
															<td width="16"><img
																src="<%=path%>/user/image/tab_07.gif" width="16"
																height="30" /></td>
														</tr>
													</table></td>
											</tr>
											<tr>
												<td><table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tr>
															<td width="8"
																background="<%=path%>/user/image/tab_12.gif">&nbsp;</td>
															<td><table width="100%" border="0" cellpadding="0"
																	cellspacing="1" bgcolor="b5d6e6"
																	onmouseover="changeto()" onmouseout="changeback()">
																	<tr>
																		<td width="3%" height="22"
																			background="<%=path%>/user/image/bg.gif"
																			bgcolor="#FFFFFF"><div align="center">
																				<input type="checkbox" name="checkbox" id="checkbox"
																					value="checkbox" onclick="check1();" />
																			</div></td>
																		<td width="12%" height="22"
																			background="<%=path%>/user/image/bg.gif"
																			bgcolor="#FFFFFF"><div align="center">
																				<span class="STYLE1">用户编号</span>
																			</div></td>
																		<td width="12%" height="22"
																			background="<%=path%>/user/image/bg.gif"
																			bgcolor="#FFFFFF"><div align="center">
																				<span class="STYLE1">姓名</span>
																			</div></td>
																		<td width="12%" height="22"
																			background="<%=path%>/user/image/bg.gif"
																			bgcolor="#FFFFFF"><div align="center">
																				<span class="STYLE1">性别</span>
																			</div></td>
																		<td width="12%"
																			background="<%=path%>/user/image/bg.gif"
																			bgcolor="#FFFFFF"><div align="center">
																				<span class="STYLE1">年龄</span>
																			</div></td>
																		<td width="12%" height="22"
																			background="<%=path%>/user/image/bg.gif"
																			bgcolor="#FFFFFF"><div align="center">
																				<span class="STYLE1">电话</span>
																			</div></td>
																		<td width="12%" height="22"
																			background="<%=path%>/user/image/bg.gif"
																			bgcolor="#FFFFFF"><div align="center">
																				<span class="STYLE1">地址</span>
																			</div></td>
																		<td width="12%" height="22"
																			background="<%=path%>/user/image/bg.gif"
																			bgcolor="#FFFFFF"><div align="center">
																				<span class="STYLE1">电子邮件</span>
																			</div></td>
																		<td width="12%" height="22"
																			background="<%=path%>/user/image/bg.gif"
																			bgcolor="#FFFFFF" class="STYLE1"><div
																				align="center">基本操作</div></td>
																	</tr>



																	<s:iterator value="userList">

																		<tr>
																			<td height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<input type="checkbox" name="checkbox2"
																						value="<s:property value='id' />" />
																				</div></td>
																			<td height="20" bgcolor="#FFFFFF"><div
																					align="center" class="STYLE1">
																					<div align="center">
																						<s:property value="id" />
																					</div>
																				</div></td>
																			<td height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<span class="STYLE1"><s:property
																							value="username" /></span>
																				</div></td>
																			<td height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<span class="STYLE1"><s:property value="sex" /></span>
																				</div></td>
																			<td bgcolor="#FFFFFF"><div align="center">
																					<span class="STYLE1"><s:property value="age" /></span>
																				</div></td>
																			<td height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<span class="STYLE1"><s:property value="tel" /></span>
																				</div></td>
																			<td height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<span class="STYLE1"><s:property
																							value="address" /></span>
																				</div></td>
																			<td height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<span class="STYLE1"><s:property
																							value="email" /></span>
																				</div></td>
																			<td height="20" bgcolor="#FFFFFF"><div
																					align="center">
																					<span class="STYLE4"><img
																						src="<%=path%>/user/image/edt.gif" width="16"
																						height="16" /><a
																						href="<%=path%>/user/selectByUsername.action?id=<s:property value='id'/>">编辑&nbsp;
																							&nbsp; </a> <%-- <img
																						src="<%=path%>/user/image/del.gif" width="16"
																						height="16" /> --%> <c:if test="${state==0 }">
																							<a href="javascript:void(0);"
																								onclick="javascript:confirmDelete('${id}','${curpage}',1);">禁用</a>
																						</c:if> <c:if test="${state==1 }">
																							<a href="javascript:void(0);"
																								onclick="javascript:confirmDelete('${id}','${curpage}',0);">启用</a>
																						</c:if> </span> </span>
																				</div></td>
																		</tr>


																	</s:iterator>





																</table></td>
															<td width="8"
																background="<%=path%>/user/image/tab_15.gif">&nbsp;</td>
														</tr>
													</table></td>
											</tr>
											<tr>
												<td height="35" background="<%=path%>/user/image/tab_19.gif"><table
														width="100%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td width="12" height="35"><img
																src="<%=path%>/user/image/tab_18.gif" width="12"
																height="35" /></td>
															<td><table width="100%" border="0" cellspacing="0"
																	cellpadding="0">
																	<tr>
																		<td class="STYLE4">&nbsp;&nbsp;共有 <s:property
																				value="%{totalRec}" />条记录，当前第 <s:property
																				value="%{curpage}" />/<s:property
																				value="%{totalPage}" />页
																		</td>
																		<td><table border="0" align="right"
																				cellpadding="0" cellspacing="0">
																				<tr>
																					<td width="40"><a href="javascript:void(0);"
																						onclick="sendUrl(1,'${user.username}','${user.sex}','${user.age}','${user.address}')">
																							<img src="<%=path%>/user/image/first.gif"
																							width="37" height="15" border="0" />
																					</a></td>


																					<c:if test="${curpage==1}">
																						<td width="45"><a href="javascript:void(0);"
																							onclick="sendUrl(1,'${user.username}','${user.sex}','${user.age}','${user.address}')">

																								<img src="<%=path%>/user/image/back.gif"
																								width="43" height="15" border="0" />
																						</a></td>
																					</c:if>
																					<c:if test="${curpage!=1}">
																						<td width="45"><a href="javascript:void(0);"
																							onclick="sendUrl('${curpage-1}','${user.username}','${user.sex}','${user.age}','${user.address}')">
																								<img src="<%=path%>/user/image/back.gif"
																								width="43" height="15" border="0" />
																						</a></td>
																					</c:if>

																					<c:if test="${curpage eq totalPage}">
																						<td width="45"><a href="javascript:void(0);"
																							onclick="sendUrl('${totalPage}','${user.username}','${user.sex}','${user.age}','${user.address}')">
																								<img src="<%=path%>/user/image/next.gif"
																								width="43" height="15" border="0" />
																						</a></td>
																					</c:if>
																					<c:if test="${curpage ne totalPage}">
																						<td width="45"><a href="javascript:void(0);"
																							onclick="sendUrl('${curpage+1}','${user.username}','${user.sex}','${user.age}','${user.address}')">
																								<img src="<%=path%>/user/image/next.gif"
																								width="43" height="15" border="0" />
																						</a></td>
																					</c:if>


																					<td width="40"><a href="javascript:void(0);"
																						onclick="sendUrl('${totalPage}','${user.username}','${user.sex}','${user.age}','${user.address}')">
																							<img src="<%=path%>/user/image/last.gif"
																							width="37" height="15" border="0" />
																					</a></td>
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
																							src="<%=path%>/user/image/go.gif" width="37"
																							height="15" border="0" /></a></td>
																				</tr>
																			</table></td>
																	</tr>
																</table></td>
															<td width="16"><img
																src="<%=path%>/user/image/tab_20.gif" width="16"
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
			<td background="<%=path%>/user/images/mail_rightbg.gif">&nbsp;</td>
		</tr>
		<tr>
			<td valign="middle"
				background="<%=path%>/user/images/mail_leftbg.gif"><img
				src="<%=path%>/user/images/buttom_left2.gif" width="17" height="17" /></td>
			<td height="17" valign="top"
				background="<%=path%>/user/images/buttom_bgs.gif"><img
				src="<%=path%>/user/images/buttom_bgs.gif" width="17" height="17" /></td>
			<td background="<%=path%>/user/images/mail_rightbg.gif"><img
				src="<%=path%>/user/images/buttom_right2.gif" width="16" height="17" /></td>
		</tr>
	</table>

</body>

</html>