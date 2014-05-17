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
<title>角色新增</title>
<script type="text/javascript">

window.onload=function(){
var sel=document.getElementById("mods");
var mod=document.getElementById("mod").value;
sel[mod-1].selected=true;
}



	function move(s1, s2) {
		//alert('ssssssss');
		var s1 = document.getElementById(s1);
		//alert(s1.selectedIndex);
		var s2 = document.getElementById(s2);
		while (s1.selectedIndex > -1) {

			var o = new Option();
			o.text = s1[s1.selectedIndex].text;
			o.value = s1[s1.selectedIndex].value;
			s1.remove(s1.selectedIndex);
			s2.add(o);
		}
	}

	var xmlHttp;
	var flag=false;

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

	function validatePmsName() {
		xmlHttp = ajaxFunction();
		var PmsName = document.getElementById("PmsName").value;
		xmlHttp.open("GET",
				encodeURI(encodeURI("validatePmsName.action?pname="
						+ PmsName + "&t=" + new Date().getTime())), true);
		xmlHttp.onreadystatechange = haolejiaowo;
		xmlHttp.send(null);
	}

	function haolejiaowo() {
		if (xmlHttp.readyState == 4) {
			var msg = xmlHttp.responseText;
			
			var msgspan = document.getElementById("msg");
			if (msg == "kong") {
				msgspan.innerHTML="<font style='color:red;'>对不起,权限名称不能为空</font>";
				flag=false;
			}
			if (msg == "chongfu") {
				msgspan.innerHTML="<font style='color:red;'>该权限名已存在</font>";
				flag=false;
			}
			if (msg == "ok") {
				msgspan.innerHTML="<img src='../quanxian/image/start.gif'></img>";
				flag=true;
			}

		}

	}
	function sub(){
		
			 document.getElementById("f").submit();
		
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
						<td height="31"><div class="titlebt">角色新增</div></td>
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
									<td class="left_txt">当前位置：角色新增</td>
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
													class="left_txt3">角色信息</span><span class="left_txt2">！</span><br>
													<span class="left_txt2">包括</span><span class="left_txt3">车牌号，司机，运载力，运载体积</span><span
													class="left_txt2">等以及</span><span class="left_txt3">角色权限设置</span><span
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
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;权限新增设置</td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td>
										<form name="form1" method="POST" action="updatePms.action" id="f">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">权限名称：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30" bgcolor="#f2f2f2"><input
														name="pms.pname" type="text" id="PmsName" size="30"
														value="${pms.pname }" style="background-color: silver;"/ readonly="readonly"></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="msg">新增权限的名称</span></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="RoleNameSpan"></span></td>
												</tr>
												
												<tr>
													<td width="20%" height="30" align="right" 
														class="left_txt2">权限模块：</td>
													<td width="3%" >&nbsp;</td>
													<td width="32%" height="30" >
													<input id="mod" value="${pms.model }" style="display: none;"/>
													<select name="pms.model" id="mods">
													<option value="1">用户管理</option>
													<option value="2">权限管理</option>
													<option value="3">订单管理</option>
													<option value="4">交接单管理</option>
													<option value="5">车辆管理</option>
													<option value="6">线路管理</option>
													<option value="7">配送点管理</option>
													<option value="8">财务报表管理</option>
													</select>
													</td>
													<td width="45%" height="30" 
														class="left_txt"><span id="msg">新增权限的所属模块</span></td>
													<td width="45%" height="30" 
														class="left_txt"><span id="RoleNameSpan"></span></td>
												</tr>
												
												
												
												<tr>
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">权限路径：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30" bgcolor="#f2f2f2"><input
														name="pms.purl" type="text" id="RoleName" size="30"
														value="${pms.purl }" /></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="msg">新增权限的请求路径</span></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="RoleNameSpan"></span></td>
												</tr>
												

												<tr>
													<td height="30" align="right" class="left_txt2"></td>
													<td>&nbsp;</td>
													<td height="30"><input type="button" value="提交" onclick="sub();"/> <input
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