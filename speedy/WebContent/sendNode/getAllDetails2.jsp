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
<title>无标题文档</title>
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
			location.href="sendNode_getAllDetails?curPage="+totalPage;
			
		}else
			location.href="sendNode_getAllDetails?curPage="+page;
			
	}

	function gotoPage2(totalPage){
	var page=${totalPage};
	
	if(totalPage<=0){
		totalPage=1;
	}
	if(totalPage>page){
			totalPage=page;
	}
			
			location.href="sendNode_getAllDetails?curPage="+totalPage;

	}
	
	function goCheck(totalPage){
	
		var go=document.getElementById("desPage").value;
		var str=/^\d+$/;
		if(!str.test(go)){	
			document.getElementById("desPage").value="";
		}else{
			gotoPage(totalPage);	
		}
	}
	
	
	
	
</script>

</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="<%=path %>/sendNode/images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="<%=path %>/sendNode/images/tab_03.gif" width="12" height="30" /></td>
        <td>
        	<table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="<%=path %>/sendNode/images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[配送点管理]-[配送点修改]</td>
              </tr>
            </table>
      				 

          </tr>
     		</table>
   		  </td>
        <td width="16"><img src="<%=path %>/sendNode/images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="<%=path %>/sendNode/images/tab_12.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            
      
            <td width="3%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">序号</span></div></td>
            <td width="5%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">配送点id</span></div></td>
            <td width="8%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">配送点名</span></div></td>
            <td width="8%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">内部价格</span></div></td>
            <td width="5%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">用户id</span></div></td>
            <td width="8%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">负责人名</span></div></td>
            <td width="8%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">用户密码</span></div></td>
            <td width="8%" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">上行站点</span></div></td>
            <td width="8%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">下行站点</span></div></td>
            <td width="8%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">站点类型</span></div></td>
            <td width="8%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">员工人数</span></div></td>
             <td width="10%" height="22" background="<%=path %>/sendNode/images/bg.gif" bgcolor="#FFFFFF" class="STYLE1"><div align="center">基本操作</div></td>
    
             
          </tr>
<s:iterator value="sendNodeList" var="x" status="index"> 
          <tr>
           
            <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <div align="center"><s:property value="#index.index+1"/></div>
            </div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${x.id }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${x.nodename }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${x.innerprice }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${x.user_id }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${x.username } </span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${x.password }</span></div></td>
            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${x.forwordnode }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${x.nextnode }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${x.nodetype }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">${x.empcount }</span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE4"><img src="<%=path %>/sendNode/images/edt.gif" width="16" height="16" /><a href="sendNode_readyUpdate?id=${x.id }">编辑</a>&nbsp; &nbsp;</span></div></td>
          </tr>         
 </s:iterator>       
          
          

       
        </table></td>
        
            <td width="8" background="<%=path %>/sendNode/images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  
  
  
  
   <tr>
    <td height="35" background="<%=path %>/sendNode/images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="<%=path %>/sendNode/images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp;共有 <strong>${totalRecord}</strong> 条记录，当前第 <strong> ${curPage}</strong> /<strong >${totalPage}</strong>页</td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="40"><a href="javascript:gotoPage2(1)"><img src="<%=path %>/sendNode/images/first.gif" width="37" height="15" border="0"/></a></td>
                  <td width="45"><a href="javascript:gotoPage2(${curPage}-1)"><img src="<%=path %>/sendNode/images/back.gif" width="43" height="15" border="0"/></a></td>
                  <td width="45"><a href="javascript:gotoPage2(${curPage}+1)"><img src="<%=path %>/sendNode/images/next.gif" width="43" height="15" border="0"/></a></td>
                  <td width="40"><a href="javascript:gotoPage2(${totalPage})"><img src="<%=path %>/sendNode/images/last.gif" width="37" height="15" border="0"/></a></td>
                  <td width="100"><div align="center"><span class="STYLE1">转到第
                    <input name="textfield" id="desPage" type="text" size="4"  style="height:12px; width:20px; border:1px solid #999999;" /> 
                    页 </span></div></td>
 					<td width="35">
 <img src="<%=path%>/sendNode/image/go.gif" width="26" height="15" border="0" onclick="goCheck(${totalPage})"/></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="<%=path %>/sendNode/images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
  
  
</table>
</body>
</html>
