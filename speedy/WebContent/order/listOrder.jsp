<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%String path = request.getContextPath();
 %>
<script type="text/javascript" src="<%=path%>/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/admin/js/Calendar4.js"></script>
<title>网上下单</title>
<style type="text/css">
.STYLE1 {
	font-size: 12px
}

.STYLE3 {
	font-size: 12px;
	font-weight: bold;
}

.STYLE4 {
	color: #03515d;
	font-size: 12px;
}


table tr td {
	font-size: 12px;

	
}
.cla1 tr td{

background-color: "#FFFFFF";
width: 15%;
height: 20;
background-image: url("../quanxian/image/bg.gif");

}

#ajax tr th{
background-image: url("../quanxian/image/bg.gif");
background-color: "#FFFFFF";
height:20px;

}
#ajax tr td{

background-color: "#FFFFFF";
width: 15%;
height:20;
	font-size: 12px;


}


}
</style>

<link href="<%=path %>/admin/images/skin.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="17" height="29" valign="top"
				background="<%=path %>/admin/images/mail_leftbg.gif"><img
				src="<%=path %>/admin/images/left-top-right.gif" width="17" height="29" /></td>
			<td width="935" height="29" valign="top"
				background="<%=path %>/admin/images/content-bg.gif">
				<table width="100%" height="31" border="0" cellpadding="0"
					cellspacing="0" class="left_topbg" id="table2">
					<tr>
						<td height="31"><div class="titlebt">订单列表</div></td>
					</tr>
				</table>
			</td>

			<td width="16" valign="top"
				background="<%=path %>/admin/images/mail_rightbg.gif"><img
				src="<%=path %>/admin/images/nav-right-bg.gif" width="16" height="29" /></td>
		</tr>
		<tr>
			<td height="71" valign="middle"
				background="<%=path %>/admin/images/mail_leftbg.gif">&nbsp;</td>
			<td valign="top" bgcolor="#F7F8F9"><table width="100%"
					height="138" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="13" valign="top">&nbsp;</td>
					</tr>
					<tr>
						<td valign="top"><table width="98%" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr>
									<td class="left_txt">当前位置：订单列表</td>
								</tr>
								<tr>
									<td height="20"><table width="100%" height="1" border="0"
											cellpadding="0" cellspacing="0" bgcolor="#CCCCCC">
											<tr>
												<td></td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td><table id="tags" width="100%" height="55" border="0"
											cellpadding="0" cellspacing="0">
											<tr>
												<td width="10%" height="55" valign="middle"><img
													src="../admin/images/title.gif" width="54" height="55"></td>
												<td width="90%" valign="top"><span class="left_txt2">在这里管理员可以查看任何订单</span><br>
												</td>
											</tr>
												<tr align="center">
												
												<td colspan="2" width="100" valign="middle" align="center"><span style="font-size: 20px">${tag}</span><br>
												</td>
										</table></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td>
								
									<table width="100%" height="31" border="0"
											cellpadding="0" cellspacing="0" class="nowtable">
											<tr>
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td >
									<fieldset  style="width: 70%;margin-left: 15%" >
									<legend>条件查询</legend>
									 <form>
									 <table align="center"><tr><td>寄件人：<input type="text" size="15" id="sender"  name="sender"/></td><td>发货日期：<input type="text" size="15" name="senddate" id="senddate" onclick="MyCalendar.SetDate(this)"  /></td><td>收货地址：<input type="text"  name="address" id="address" size="15"/></td></tr>
                   <tr><td>收件人：<input  type="text" size="15"  id="accepeter" name="accepeter"/></td><td>接单日期：<input type="text" size="15" name="accepetdate" id="accepetdate" onclick="MyCalendar.SetDate(this)" /></td><td>订单状态：<select name="orderstate" id="orderstate"><option >请选择</option><option value="已发货" >已发货</option><option value="未发货">未发货</option><option value="已结单">已结单</option></select><input type="button" id="cbutton" value="查询"><input type="button" id="delbutton" value="删除"></td></tr>

</table>
</form>
									
									
									</fieldset>
									<br>
									<div id="showqueryorder" align="center" style="width: 71%;margin-left: 15%" >

                                  
                                    </div>
                                    <table class="cla1" style='border:1px; border-collapse:collapse;margin-left: 15%' width='71%'  border='1px'  >
									  <tr align="center"><td colspan='7'><a href='#' onclick="up()">上一页</a>&nbsp;&nbsp;<a href='#' onclick="down()">下一页</a>&nbsp;&nbsp;<span id="snowpage"></span>&nbsp;&nbsp;<span id="scountpage"></span> </td></tr>
									</table>
									</td>
									
								</tr>
							</table></td>
					</tr>
					<tr>
						<td height="50" colspan="4" class="left_txt2"><table
								width="100%" height="50" border="0" cellpadding="0"
								cellspacing="0">
							</table></td>
					</tr>
					<tr>
						<td height="50" colspan="4" class="left_txt"><table
								width="100%" height="50" border="0" cellpadding="0"
								cellspacing="0">

							</table></td>
					</tr>


				</table></td>
			<td background="<%=path%>/admin/images/mail_rightbg.gif">&nbsp;</td>
		</tr>
		<tr>
			<td valign="middle" background="<%=path%>/admin/images/mail_leftbg.gif"><img
				src="<%=path%>/admin/images/buttom_left2.gif" width="17" height="17" /></td>
			<td height="17" valign="top"
				background="<%=path%>/admin/images/buttom_bgs.gif"><img
				src="<%=path%>/admin/images/buttom_bgs.gif" width="17" height="17" /></td>
			<td  background="<%=path%>/admin/images/mail_rightbg.gif"><img
				src="<%=path%>/admin/images/buttom_right2.gif" width="16" height="17" /></td>
				
		</tr>
	</table>

</body>
<script type="text/javascript">
var pagenow=1;
var pagecount=0;
  function  check(){
	var list=  document.getElementsByName("delbox");
		for ( var i = 0; i < list.length; i++) {
			if(list[i].disabled==false){
			    list[i].checked=true;
			}
		}
	  
  }
  function  recheck(){
		var list=  document.getElementsByName("delbox");
			for ( var i = 0; i < list.length; i++) {
				 if(list[i].disabled!=true){
				    if( list[i].checked==true){
				    //	alert(list[i].checked);
				    	list[i].checked=false;
				    }else{
				    	list[i].checked=true;
				    }
				 }
			}
		  
	  }

	function showImage(inp) {
		//alert("qq");

		var eleName = inp.name;
		var imageId = eleName + "image";
		
		var image = document.getElementById(imageId);
	
		if (inp.value == null || inp.value == "") {

			image.style.display = "none";
		} else {
			image.style.display = "";
		}

	}
	
   //查询按钮
	$("#cbutton").click(
			
			function (){
			//	alert("check");
				sele1(1);
				
			}
			);
	window.onload=function (){sele1(1);};
	//删除按钮
	$("#delbutton").click(function(){
		var arr = new Array();
     // alert("删除");
		 var dellist=document.getElementsByName("delbox");
		  for ( var i = 0,j=0; i< dellist.length; i++) {
			var boxstate = dellist[i].checked;
			if(boxstate==true){
				//alert(dellist[i].value);
				arr[j]=dellist[i].value;
			//	alert(arr[j]);
				j++;
			}
			
		}
		 $.get("delOrders?delbox="+arr,function(){sele1(1);});
		
	});
	
	function  sele(){
		//  txt=$("input").val();
		  var sender =document.getElementById("sender").value;
		  var accepeter =document.getElementById("accepeter").value;
		  var accepetdate =document.getElementById("accepetdate").value;
		  var senddate =document.getElementById("senddate").value;
		  var address =document.getElementById("address").value;
		  var orderstate=document.getElementById("orderstate").value;
		  $("#showqueryorder").empty();
		  alert(orderstate);
		  var html="<table id='ajax' style='border:1px; border-collapse:collapse' width='100%'  border='1px'  align='center' ><tr  align='center'  style='background-color:#f2f2f2;'><th><a  href='#' onclick='check()'>全选</a><a onclick='recheck()' href='#'>/反选</a></th><th>编号</th><th>寄件人</th><th>收件人</th><th>发货时间</th><th>订单状态</th><th>订单操作</th><tr>";
		  var  html2=html+"<tr><td colspan='7' >没有匹配订单</td></tr>";
		  $("#showqueryorder").append(html2);
		  $.post("checkOrderbyFields",{'order.sender':sender,'order.accepeter':accepeter,'order.senddate':senddate,'order.address':address,'order.accepetdate':accepetdate,'orderstate':orderstate},function(result){
			
			  $("#showqueryorder").empty();
			  if(result==null||result==""){
				  html+="<tr><td colspan='7' >没有匹配订单</td></tr>";
			   
		   }else{
			  
				 for(var i=0;i<result.length;i++)
				 {
					 //日期的转换
					var newSenddate=result[i].order.senddate+"";
			
				//	newSenddate.indexOf("T");
					newSenddate=newSenddate.substring(0,newSenddate.indexOf("T"));
					
					 html+="<tr  align='center'><td><input type='checkbox' class='cla1'  name='delbox' id='"+result[i].order.id+"' value='"+result[i].order.id+"' class='delbox'></td><td >"+result[i].order.id+"</td><td>"+result[i].order.sender+"</td><td>"+result[i].order.accepeter+"</td><td>"+newSenddate+"</td><td>"+result[i].state+"</td>";
					 if(result[i].state=="已结单"){
						 var c= document.getElementById(result[i].order.id);
							c.disabled="disabled";
						 html+="<td>无法操作</td><tr>";
					 }else if(result[i].state=="已发货"){
						var c= document.getElementById(result[i].order.id);
						c.disabled="disabled";
						 html+="<td ><a href='Intoupdatejsp?order.id="+result[i].order.id+"'>修改</a></td><tr>";
						 
					 }else{
						 
						 html+="<td><a href='Intoupdatejsp?order.id="+result[i].order.id+"'>修改</a></td><tr>";
						 
					 }
					 
				 }
			
		   }
			  html+="</table>";
			  $("#showqueryorder").append(html);
		  });
		}
	
	
	function  sele1(a){
		//  txt=$("input").val();
		
		  var sender =document.getElementById("sender").value;
		  var accepeter =document.getElementById("accepeter").value;
		  var accepetdate =document.getElementById("accepetdate").value;
		  var senddate =document.getElementById("senddate").value;
		  var address =document.getElementById("address").value;
		  var orderstate=document.getElementById("orderstate").value;
		 // alert(orderstate);
		  $("#showqueryorder").empty();
		  $("#snowpage").empty();
		  $("#scountpage").empty();
		  var  tab=document.getElementById("tags");
		
		  var html="<table id='ajax' border='1' cellpadding='0' cellspacing='0'  style='border-collapse:collapse' width='100%'    align='center' ><tr  align='center'  style='background-color:#f2f2f2;'><th><a  href='#' onclick='check()'>全选</a><a onclick='recheck()' href='#'>/反选</a></th><th>编号</th><th>寄件人</th><th>收件人</th><th>发货时间</th><th>订单状态</th><th>订单操作</th><tr>";
		  var  html2=html+"<tr><td colspan='7' >没有匹配订单</td></tr>";
		  $("#showqueryorder").append(html2);
		  $.post("checkOrderbyFields",{'order.sender':sender,'order.accepeter':accepeter,'order.senddate':senddate,'order.address':address,'order.accepetdate':accepetdate,'orderstate':orderstate},function(result){
			
			  $("#snowpage").empty();
			  $("#scountpage").empty();
			  $("#showqueryorder").empty();
			  if(result==null||result==""){
				  pagecount=0;
				  a=0;
				  html+="<tr><td colspan='7' >没有匹配订单</td></tr>";
				  
			   
		   }else{
			   
			   pagecount=getPageCount(result.length);
			   var  begin=5*(a-1);
		
			   var length=begin+5;
			   if(begin+5>result.length){
				   length=result.length;
			   }
				 for(var i=begin;i<length;i++)
				 {
				
					var newSenddate=result[i].order.senddate+"";
			 
					newSenddate=newSenddate.substring(0,newSenddate.indexOf("T"));
					
					
					 if(result[i].state=="已结单"){
						
						 html+="<tr  align='center'><td><input type='checkbox' disabled='disabled'  id='c"+result[i].order.id+"' name='delbox' value='"+result[i].order.id+"' class='delbox'></td><td >"+result[i].order.id+"</td><td>"+result[i].order.sender+"</td><td>"+result[i].order.accepeter+"</td><td>"+newSenddate+"</td><td>"+result[i].state+"</td>";
						
						 html+="<td>无法操作</td><tr>";
					 }else if(result[i].state=="已发货"){
						 html+="<tr  align='center'><td><input type='checkbox' disabled='disabled'  id='c"+result[i].order.id+"' name='delbox' value='"+result[i].order.id+"' class='delbox'></td><td >"+result[i].order.id+"</td><td>"+result[i].order.sender+"</td><td>"+result[i].order.accepeter+"</td><td>"+newSenddate+"</td><td>"+result[i].state+"</td>";
							
						 html+="<td><a href='Intoupdatejsp?order.id="+result[i].order.id+"' >修改</a></td><tr>";
						 
					 }else{
						 html+="<tr  align='center'><td ><input type='checkbox'   id='c"+result[i].order.id+"' name='delbox' value='"+result[i].order.id+"' class='delbox'></td><td >"+result[i].order.id+"</td><td>"+result[i].order.sender+"</td><td>"+result[i].order.accepeter+"</td><td>"+newSenddate+"</td><td>"+result[i].state+"</td>";
						 html+="<td><a href='Intoupdatejsp?order.id="+result[i].order.id+"'>修改</a></td><tr>";
					 }
					 
				 }
			
		   }
			  html+="</table>";
			  $("#showqueryorder").append(html);
			  $("#snowpage").append("当前页："+a);
			   $("#scountpage").append("总页数:"+pagecount);
		  });
		}
	   
	    
	    
	    
       //得到总页数 
        function  getPageCount(count){
        	if(count%5==0){
        		return parseInt(count/5);
        		
        	}else{
        		var b=parseInt(count/5)+1;
        		return b;
        	
        	}
       
        }	
      
     //上一页(a=0,b=5(0,1,2,3,4))
      function up(){
    	if(pagenow==1){
    		alert("已经到第一页");
    	}else{
    		pagenow--;
    	 sele1(pagenow);
    	}
     } 
     
     //下一页
      function down(){
      	if(pagenow==pagecount){
      		alert("已经到最后页");
      	}else{
      		pagenow++;
      	  sele1(pagenow);
      	}
       } 
     
     
</script>
</html>