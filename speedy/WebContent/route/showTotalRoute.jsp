<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
<!--
a:link {color: blue; } 
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

function query()
{
	 var queryType = document.getElementById("queryType");
	 var queryIndex = queryType.selectedIndex;
	 var queryValue = document.getElementById("queryValue").value;
	 if(queryIndex==0)
	 {
		 location.href="TotalRouteAction_query";
	 }
	 if(queryIndex == 1)
     {
		 location.href="TotalRouteAction_queryById?id="+queryValue;
     } 
	 if(queryIndex == 2)
	 {
		 location.href = "TotalRouteAction_queryByNum?totalRouteNum="+queryValue; 
	 }
	 if(queryIndex == 3)
	 {
		 location.href = "TotalRouteAction_queryByName?totalRouteName="+queryValue; 
	 }
}
function deletes()
{
	if (confirm("确认删除")) 
	{
		var x=document.getElementsByName("checkbox");
	    var s;
	    for (var i=0;i<x.length;i++)
	    {
	    	if(x[i].checked)
	    	{ 
	             s = x[i].value + ",";
	             alert(s);
	             location.href="TotalRouteAction_delete?ids="+s;
	    	}
	    }
	}    
}

function fun1(){
	var checkall = document.getElementById("checkall");
	var checkbox = document.getElementsByName("checkbox");
    for(var i=0; i<checkbox.length; i++)
	{
			 checkbox[i].checked=checkall.checked;
    }
}
</script>
</head>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0"  >
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="../route/images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="../route/images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：德邦物流线路管理中心</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center">
                      <input type="checkbox" name="checkbox62" value="checkbox" id="checkall" onclick="fun1()"/>
                    </div></td>
                    <td class="STYLE1"><div align="center">全选</div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"></div></td>
                    <td class="STYLE1"><div align="center"><img src="../route/images/22.gif" width="10" height="14" /><a href="RouteAction_queryAllRoutename">新增</a></div></td>
                  </tr>
                </table></td>
                      <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><img src="../route/images/11.gif" width="10" height="14" /></div></td>
                    <td class="STYLE1"><div align="center"><a id="delete" onclick="deletes()">删除</a></div></td>
                  </tr>
                </table></td>
            </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="../route/images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="../route/images/tab_12.gif">&nbsp;</td>
        <td>
        <table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="3%" height="22" background="images/bg.gif" bgcolor="#FFFFFF"><div align="center">
              <input type="checkbox" name="checkbox1" value="checkbox" />
            </div></td>
            <td width="10%" height="22" background="../route/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">序号</span></div></td>
            <td width="10%" height="22" background="../route/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">总线路id</span></div></td>
            <td width="10%" height="22" background="../route/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">总线路号</span></div></td>
            <td width="20%" height="22" background="../route/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">线路名称</span></div></td>
            <td width="10%" height="22" background="../route/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">线路起始地</span></div></td>
            <td width="10%" height="22" background="../route/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">线路目的地</span></div></td>
            <td width="10%" height="22" background="../route/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">线路路经地</span></div></td>
            <td style="display:none"   width="10%" height="22" background="../route/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">线路表id</span></div></td>
            <td width="10%" height="22" background="../route/images/bg.gif" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1">操作</span></div></td>
          </tr>
        <s:iterator value="totalRouteList" var="totalroute" status="index"> 
          <tr>
            <td height="20" bgcolor="#FFFFFF"><div align="center">
              <input type="checkbox" name="checkbox" onclick="getcheck()" value="${totalroute.id}" />
            </div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center" class="STYLE1">
              <div align="center">
               <span><s:property value="#index.index+1"/></span>
              </div>
            </div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1" id="s"><s:property value="#totalroute.id"/></span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1" id="s"><s:property value="#totalroute.routenum"/></span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><s:property value="#totalroute.route.routename"/></span></div></td>
            <td bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><s:property value="#totalroute.startnode"/></span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><s:property value="#totalroute.endpoint"/></span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1" id="s"><s:property value="#totalroute.acrossnoade"/></span></div></td>
            <td style="display:none" height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE1" id="s"><s:property value="#totalroute.route.id"/></span></div></td>
            <td height="20" bgcolor="#FFFFFF"><div align="center"><span class="STYLE4"><a href="../route/totalUpdate.jsp?totalrouteid=${totalroute.id}&totalRoute_routename=${totalroute.route.routename}&totalroutenum=${totalroute.routenum}&totalroute_routeid=${route.routefrom}&totalroutestartnode=${totalroute.startnode}&totalrouteendpoint=${totalroute.endpoint}&totalrouteacrossnoade=${totalroute.acrossnoade}">编辑</a>&nbsp; &nbsp;</span></div></td>
          </tr>
</s:iterator>
        </table></td>
        <td width="8" background="../route/images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="../route/images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="../route/images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp;共有 ${totalRouteList.size()}条记录，当前第 1/1 页</td>
            <td></td>
          </tr>
        </table></td>
        <td width="16"><img src="../route/images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
   <tr height="30">
       <td background="../route/images/tab_19.gif"><table>
       <tr><td>请输入查询</td><td><input type="text" id="queryValue"></td>
       <td><select id="queryType">
              <option>
                     --  请选择查询方式    --
              </option>
              <option>
                                                              总线路id
              </option>
              <option>
                                                              总线路编号  
              </option>
              <option>
                                                                线路名称   
              </option>
       </select></td>
       <td><input type="button" onclick="query()" value="查询" style="font-weight: bold;"></td>
       </tr>
       </table>
       </td>
  </tr>
</table>

</body>
</html>