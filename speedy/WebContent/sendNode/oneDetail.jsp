<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>配送点详细信息</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE3 {font-size: 12px; font-weight: bold; }
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
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=highlightcolor;
}
}

function  changeback(){
if  (event.fromElement.contains(event.toElement)||source.contains(event.toElement)||source.id=="nc")
return
if  (event.toElement!=source&&cs[1].style.backgroundColor!=clickcolor)
//source.style.backgroundColor=originalcolor
for(i=0;i<cs.length;i++){
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
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor=clickcolor;
}
else
for(i=0;i<cs.length;i++){
	cs[i].style.backgroundColor="";
}
}

//页面的跳转
	function gotoPage(totalPage){
	var page=document.getElementById("desPage").value;
		if(page>totalPage){
			location.href="sendNode_getAll?curPage="+totalPage;
			alert(totalpage);
		}else
			location.href="sendNode_getAll?curPage="+page;
			alert(page);
	}

	function gotoPage2(totalPage){
	var page=${totalPage};
	
	if(totalPage<=0){
		totalPage=1;
	}
	if(totalPage>page){
			totalPage=page;
	}
			
			location.href="sendNode_getAll?curPage="+totalPage;

	}
	
	function f1(){
		
	}
	
	
	
</script>

</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="<%=path %>/sendNode/images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="<%=path %>images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="<%=path %>/sendNode/images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[配送点管理]-[配送点的详细信息]</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center">
                      <input type="checkbox" name="checkbox62" value="checkbox" onselect="f1()"/>
                    </div></td>
                    <td class="STYLE1"><div align="center">全选</div></td>
                  </tr>
                </table></td>
             
             
                <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="<%=path %>/sendNode/images/11.gif" width="14" height="14" /></div></td>
                    <td class="STYLE1"><div align="center">删除</div></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="<%=path %>/sendNode/images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
          
            

            <td width="8%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">配送点id</span></div></td>
            <td width="10%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">配送点名</span></div></td>
            <td width="10%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">内部配送价格</span></div></td>
            <td width="8%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">负责人id</span></div></td>
            <td width="10%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">负责人名</span></div></td>
            <td width="10%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">负责人密码</span></div></td>
            <td width="10%" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">上行站点</span></div></td>
            <td width="10%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">下行站点</span></div></td>
            <td width="10%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">站点类型</span></div></td>
            <td width="10%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">员工人数</div></td>
          </tr>
          
      <tr>
       
         <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${sendNode.id }</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE6"><div align="center"><span class="STYLE19">${sendNode.nodename }</span></div></td>
         <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${sendNode.innerprice }</div></td>
          <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${sendNode.user_id }</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${sendNode.username }</div></td>
         <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${sendNode.password }</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${sendNode.forwordnode }</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${sendNode.nextnode }</div></td>
        <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${sendNode.nodetype }</div></td>
         <td height="20" bgcolor="#FFFFFF" class="STYLE19"><div align="center">${sendNode.empcount }</div></td>   
      </tr>      
          
          

       
        </table></td>
        <td width="8" background="<%=path %>/sendNode/images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  
  
  
  

 


  
  
</table>
</body>
</html>
