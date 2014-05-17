<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="s" uri="/struts-tags"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>信息加密</title>
<script type="text/javascript">

	var xmlHttp;

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
					alert("您的浏览器不支持AJAX！");
					return false;
				}
			}
		}
		return XMLHttp;
	}
	//加密系统初始化
	function  getSk(){
		xmlHttp=ajaxFunction();
		xmlHttp.open("get","<%=path%>/user/cpabeAction_keygen.action",true);
		xmlHttp.send(null);
		xmlHttp.onreadystatechange=function(){
			if (xmlHttp.readyState == 4){
				var sk = document.getElementById("sk");
				if (xmlHttp.responseText == true){
					
					sk.value=xmlHttp.responseText;
			}
		};
		
	}
		
</script>
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

<link href="../admin/images/skin.css" rel="stylesheet" type="text/css" />
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
						<td height="31"><div class="titlebt">信息解密</div></td>
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
									<td class="left_txt">当前位置：信息解密</td>
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
												<td width="90%" valign="top"><span class="left_txt2">友情提示：解密需要按以下两步操作：<br>一.选择属于您自己相应的属性<br>二.请点击<font color="red">获取密文</font>按钮，获得要解密信息的密文<br>三.点击<font color="red">解密</font>按钮，开始解密</span></td>
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
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;信息解密</td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td>
										
										<form name="form1" method="POST" action="<%=path%>/user/cpabeAction_dec.action" id="f">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="20%" height="30" align="right" 
														class="left_txt2"  bgcolor="#f2f2f2">角色选项：</td>
													<td width="3%"  bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30"  bgcolor="#f2f2f2">
													<select name="user.rid">
													<option value="0">请选择</option>
													<option value="2021">省公司管理员</option>
													<option value="2001">超级管理员</option>
													<option value="2020">配送点管理员</option>
													<option value="2022">车辆管理员</option>
													<option value="1000">BOOS</option>
													</select>
													</td>
													<td width="45%" height="30" 
														class="left_txt"  bgcolor="#f2f2f2"><span id="msg">选择属于您自己角色名称</span></td>
													<td width="45%" height="30" 
														class="left_txt"><span id="RoleNameSpan"></span></td>
												</tr>
												<tr>
													<td width="20%" height="30" align="right" 
														class="left_txt2">您的所在地：</td>
													<td width="3%" >&nbsp;</td>
													<td width="32%" height="30" >
													<select name="user.address">
													<option value="0">请选择</option>
													<option value="北京">北京</option>
													<option value="上海">上海</option>
													<option value="广州">广州</option>
													<option value="深圳">深圳</option>
													<option value="南京">南京</option>
													</select>
													</td>
													<td width="45%" height="30" 
														class="left_txt"><span id="msg">选择您的所在地属性</span></td>
													<td width="45%" height="30" 
														class="left_txt"><span id="RoleNameSpan"></span></td>
												</tr>
												<tr>
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">性别：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td  bgcolor="#f2f2f2"><input
														name="user.sex" type="radio" id="RoleName"  value="男"/>男
														<input
														name="user.sex" type="radio" id="RoleName"  value="女"/>女</td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="msg">选择您的性别</span></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="RoleNameSpan"></span></td>
												</tr>
												<tr>
													<td width="20%" height="30" align="right" 
														class="left_txt2">密文显示：</td>
													<td width="3%" >&nbsp;</td>
													<td  >
														<textarea name="user.tel"  id="sk" ></textarea>
														<input type="button" id="ct" onclick="getSk();" value="获取密文"/></td>
													<td width="45%" height="30" 
														class="left_txt"><span id="msg">这里显示您要访问信息的密文</span></td>
													<td width="45%" height="30" 
														class="left_txt"></td>
												</tr>

												<tr>
													<td height="30" align="right" class="left_txt2"></td>
													<td>&nbsp;</td>
													<td height="30"><input type="button" value="解密" /> <input
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