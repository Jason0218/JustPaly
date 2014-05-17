<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<link href="images/skin.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function fun1()
{
	   
	 var acrosscity = document.getElementById("acrosscity");
	 var acrosscitys = document.getElementById("acrosscitys"); 
     for(var i=0;i<acrosscity.options.length;i=i+1) {  
    	 if(acrosscity.options[i].selected)  
         {
    		 acrosscitys.value = acrosscitys.value+acrosscity.options[i].value+",";
         }
    }    
}     
</script>
</head>
<body>
<%
  String totalroute_routeid = request.getParameter("totalroute_routeid");
  String totalrouteid = request.getParameter("totalrouteid");
  String totalroutenum = new String(request.getParameter("totalroutenum").getBytes("ISO-8859-1"),"utf-8"); 
  String totalroutestartnode = new String(request.getParameter("totalroutestartnode").getBytes("ISO-8859-1"),"utf-8");
  String totalrouteendpoint = new String(request.getParameter("totalrouteendpoint").getBytes("ISO-8859-1"),"utf-8");
  String totalrouteacrossnoade = new String(request.getParameter("totalrouteacrossnoade").getBytes("ISO-8859-1"),"utf-8");
  String totalRoute_routename = new String(request.getParameter("totalRoute_routename").getBytes("ISO-8859-1"),"utf-8");
  request.setAttribute("totalroute_routeid", totalroute_routeid);
  request.setAttribute("totalroutenum", totalroutenum);
  request.setAttribute("totalrouteid", totalrouteid);
  request.setAttribute("totalroutestartnode", totalroutestartnode);
  request.setAttribute("totalrouteendpoint", totalrouteendpoint);
  request.setAttribute("totalrouteacrossnoade", totalrouteacrossnoade);
  request.setAttribute("totalRoute_routename", totalRoute_routename);
%>
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
						<td height="31"><div class="titlebt">线路修改</div></td>
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
									<td class="left_txt">当前位置：线路修改</td>
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
													class="left_txt3">总线路信息</span><span class="left_txt2">！</span><br>
													<span class="left_txt2">包括</span><span class="left_txt3">线路编号，线路名称，出发城市，目的地城市，途径城市等</span><span
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
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;线路修改设置</td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td>
										<form name="form1" 
											action="TotalRouteAction_update" method="post">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">总线路id：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30" bgcolor="#f2f2f2">
													<input name="totalRoute.id" id="routename" type="text"  size="30" value="${totalrouteid}" readonly="readonly" style="background-color: silver;"
														/></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt">该线路的编号</td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="carIdSpan"></span></td>
												<tr>
												<tr>
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">线路总编号：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30" bgcolor="#f2f2f2">
													<input style="background-color: silver;" name="totalRoute.routenum" id="routename" type="text"  size="30" value="${totalroutenum}"
														/></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt">该线路的编号</td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="carIdSpan"></span></td>
												<tr>
												<tr>
													<td width="20%" height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">总线路名称：</td>
													<td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
													<td width="32%" height="30" bgcolor="#f2f2f2">
													<input name="" id="inputRouteName" type="text"  size="30" onblur="checkName()" value="${totalRoute_routename}" readonly="readonly" style="background-color: silver;"
														/><span id="yanzhengname"></span></td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt">该线路从城市到城市</td>
													<td width="45%" height="30" bgcolor="#f2f2f2"
														class="left_txt"><span id="checkRouteName"></span></td>
												<tr>
													<td height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">出发地：</td>
													<td bgcolor="#f2f2f2">&nbsp;</td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt">
													<input readonly="readonly" type="text" name="totalRoute.startnode" value="${totalroutestartnode}" style="background-color: silver;">
												</td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt">目的地城市所在地</td>
												</tr>
											
												
												<tr>
													<td height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">目的地：</td>
													<td bgcolor="#f2f2f2">&nbsp;</td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt">
													<input readonly="readonly" type="text" name="totalRoute.endpoint" value="${totalrouteendpoint}" style="background-color: silver;">
													</td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt">目的地城市所在地</td>
												</tr>
													<tr>
													<td height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">途径地：</td>
													<td bgcolor="#f2f2f2">&nbsp;</td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt"><select
														 id="acrosscity" multiple="multiple">
															<option value="上海">上海</option>
															<option value="武汉">武汉</option>
															<option value="合肥">合肥</option>
															<option value="南京">南京</option>
															<option value="北京">北京</option>
															<option value="广州">广州</option>
															<option value="深圳">深圳</option>	
													</select>
													<input type="button" value="添加" id="" onclick="fun1()">
													<input name="totalRoute.acrossnoade" id="acrosscitys" type="text" value="${totalrouteacrossnoade}">
													</td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt">需要经过的城市</td>
												</tr>
												<tr>
													<td height="30" align="right" class="left_txt2"></td>
													<td>&nbsp;</td>
													<td height="30"><input type="submit" value="提交"  id="submit" /> <input
														type="reset" value="重置" /></td>
													<td height="30" class="left_txt">&nbsp;</td>
												</tr>
												<tr>
													<td height="90" colspan="4" class="left_txt2"><table
															width="100%" height="99" border="0" cellpadding="0"
															cellspacing="0">
														</table></td>
												</tr>
												<tr>
													<td height="90" colspan="4" class="left_txt"><table
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