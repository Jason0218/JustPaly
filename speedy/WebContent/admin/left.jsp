<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理页面</title>

<script src="js/prototype.lite.js" type="text/javascript"></script>
<script src="js/moo.fx.js" type="text/javascript"></script>
<script src="js/moo.fx.pack.js" type="text/javascript"></script>
<style>
body {
	font:12px Arial, Helvetica, sans-serif;
	color: #000;
	background-color: #EEF2FB;
	margin: 0px;
}
#container {
	width: 182px;
}
H1 {
	font-size: 12px;
	margin: 0px;
	width: 182px;
	cursor: pointer;
	height: 30px;
	line-height: 20px;	
}
H1 a {
	display: block;
	width: 182px;
	color: #000;
	height: 30px;
	text-decoration: none;
	moz-outline-style: none;
	background-image: url(images/menu_bgS.gif);
	background-repeat: no-repeat;
	line-height: 30px;
	text-align: center;
	margin: 0px;
	padding: 0px;
}
.content{
	width: 182px;
	height: 26px;
	
}
.MM ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	display: block;
}
.MM li {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	list-style-type: none;
	display: block;
	text-decoration: none;
	height: 26px;
	width: 182px;
	padding-left: 0px;
}
.MM {
	width: 182px;
	margin: 0px;
	padding: 0px;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;
	clip: rect(0px,0px,0px,0px);
}
.MM a:link {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:visited {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
.MM a:active {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	font-weight: bold;
	color: #006600;
	background-image: url(images/menu_bg2.gif);
	background-repeat: no-repeat;
	text-align: center;
	display: block;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
</style>
<script type="text/javascript">
window.onload=function(){
	var u1=document.getElementById("1");
	if(u1.innerHTML==""){
		document.getElementById("a"+1).style.display="none";
	}
	var u2=document.getElementById("2");
	if(u2.innerHTML==""){
		document.getElementById("a"+2).style.display="none";
	}
	
	var u3=document.getElementById("3");
	if(u3.innerHTML==""){
		document.getElementById("a"+3).style.display="none";
	}
	var u4=document.getElementById("4");
	if(u4.innerHTML==""){
		document.getElementById("a"+4).style.display="none";
	}
	var u5=document.getElementById("5");
	if(u5.innerHTML==""){
		document.getElementById("a"+5).style.display="none";
	}
	var u6=document.getElementById("6");
	if(u6.innerHTML==""){
		document.getElementById("a"+6).style.display="none";
	}
	var u7=document.getElementById("7");
	if(u7.innerHTML==""){
		document.getElementById("a"+7).style.display="none";
	}
	var u8=document.getElementById("8");
	if(u8.innerHTML==""){
		document.getElementById("a"+8).style.display="none";
	}
	var u9=document.getElementById("9");
	if(u9.innerHTML==""){
		document.getElementById("a"+9).style.display="none";
	}
}

</script>
</head>

<body>
<table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#EEF2FB">
  <tr>
    <td width="182" valign="top"><div id="container">
      <h1 class="type" id="a1"><a href="javascript:void(0)">用户管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM" id="1">
        <c:forEach items="${pmsList }" var="p">
        <c:if test="${p.model eq 1}">
        <li><a href="${p.purl }" target="main">${p.pname }</a></li>
        </c:if>
        </c:forEach>
        </ul>
      </div>
      <h1 class="type" id="a2"><a href="javascript:void(0)">权限管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM" id="2">
        <c:forEach items="${pmsList }" var="p">
        <c:if test="${p.model eq 2}">
        <li><a href="${p.purl }" target="main">${p.pname }</a></li>
        </c:if>
        </c:forEach>
        </ul>
      </div>
      <h1 class="type" id="a3"><a href="javascript:void(0)">订单管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM" id="3">
        <c:forEach items="${pmsList }" var="p">
        <c:if test="${p.model eq 3}">
        <li><a href="${p.purl }" target="main">${p.pname }</a></li>
        </c:if>
        </c:forEach>
        </ul>
      </div>
       <h1 class="type" id="a4"><a href="javascript:void(0)">交接单管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM" id="4">
        <c:forEach items="${pmsList }" var="p">
        <c:if test="${p.model eq 4}">
        <li><a href="${p.purl }" target="main">${p.pname }</a></li>
        </c:if>
        </c:forEach>
        </ul>
      </div>
       <h1 class="type" id="a5"><a href="javascript:void(0)">车辆管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM" id="5">
          <c:forEach items="${pmsList }" var="p">
        <c:if test="${p.model eq 5}">
        <li><a href="${p.purl }" target="main">${p.pname }</a></li>
        </c:if>
        </c:forEach>
        </ul>
      </div>
      <h1 class="type" id="a6"><a href="javascript:void(0)">线路管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM" id="6">
          <c:forEach items="${pmsList }" var="p">
        <c:if test="${p.model eq 6}">
        <li><a href="${p.purl }" target="main">${p.pname }</a></li>
        </c:if>
        </c:forEach>
        </ul>
      </div>
    </div>
        <h1 class="type" id="a7"><a href="javascript:void(0)">配送点管理</a></h1>
      <div class="content">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
            </tr>
          </table>
        <ul class="MM" id="7">
      <c:forEach items="${pmsList }" var="p">
        <c:if test="${p.model eq 7}">
        <li><a href="${p.purl }" target="main">${p.pname }</a></li>
        </c:if>
        </c:forEach>
        </ul>
      </div> 
      <h1 class="type" id="a8"><a href="javascript:void(0)">财务报表管理</a></h1>
      <div class="content">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
            </tr>
          </table>
        <ul class="MM" id="8">
        <c:forEach items="${pmsList }" var="p">
        <c:if test="${p.model eq 8}">
        <li><a href="${p.purl }" target="main">${p.pname }</a></li>
        </c:if>
        </c:forEach>
        </ul>
      </div>
      <h1 class="type" id="a8"><a href="javascript:void(0)">信息加密管理</a></h1>
      <div class="content">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
            </tr>
          </table>
        <ul class="MM" id="9">
        <c:forEach items="${pmsList }" var="p">
        <c:if test="${p.model eq 9}">
        <li><a href="${p.purl }" target="main">${p.pname }</a></li>
        </c:if>
        </c:forEach>
        </ul>
      </div>
        <script type="text/javascript">
		var contents = document.getElementsByClassName('content');
		var toggles = document.getElementsByClassName('type');
	
		var myAccordion = new fx.Accordion(
			toggles, contents, {opacity: true, duration: 400}
		);
		myAccordion.showThisHideOpen(contents[0]);
	</script>
        </td>
  </tr>
</table>
</body>
</html>