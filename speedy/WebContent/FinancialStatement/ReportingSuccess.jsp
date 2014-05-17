<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
   background-color:#f2f2f2;
}

</style>
</head>
<body>
<h1 style="text-align: center;padding-top:30px">总公司收入报表管理 </h1>
<p style="text-align: center">
    请选择要查询报表的报表号：<input type="text" name="report_id"> &nsbp;&nsbp;<input type="submit" value="查询"><br><br>
    <table>
    <tr>
    <th>报表ID</th>
    <th>报表时间</th>
    <th>报表生成时间</th>
    <th>配送点名称</th>
    <th>货物总重量</th>
    <th>货物总体积</th>
    <th>配送总收入</th>
    </tr>
    <s:iterator value="companyreportform" var="x">

      <tr>
            
        <td height="20" bgcolor="#FFFFFF" ><div align="center">${x.id}</div></td>
        <td height="20" bgcolor="#FFFFFF" ><div align="center">${x.formdate}</div></td>
        <td height="20" bgcolor="#FFFFFF" ><div align="center">${x.formbirthdate}</div></td>
        <td height="20" bgcolor="#FFFFFF" ><div align="center">${x.node_name}</div></td>
        <td height="20" bgcolor="#FFFFFF" ><div align="center">${x.totalweight}</div></td>
        <td height="20" bgcolor="#FFFFFF" ><div align="center">${x.totalvolume}</div></td>
        <td height="20" bgcolor="#FFFFFF" ><div align="center">${x.totalincome}</div></td>
      </tr>
 </s:iterator>
    
    
    </table>
    报表生成日期:2011年10月10日15:01:30
</p>
<div style="text-align: right"><input type="submit" value="把报表导入Excel表格" id="reportExcel"></div>

</body>
</html>