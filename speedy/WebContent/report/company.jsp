<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<script type="text/javascript">
	window.onload = function() {
		var pro_city = [ {
			pro : '1',
			cities : [ '01', '02', '03' ]
		}, {
			pro : '2',
			cities : [ '04', '05', '06' ]
		}, {
			pro : '3',
			cities : [ '07', '08', '09' ]
		}, {
			pro : '4',
			cities : [ '10', '11', '12' ]
		}]
		var proSel = document.getElementById("sid");
		var citySel = document.getElementById("mid");
		proSel.onchange = function() {
			var selectedPro = proSel.options[proSel.selectedIndex].text;
			if (proSel.selectedIndex == 0) {
				citySel.length = 1;
			}
			for ( var i = 0; i < pro_city.length; i++) {
				if (selectedPro == pro_city[i].pro) {
					citySel.length = 1;
					for ( var j = 0; j < pro_city[i].cities.length; j++) {
						var op = document.createElement("option");
						op.text = pro_city[i].cities[j];
						citySel.add(op);
					}
				}
			}
		}
	}
	</script>
</head>


<body>





	<form action="report/companyformshow">
<h1 style="text-align: center;padding-top:30px"> 生成总报表 </h1>
<p style="text-align: center">
        
		请选择年份：<select name="year" id="yid">
			<option>请选择</option>
			<option value="2014">2014</option>
			<option value="2013">2013</option>
			<option value="2012">2012</option>
			<option value="2011">2011</option>
			<option value="2010">2010</option>
			<option value="2009">2009</option>
			<option value="2008">2008</option>
			<option value="2007">2007</option>
			<option value="2006">2006</option>
			<option value="2005">2005</option>
			<option value="2004">2004</option>
		</select>年&nbsp; 请选择季度：<select name="season" id="sid">
			<option>请选择</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
		</select>季度&nbsp;请选择月份：<select name="month" id="mid">
			<option>请选择</option>

		</select>月&nbsp; <input type="submit" value="生成" />
</p>
	</form>
















































</body>
</html>