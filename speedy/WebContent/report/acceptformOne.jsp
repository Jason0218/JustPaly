<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date;" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>

<style type="text/css">
body{
   background-color:#f2f2f2;
}

</style>
<script>
function showpath(){
	alert("报表的打印路径为：C:/Documents and Settings/new/桌面/");
}

function ajaxFunction() {
	var xmlHttp=null;
	try {
		// Firefox, Opera 8.0+, Safari
		xmlHttp = new XMLHttpRequest();
	} catch (e) {

		// Internet Explorer
		try {
			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e) {

			try {
				xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e) {
				alert("您的浏览器不支持Ajax");
				return false;
			}
		}
	}
	
	return xmlHttp;
	
}
function sendRequest(url){

	xmlHttp = ajaxFunction();//调用创建请求对象的函数
	//alert(xmlHttp);
	xmlHttp.open("GET",url,true);
	xmlHttp.onreadystatechange = idTest;//指定响应函数
	xmlHttp.send(null);
}
function idTest(){
	if(xmlHttp.readyState==4){
		show();
	}
}
function show(){
	var msg1 = document.getElementById("msg");

	var result = xmlHttp.responseText;

	var id = document.getElementById("idnumber").value;
		if(id != ""){
		if(result == "idnumberfalse"){
			msg1.innerHTML = "<font style='color:red;'>该报表不存在</font>";
			//flagUsername=false;
		//document.getElementById("carId").value = "";
		}
		if(result=="idnumbertrue"){
			msg1.innerHTML = "<img src='<%=path%>/report/image/start.gif'></img>";
			//flagUsername=true;
			}
		}else{
			
		}
}

function validateId() {

	id = document.getElementById("idnumber").value;
	var url = "report/AcceptformById1?id="+id+"&t="+new Date().getTime();
	url = encodeURI(encodeURI(url));
	sendRequest(url);
}


</script>

</head>
<body>
	

	
	
	
	<h1 style="text-align: center;padding-top:30px">配送点报表管理 </h1>
<div style="text-align: center">
	<form action="report/AcceptformById"  method="post" >
	
	 请输入报表号:<input type="text" name="id" id="idnumber"  onkeyup="validateId()">
		<span id="msg"></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	 
	<input type="submit" value="查询"  />
	</form>
	</div>
	<table  align="center" >
	<tr height="50">
	     <th>报表id</th>
	     <th>报表时间</th>
	     <th>报表生成时间</th>
	     <th>配送点名称</th>
	     <th>货物总重量</th>
	     <th>货物总体积</th>
	     <th>货物利润</th>
	</tr>
	
	<tr >
	    <td height="20" bgcolor="#FFFFFF" ><div align="center">${id}</div></td>
	    <td height="20" bgcolor="#FFFFFF" ><div align="center"><s:date name="acceptform.formdate" format="yyyy-MM-dd"/></div></td>
	    <td height="20" bgcolor="#FFFFFF" ><div align="center"><s:date name="acceptform.formbirthdate" format="yyyy-MM-dd" /></div></td>
	    <td height="20" bgcolor="#FFFFFF" ><div align="center">${acceptform.sendnode.nodename}</div></td>
		<td height="20" bgcolor="#FFFFFF" ><div align="center">${acceptform.totalweight}</div></td>
		<td height="20" bgcolor="#FFFFFF" ><div align="center">${acceptform.totalvolume}</div></td>
		<td height="20" bgcolor="#FFFFFF" ><div align="center">${acceptform.totalincome}</div></td>
	</tr>
	
	
    
	</table>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		
</body>
</html>