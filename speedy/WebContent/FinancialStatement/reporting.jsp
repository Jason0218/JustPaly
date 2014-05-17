<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%String path = request.getContextPath(); %>
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
<form action="<%=path%>/reporting/reporting_selectAllreport" method="post">
<h1 style="text-align: center;padding-top:30px"> 生成总报表 </h1>
<p style="text-align: center">
请选择年份<select id="year">
          <option>未选择</option>
          <option>2014</option>
          <option>2013</option>
          <option>2012</option>
          <option>2011</option>
          <option>2010</option>
          <option>2009</option>
          <option>2008</option>
          <option>2007</option>
          <option>2006</option>
          <option>2005</option>
          <option>2004</option>
          <option>2003</option>
          <option>2002</option>
          <option>2001</option>
          <option>2000</option>
          <option>1999</option>
          <option>1998</option>
          <option>1997</option>
          <option>1996</option>
          </select>&nbsp;
请选择季度<select id="quarter">
          <option>未选择</option>
          <option>一季度</option>
          <option>二季度</option>
          <option>三季度</option>
          <option>四季度</option>
</select>&nbsp;
请选择月份<select id="month">
          <option>未选择</option>
          <option>1</option>
          <option>2</option>
          <option>3</option>
          <option>4</option>
          <option>5</option>
          <option>6</option>
          <option>7</option>
          <option>8</option>
          <option>9</option>
          <option>10</option>
          <option>11</option>
          <option>12</option>
</select>&nbsp;
<input type="submit" value="生成报表" name="reportGeneration">
</p>
</form>
</body>
</html>