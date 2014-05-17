<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">

body{
background-color: white;
}
table{

}
table tr td{

font-size: 12px;
border-color: green;
}
table tr th{
background-image: url("../quanxian/image/bg.gif");
background-color: "#FFFFFF";
height:20px;
font-size: 12px;


}
table tr{
border-color: green;

}
</style>

<script type="text/javascript" src="../admin/js/jquery.min.js"></script>
<script type="text/javascript">
//alert("asdad1");

$(document).ready(function(){
	  $("#querySub").click(function(){
		  var data=$("#ordernumbers").val();
		// al
		$("#showqueryorder").empty();
		 $.get("queryorder?ordernumbers="+data,function(redata){
		
		   
		     var html="<table id='ajax' style=' border-collapse:collapse' width='100%'  border='2px'   align='center' ><tr  align='center'  style='background-color:#f2f2f2;'><th>编号</th><th>寄件人</th><th>收件人</th><th>总费用</th><th>货物数量</th><th>发货时间</th><tr>";
			 for(var i=0;i<redata.length;i++)
			 {
				 
					var newSenddate=redata[i].senddate+"";
			           //  alert(newSenddate);
				//	newSenddate.indexOf("T");
					newSenddate=newSenddate.substring(0,newSenddate.indexOf("T"));
				 html+="<tr   align='center'><td >"+redata[i].id+"</td><td  >"+redata[i].sender+"</td><td>"+redata[i].accepeter+"</td><td>"+redata[i].totalprice+"</td><td>"+redata[i].goodsamount+"</td><td>"+newSenddate+"</td><tr>";
				 
			 }
			 html+="</table>";
			
			 $("#showqueryorder").append(html);
			 
			 
		 },"json");
	  });
	  
	  
	});

 

</script>
<title>订单号查询订单信息</title>
</head>
<body>
	<form action="queryorder">
		<table align="center" >
			<tr >
				<th align="center">请输入您要查询订单号</th>
			</tr>
			<tr>
				<td></td>
			</tr>
			<tr>
				<td  align="center"><textarea cols="20" rows="4" id="ordernumbers" name="ordernumbers"></textarea></td>
			</tr>
			<tr>
				<td align="center"><span style="font-size: 12px; color: red">注:批量查询中间请以逗号隔开</span></td>
			</tr>
			<tr>
				<td  ></td>
			</tr>
			<tr>
				<td align="center"><input type="button" id="querySub" value="查询"></td>
			</tr>


		</table>
</form>
<div id="showqueryorder" align="center" style="width: 45%;margin-left: 27%" >




</div>
</body>

</html>