<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
		<%
	String path = request.getContextPath();
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@taglib prefix="s" uri="/struts-tags" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="<%=path%>/admin/js/jquery.min.js"></script>
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
<script type="text/javascript">
var user;
var xmlHttp ;
var msg ;

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
				alert("222");
				return false;
			}
		}
	}
	return XMLHttp;
}

//发送请求函数
function sendRequest(url){
	xmlHttp = ajaxFunction();//调用创建请求对象的函数
	//alert(xmlHttp);
	xmlHttp.open("GET",url,true);
	xmlHttp.onreadystatechange = processResponse;//指定响应函数
	xmlHttp.send(null);
}

//处理返回信息的函数
function processResponse(){
	if(xmlHttp.readyState == 4){
		
		show();
	}
}
//验证用户名......判断用户是否已经存在并且判断用户名是否为空
function show(){
	msg = document.getElementById("msg");
	var result = xmlHttp.responseText;
	//alert(result);
	var isnu = document.getElementById("username").value;
	if(isnu != ""){
		if(result == "false"){
			msg.innerHTML = "<font style='color:red;'>*该用户已存在</font>";
		}else{
			msg.innerHTML = "<img src='../car/image/start.gif'></img>";
		}
	}else{
		msg.innerHTML = "<font style='color:red;'>*对不起,用户名不能为空</font>";
	}
}

function validateUserName() {
	user = document.getElementById("username").value;
	var url = "<%=path%>/user/validateUserName.action?username="+user+"&t="+new Date().getTime();
	url = encodeURI(encodeURI(url));
	sendRequest(url);
}
//验证邮箱.....判断邮箱的格式
function foreach()  
{  
	var mail = document.getElementById("err_mail");
	mail.innerHTML="<img src='../car/image/start.gif'></img>";
    var temp = document.getElementById("mail").value;  
    var str="";  
    if(temp!="" && temp.indexOf(";")>0)    
    {  
        var arremail=temp.split(";");  
        for(var i=0;i <arremail.length;i++)  
        {  
            if(arremail[i].replace(/\s+/g,"").search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)==-1)  
            {  
                str=str+"<font style='color:red;'>*邮箱格式错误!!正确示例：123@qq.com</font>\n";  
                }  
            }  
        }  
    else  
    {  
        if(temp.replace(/\s+/g,"").search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/)==-1)  
        {  
            str="<font style='color:red;'>*邮箱格式错误!正确示例：123@qq.com</font>\n";  
            }  
        }  
    if(str!="")  
    {  
        mail.innerHTML=str;
        }  
}
//实现配送点下拉框
  function getNode(){
	  $.get("../order/getSendNode",function(redata){
	   	    
	    var sel=document.getElementById("node_id");
	    
	    for ( var i = 0; i < redata.length; i++) {
	    
	    
		var op = document.createElement("option");
		op.value = redata[i].id;
		op.text = redata[i].nodename;
		sel.add(op);
			
		}
	  },"json");
	  
	  
	  
  }
  
  //验证....判断用户名如果没有输入就提交的情况
  function check(){
	  var username = document.getElementById("username").value;
		var password = document.getElementById("password").value;
	 
	        if(username=="")
	      {
	        alert ("错误提示：用户名不能为空！");
	        return false;
	       }
	     if (password=="")
	     {
	       alert ("错误提示：密码不能为空！");
	      return false;
	 
	     }else{
	 		document.getElementById("myForm").submit();
	 	}
	   }

</script> 
<script type="text/javascript" src="<%=path %>/js/validate.js"></script>


<link href="../admin/images/skin.css" rel="stylesheet" type="text/css" />
<%-- <script type="text/javascript" src="<%=request.getContextPath() %>/js/validate.js"></script> --%>
<script type="text/javascript">
</script>
</head>
<body onload="getNode()">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" height="29" valign="top" background="../admin/images/mail_leftbg.gif"><img src="../admin/images/left-top-right.gif" width="17" height="29" /></td>
    <td width="935" height="29" valign="top" background="../admin/images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">添加用户</div></td>
      </tr>
    </table></td>
    <td width="16" valign="top" background="../admin/images/mail_rightbg.gif"><img src="../admin/images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td height="71" valign="middle" background="../admin/images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><table width="100%" height="138" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td height="13" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td valign="top"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td class="left_txt">当前位置：添加用户</td>
          </tr>
          <tr>
            <td height="20"><table width="100%" height="1" border="0" cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
              <tr>
                <td></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td><table width="100%" height="55" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="10%" height="55" valign="middle"><img src="../admin/images/title.gif" width="54" height="55"></td>
                <td width="90%" valign="top"><span class="left_txt2">在这里，您可以添加新用户的信息</span><span class="left_txt3"></span><span class="left_txt2">！</span><br>
                          <span class="left_txt2">包括</span><span class="left_txt3">用户名，密码，确认密码，性别</span><span class="left_txt2">，年龄，电话，地址，邮箱，角色</span><span class="left_txt3"></span><span class="left_txt2">。 </span></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="nowtable">
              <tr>
                <td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;添加用户信息</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
			<form name="form1" method="POST" id="myForm" action="<%=path%>/user/insertUser" >
              <tr>
                <td width="20%" height="30" align="right" bgcolor="#f2f2f2" class="left_txt2">用户名：</td>
                <td width="3%" bgcolor="#f2f2f2">&nbsp;</td>
                <td width="32%" height="30" bgcolor="#f2f2f2"><input name="user.username" type="text" id="username" size="30" onblur="validateUserName()"/></td>
                <td width="45%" height="30" bgcolor="#f2f2f2" class="left_txt" ><span id="msg">请输入您的用户名</span></td>
               
              </tr>
              <tr>
                <td height="30" align="right" class="left_txt2">密码：</td>
                <td>&nbsp;</td>
                <td height="30"><input type="text" name="user.password" id="password" size="30" onblur="checkPassword(this.name)"/></td>
                <td height="30" class="left_txt" id="user.password">请输入密码</td>
              </tr>
              <tr>
                <td height="30" align="right" bgcolor="#f2f2f2" class="left_txt2">确认密码：</td>
                <td bgcolor="#f2f2f2">&nbsp;</td>
                <td height="30" bgcolor="#f2f2f2"><input type="text" id="pwd" size="30" onblur="checkPwd('user.password',this.id,'err_pwd')"/></td>
                <td height="30" bgcolor="#f2f2f2" class="left_txt" id="err_pwd">请确认密码，确保和第一次输入密码相同</td>
              </tr>
            <tr><td height="30" align="right" bgcolor="#F7F8F9"
														class="left_txt2">性别：</td>
													<td bgcolor="#F7F8F9">&nbsp;</td>
													<td height="30" bgcolor="#F7F8F9"><input type="radio" name="user.sex" checked="checked" value="男">男
													<input type="radio" name="user.sex" value="女">女</td>
													<td height="30" bgcolor="#F7F8F9" class="left_txt">请选择性别</td></tr>
													  <tr>
													<td height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">年龄：</td>
													<td bgcolor="#f2f2f2">&nbsp;</td>
													<td height="30" bgcolor="#f2f2f2"><input type="text"
														name="user.age" size="30" /></td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt">请输入年龄</td>
												</tr>
              	                                 <tr>
													<td height="30" align="right" bgcolor="#F7F8F9"
														class="left_txt2">电话：</td>
													<td bgcolor="#F7F8F9">&nbsp;</td>
													<td height="30" bgcolor="#F7F8F9"><input type="text"
														name="user.tel" size="30" /></td>
													<td height="30" bgcolor="#F7F8F9" class="left_txt">请输入电话号码</td>
												</tr>
											   <tr>
													<td height="30" align="right" bgcolor="#f2f2f2"
														class="left_txt2">地址：</td>
													<td bgcolor="#f2f2f2">&nbsp;</td>
													<td height="30" bgcolor="#f2f2f2"><input type="text"
														name="user.address" size="30" /></td>
													<td height="30" bgcolor="#f2f2f2" class="left_txt">请输入地址</td>
												</tr>
											   <tr>
													<td height="30" align="right" bgcolor="#F7F8F9"
														class="left_txt2">邮箱：</td>
													<td bgcolor="#F7F8F9">&nbsp;</td>
													<td height="30" bgcolor="#F7F8F9"><input type="text"
														name="user.email" size="30" id="mail" onblur="foreach();"/></td>
													<td height="30" bgcolor="#F7F8F9" class="left_txt" id="err_mail">请输入邮箱</td>
												</tr>
											
              <tr>
                <td height="30" align="right" bgcolor="#f2f2f2" class="left_txt2">角色：</td>
                <td bgcolor="#f2f2f2">&nbsp;</td>
                <td height="30" bgcolor="#f2f2f2" class="left_txt"><select name="user.rid">
                															<option>--请选择--</option>
                															<s:iterator value="list">
                															<option value="<s:property value="rid"/>"><s:property value="rname"/></option>
                															</s:iterator>
                													</select> </td>
                <td height="30" bgcolor="#f2f2f2" class="left_txt">请选择角色</td>
              </tr>
                <tr>
                <td height="30" align="right" bgcolor="#F7F8F9" class="left_txt2">配送点：</td>
                <td bgcolor="#F7F8F9">&nbsp;</td>
                <td height="30" bgcolor="#F7F8F9" class="left_txt"><select name="user.node_id" id="node_id">
                															<option>--请选择--</option>
                														
                													    </select></td>
                <td height="30" bgcolor="#F7F8F9" class="left_txt">请选择配送点</td>
              </tr> 
              <tr>
                <td height="30" align="right" class="left_txt2"></td>
                <td>&nbsp;</td>
                <td height="30"><input type="button" value="提交" onclick="check()"/>
                <input type="reset" value="重置"/></td>
                <td height="30" class="left_txt">&nbsp;</td>
              </tr>
              </form>
              <tr>
                <td height="90" colspan="4" class="left_txt2"><table width="100%" height="99" border="0" cellpadding="0" cellspacing="0">
                </table></td>
              </tr>
              <tr>
                <td height="90" colspan="4" class="left_txt"><table width="100%" height="90" border="0" cellpadding="0" cellspacing="0">
                  
                </table></td>
                </tr>
            </table></td>
          </tr>
        </table>
          </td>
      </tr>
    </table></td>
    <td background="../admin/images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="middle" background="../admin/images/mail_leftbg.gif"><img src="../admin/images/buttom_left2.gif" width="17" height="17" /></td>
      <td height="17" valign="top" background="../admin/images/buttom_bgs.gif"><img src="../admin/images/buttom_bgs.gif" width="17" height="17" /></td>
    <td background="../admin/images/mail_rightbg.gif"><img src="../admin/images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>

</body>

</html>
