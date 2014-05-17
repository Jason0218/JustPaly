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
	function init(){
		xmlHttp=ajaxFunction();
		xmlHttp.open("get","<%=path%>/user/cpabeAction_setup.action",true);
		xmlHttp.send(null);
		xmlHttp.onreadystatechange=function(){
			
			if (xmlHttp.readyState == 4){
				var msgspan = document.getElementById("err");
				var info = document.getElementById("info");
				info.innerHTML=xmlHttp.responseText;
				if (xmlHttp.responseText == true){
					
					msgspan.innerHTML="<font style='color:green;'>加密系统初始化成功！</font>";
				}else{
					msgspan.innerHTML="<font style='color:red;'>加密系统初始化失败！</font>";
					
				}
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
						<td height="31"><div class="titlebt">信息加密</div></td>
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
									<td class="left_txt">当前位置：信息加密</td>
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
												<td width="90%" valign="top"><span class="left_txt2">友情提示：加密需要按以下三步操作：<br>一.请点击<font color="blue">系统初始化</font>按钮，完成加密系统初始化工作<br>二.选择要加密的方案<br>（例如：角色选择“省公司管理员”,地址选择“上海”,性别选择“男”就表示只有用户属性同时满足以上三项才能对信息解密）<br>三.输入要加密的信息<br>四.点击<font color="blue">加密</font>按钮，加密开始<br><font color="red" size="5px">注意：如果三项中只选一项，则表示只要满足该属性的用户即可访问加密信息</font></span></td>
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
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;信息加密</td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td>
										
										<form name="form1" method="POST" action="<%=path%>/user/cpabeAction_enc.action" id="f">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
												<td  width="20%" height="30" align="center" ><input type="button" value="系统初始化" onclick="init();"/></td>
												<td width="3%" >&nbsp;</td>
												<td><span id="err"></span>
												</td>
												</tr>
												
												
												<tr>
													<td width="20%" height="30" align="right" 
														class="left_txt2"  bgcolor="#f2f2f2">角色选项：</td>
													<td width="3%"  bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30"  bgcolor="#f2f2f2">
													<select name="user.username">
													<option value="0">请选择</option>
													<option value="role:shengadmin">省公司管理员</option>
													<option value="role:superadmin">超级管理员</option>
													<option value="role:nodeadmin">配送点管理员</option>
													<option value="role:caradmin">车辆管理员</option>
													<option value="role:BOSS">BOOS</option>
													</select>
													</td>
													<td width="45%" height="30" 
														class="left_txt"  bgcolor="#f2f2f2"><span id="msg">选择信息解密方的角色</span></td>
													<td width="45%" height="30" 
														class="left_txt"><span id="RoleNameSpan"></span></td>
												</tr>
												<tr>
													<td width="20%" height="30" align="right" 
														class="left_txt2">解密方所在地：</td>
													<td width="3%" >&nbsp;</td>
													<td width="32%" height="30" >
													<select name="user.address">
													<option value="0">请选择</option>
													<option value="addr:beijing">北京</option>
													<option value="addr:shanghai">上海</option>
													<option value="addr:guangzhou">广州</option>
													<option value="addr:shenzhen">深圳</option>
													<option value="addr:nanjing">南京</option>
													</select>
													</td>
													<td width="45%" height="30" 
														class="left_txt"><span id="msg">选择解密放所在地</span></td>
													<td width="45%" height="30" 
														class="left_txt"><span id="RoleNameSpan"></span></td>
												</tr>
												<tr>
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">性别：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td  bgcolor="#f2f2f2"><input
														name="user.sex" type="radio" id="RoleName"  value="sex:nan"/>男
														<input
														name="user.sex" type="radio" id="RoleName"  value="sex:nv"/>女</td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="msg">选择解密方的性别</span></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="RoleNameSpan"></span></td>
												</tr>
												<tr>
													<td width="20%" height="30" align="right" 
														class="left_txt2">请输入要加密的信息：</td>
													<td width="3%" >&nbsp;</td>
													<td  >
														<textarea name="user.tel"  id="RoleName" ></textarea></td>
													<td width="45%" height="30" 
														class="left_txt"><span id="msg">这里输入你要加密的信息</span></td>
													<td width="45%" height="30" 
														class="left_txt"><span id="RoleNameSpan"></span></td>
												</tr>

												<tr>
													<td height="30" align="right" class="left_txt2"></td>
													<td>&nbsp;</td>
													<td height="30"><input type="button" value="加密" /> <input
														type="reset" value="重置" /></td>
													<td height="30" class="left_txt" style="color: red;font-size: 3px">${success}</td>
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
<div id="info"></div>
</body>

</html>