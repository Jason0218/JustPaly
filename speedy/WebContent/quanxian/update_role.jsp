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

	function validateRoleName() {
		xmlHttp = ajaxFunction();
		var RoleName = document.getElementById("RoleName").value;
		xmlHttp.open("GET",
				encodeURI(encodeURI("role/validateRoleName.action?rname="
						+ RoleName + "&t=" + new Date().getTime())), true);
		xmlHttp.onreadystatechange = haolejiaowo;
		xmlHttp.send(null);
	}

	function haolejiaowo() {
		if (xmlHttp.readyState == 4) {
			var msg = xmlHttp.responseText;
			
			var msgspan = document.getElementById("msg");
			if (msg == "kong") {
				msgspan.innerHTML="<font style='color:red;'>对不起,角色名称不能为空</font>";
				flag=false;
			}
			if (msg == "chongfu") {
				msgspan.innerHTML="<font style='color:red;'>该角色名已存在</font>";
				flag=false;
			}
			if (msg == "ok") {
				msgspan.innerHTML="<img src='<%=path%>/quanxian/image/start.gif'></img>";
				flag=true;
			}

		}

	}
	function sub(){
		var s=document.getElementById("s2");
		var rid=document.getElementById("yc").value;
		//alert(rid);
		var pidlist=new Array();
		for ( var i = 0; i < s.length; i++) {
			
		pidlist.push(s[i].value);
		}
		//alert(pidlist);
		if(s.length==0){
			alert("请为该角色授予权限！");
			return;
		}
		
			//rname=encodeURI(encodeURI(rname));
			location.href="updateRolePms.action?rid="+rid+"&pidlist="+pidlist;
		
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
						<td height="31"><div class="titlebt">角色修改</div></td>
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
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;角色新增设置</td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td>
										<form name="form1" method="POST" action="insertRole.action" id="f">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">角色名称：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30" bgcolor="#f2f2f2"><input type="text" value="${role.rid }" style="display: none" id="yc"/><input
														name="role.rname" type="text" id="RoleName" size="30"
														value="${role.rname }" readonly="readonly" style="background-color: silver;"/></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="msg">角色的名称</span></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="RoleNameSpan"></span></td>
												</tr>
												<tr>
													<td height="30" align="right" class="left_txt2">授予权限：</td>
													<td>&nbsp;</td>
													<td height="30"><table><td><select size="13" multiple="multiple" 
														id="s1" style="width:200px;">
														<s:iterator value="roleelsepms">
															<option value="<s:property value='pid'/>" id="o"><s:property value="pname"/></option>
														</s:iterator>
													</select></td><td> <input type="button" value="=添加=>" onclick="move('s1','s2')"><br>

														<input type="button" value="<=移除=" onclick="move('s2','s1')"></td><td>


														<select size="13" multiple="multiple" id="s2" style="width:200px;">
														<s:iterator value="rolepms">
															<option value="<s:property value='pid'/>" id="o"><s:property value="pname"/></option>
														</s:iterator>
													</select></td></table></td>
													<td height="30" class="left_txt">为该角色授予权限</td>
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