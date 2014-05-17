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
<title>用户信息修改</title>

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
						<td height="31"><div class="titlebt">信息修改</div></td>
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
									<td class="left_txt">当前位置：信息修改</td>
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
												<td width="90%" valign="top"><span class="left_txt2">在这里，您可以修改</span><span
													class="left_txt3">用户的信息</span><span class="left_txt2">！</span><br>
													<span class="left_txt2">包括</span><span class="left_txt3">用户名，密码，确认密码，性别</span><span
													class="left_txt2">等以及</span><span class="left_txt3">，年龄，电话，地址，邮箱，角色</span><span
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
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;用户信息修改设置</td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td>
										<form name="form1" method="POST" id="myForm"
											action="<%=path%>/user/updateUser.action">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td><input type="hidden" name="user.id"
														value="<s:property value='%{user.id}'/>" /></td>
												</tr>
												<tr>
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">用户名：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30" bgcolor="#f2f2f2"><input
														name="user.username" type="text" id="username" size="30"
														value="<s:property value='%{user.username}'/>"
														readonly="readonly" style="background: #f2f2f2" /></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="msg">修改用户的用户名</span></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"></td>
												</tr>
												<tr>
													<td height="30" align="right" class="left_txt2">性别：</td>
													<td>&nbsp;</td>
													<td height="30"><input type="radio" name="user.sex"
														checked="checked" value="男">男 <input type="radio"
														name="user.sex" value="女">女</td>
													<td height="30" class="left_txt">请选择性别</td>
												</tr>
												<tr>
													<td height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">年龄：</td>
													<td bgcolor="#f2f2f2">&nbsp;</td>
													<td height="30" bgcolor="#f2f2f2"><input type="text"
														name="user.age" size="30" id="age"
														value="<s:property value='%{user.age}'/>" /></td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt">请输入年龄</td>
												</tr>
												<tr>
													<td height="30" align="right" class="left_txt2">电话：</td>
													<td>&nbsp;</td>
													<td height="30"><input type="text" name="user.tel"
														size="30" id="tel"
														value="<s:property value='%{user.tel}'/>" /></td>
													<td height="30" class="left_txt">请输入电话</td>
												</tr>
												<tr>
													<td height="30" align="right" class="left_txt2">地址：</td>
													<td>&nbsp;</td>
													<td height="30"><input type="text" name="user.address"
														size="30" id="address"
														value="<s:property value='%{user.address}'/>" /></td>
													<td height="30" class="left_txt">请输入地址</td>
												</tr>
												<tr>
													<td height="30" align="right" class="left_txt2">邮箱：</td>
													<td>&nbsp;</td>
													<td height="30"><input type="text" name="user.email"
														size="30" id="email"
														value="<s:property value='%{user.email}'/>" /></td>
													<td height="30" class="left_txt">请输入邮箱</td>
												</tr>
												<tr>
													<td height="30" align="right" bgcolor="#F7F8F9"
														class="left_txt2">角色：</td>
													<td bgcolor="#F7F8F9">&nbsp;</td>
													<td height="30" bgcolor="#F7F8F9" class="left_txt"><select
														name="user.rid">
															<option>--请选择--</option>
															<s:iterator id="r" value="rolist">
																<s:if test="%{#r.rid==user.rid}">
																	<option value="<s:property value="rid"/>"
																		selected="selected">
																		<s:property value="rname" />
																	</option>
																</s:if>
																<s:else>
																	<option value="<s:property value="rid"/>">
																		<s:property value="rname" />
																	</option>
																</s:else>

															</s:iterator>
													</select></td>
													<td height="30" bgcolor="#F7F8F9" class="left_txt">请选择角色</td>
												</tr>
												<tr>
													<td height="30" align="right" bgcolor="#F7F8F9"
														class="left_txt2">配送点：</td>
													<td bgcolor="#F7F8F9">&nbsp;</td>
													<td height="30" bgcolor="#F7F8F9" class="left_txt"><select
														name="user.node_id">
															<option>--请选择--</option>
															<s:iterator id="rr" value="nolist">
																<s:if test="%{#rr.id==user.node_id}">
																	<option value="<s:property value="id"/>"
																		selected="selected">
																		<s:property value="nodename" />
																	</option>
																</s:if>
																<s:else>
																	<option value="<s:property value="id"/>">
																		<s:property value="nodename" />
																	</option>
																</s:else>

															</s:iterator>
													</select></td>
													<td height="30" bgcolor="#F7F8F9" class="left_txt">请选择配送点</td>
												</tr>

												<tr>
													<td height="30" align="right" class="left_txt2"></td>
													<td>&nbsp;</td>
													<td height="30"><input type="submit" value="提交" /> <input
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
				src="<%=path%>/user/images/buttom_right2.gif" width="16"
				height="17" /></td>
		</tr>
	</table>

</body>

</html>