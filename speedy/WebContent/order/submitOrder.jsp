<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String path = request.getContextPath();
%>
<script type="text/javascript" src="<%=path%>/admin/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path%>/admin/js/Calendar4.js"></script>
<title>网上下单</title>
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
.f1 {
	font-size: 15px;
}

table tr td {
	font-size: 12px;
}
</style>

<link href="<%=path%>/admin/images/skin.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<table width="100%" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td width="17" height="29" valign="top"
				background="<%=path%>/admin/images/mail_leftbg.gif"><img
				src="<%=path%>/admin/images/left-top-right.gif" width="17"
				height="29" /></td>
			<td width="935" height="29" valign="top"
				background="<%=path%>/admin/images/content-bg.gif">
				<table width="100%" height="31" border="0" cellpadding="0"
					cellspacing="0" class="left_topbg" id="table2">
					<tr>
						<td height="31"><div class="titlebt">网上订单</div></td>
					</tr>
				</table>
			</td>

			<td width="16" valign="top"
				background="<%=path%>/admin/images/mail_rightbg.gif"><img
				src="<%=path%>/admin/images/nav-right-bg.gif" width="16" height="29" /></td>
		</tr>
		<tr>
			<td height="71" valign="middle"
				background="<%=path%>/admin/images/mail_leftbg.gif">&nbsp;</td>
			<td valign="top" bgcolor="#F7F8F9"><table width="100%"
					height="138" border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td height="13" valign="top">&nbsp;</td>
					</tr>
					<tr>
						<td valign="top"><table width="98%" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr>
									<td class="left_txt">当前位置：网上下单</td>
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
									<td><table width="100%" height="55" border="0"
											cellpadding="0" cellspacing="0">
											<tr>
												<td width="10%" height="55" valign="middle"><img
													src="../admin/images/title.gif" width="54" height="55"></td>
												<td width="90%" valign="top"><span class="left_txt2">在这里，您可以快速的提交订单</span><br>
												</td>

											</tr>
											<tr align="center">

												<td colspan="2" width="100" valign="middle" align="center"><span
													style="font-size: 20px">${tag }</span><br></td>

											</tr>
										</table></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
								</tr>
								<tr>
									<td><table width="100%" height="31" border="0"
											cellpadding="0" cellspacing="0" class="nowtable">
											<tr>
												<td class="left_bt2">&nbsp;&nbsp;&nbsp;&nbsp;</td>
											</tr>
										</table></td>
								</tr>
								<tr>
									<td>
										<form name="form1" method="POST" action="sub">
											<table width="100%" border="1"
												style='border-collapse: collapse;'>


												<tr>
													<td class="f1" colspan="3">寄件人资料:</td>
													<td class="f1" colspan="3">收件人资料:</td>
												</tr>
												<tr>
													<td align="right">姓名<font color="red">*</font>：
													</td>
													<td colspan="2"><input type="text"
														onblur="showImage(this)" name="order.sender"  id="order.sender"/>&nbsp;&nbsp;<img
														id="order.senderimage" style="display: none"
														src="<%=path%>/order/images/start.gif" />
														<span id="order.senderK" style="display: none;font-size: 12px;color: red">请填写寄件人姓名</span>
														
														</td>

													<td align="right">姓名<font color="red">*</font>：
													</td>
													<td colspan="2"><input type="text"
														name="order.accepeter" id="order.accepeter" onblur="showImage(this)" />&nbsp;&nbsp;<img
														id="order.accepeterimage" style="display: none"
														src="<%=path%>/order/images/start.gif" />
														<span id="order.accepeterK" style="display: none;font-size: 12px;color: red">请填写收件人姓名</span>
														</td>

												</tr>
												<tr>
													<td align="right">联系电话<font color="red">*</font>：
													</td>
													<td colspan="2"><input type="text"
														onblur="showImage2(this)" name="user_idtel" id="user_idtel"/>&nbsp;&nbsp;<img
														id="user_idtelimage" style="display: none"
														src="images/start.gif" />
														<span id="user_idtelK" style="display: none;font-size: 12px;color: red">请正确填写电话（11位）</span>
														</td>

													<td align="right">联系电话<font color="red">*</font>：
													</td>
													<td colspan="2"><input type="text"
														onblur="showImage2(this)" name="order.accepterphonenum" />&nbsp;&nbsp;<img
														id="order.accepterphonenumimage" style="display: none"
														src="<%=path%>/order/images/start.gif" />
															<span id="order.accepterphonenumK" style="display: none;font-size: 12px;color: red">请正确填写电话（11位）</span>
														</td>

												</tr>
												<tr>
													<td align="right">发货地址<font color="red">*</font>：
													</td>
													<td colspan="2"><input type="text"
														onblur="showImage(this)" name="user_idAddress"  />&nbsp;&nbsp;<img
														id="user_idAddressimage" style="display: none"
														src="images/start.gif" />
															<span id="user_idAddressK" style="display: none;font-size: 12px;color: red">请填写发货</span>
														</td>

													<td align="right">收货地址<font color="red">*</font>：
													</td>
													<td><input type="text" onblur="showImage(this)"
														name="order.Address" id="order.Address" />&nbsp;&nbsp;<img
														id="order.Addressimage"  style="display: none"
														src="images/start.gif" />
															<span id="order.AddressK" style="display: none;font-size: 12px;color: red">请填收货地址</span>
														
														</td>
													<td>收货站点:<select name="order.destn" id="shzd"><option value="请选择">-请选择-</option></select>&nbsp;&nbsp;<img
														id="order.Addressimage" style="display: none"
														src="images/start.gif" /></td>

												</tr>
												<tr>
													<td align="right">电子邮箱：</td>
													<td colspan="2"><input type="text" onblur="checkemail(this)"  name="sender.email"/>
                                                     <span style="display: none;font-size: 12px;color: red" id="sender.emailE">邮箱格式不正确</span>  </td> 
													<td align="right">电子邮箱：</td>
													<td colspan="2"><input type="text" name="order.email"  onblur="checkemail(this)"/>
                                                      <span style="display: none;font-size: 12px;color: red" id="order.emailE"  >邮箱格式不正确</span> </td>
												</tr>
												<tr>
													<td align="right">发送日期：</td>
													<td colspan="2"><input type="text"
														name="order.senddate" id="time1"
														onclick="MyCalendar.SetDate(this)" value="2010-8-1" /></td>
													<td align="right">货物类别：</td>
													<td colspan="2"><select id="hwlb"
														name="order.good.typeId">
															<option value="请选择">-请选择-</option>
															<option>
													</select></td>

												</tr>
												<tr>
													<td align="right">货物重量<font color="red">*</font>：
													</td>
													<td colspan="2"><input type="text"
														onblur="showImage1(this)" name="order.good.weight" />单位(kg)&nbsp;&nbsp;<img
														id="order.good.weightimage" style="display: none"
														src="images/start.gif" /></td>
													<td align="right">货物体积：</td>
													<td colspan="2"><input onblur="showImage1(this)" type="text"
														name="order.good.volume"  />单位(立方米)
															<img id="order.good.volumeimage" style="display: none" src="images/start.gif" /></td>

												</tr>
												<tr>
													<td align="right">货物名称<font color="red">*</font>：
													</td>
													<td colspan="2"><input type="text"
														onblur="showImage(this)" name="order.good.goodsName" />&nbsp;&nbsp;<img
														id="order.good.goodsNameimage" style="display: none"
														src="images/start.gif" />
														 <span style="display: none;font-size: 12px;color: red" id="order.good.goodsNameK"  >请填写货物名称</span>
														
														</td>
													<td align="right">货物数量<font color="red">*</font>：
													</td>
													<td colspan="2"><input type="text" value="1"
														onblur="showImage1(this)" name="order.Goodsamount" />单位(件)&nbsp;&nbsp;<img
														id="order.Goodsamountimage" style="display: none"
														src="images/start.gif" /></td>

												</tr>
												<tr>
													<td colspan="6">货物描述:<br />
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<textarea
															cols="20" rows="2"></textarea></td>

												</tr>
												<tr>
													<td colspan="6">费用计算:单位(元)</td>
												</tr>
												<tr>
													<td align="right">保价<font color="red">*</font>：
													</td>
													<td colspan="2"><input type="text" value="0"
														onblur="showImage1(this)" id="order.Proteprice" name="order.Proteprice">,若不保价，默认为0&nbsp;&nbsp;<img
														id="order.Protepriceimage" style="display: none"
														src="images/start.gif" /></td>

													<td align="right">配送价格<font color="red">*</font>:
													</td>
													<td colspan="2"><input type="text" value="0"
														onblur="showImage1(this)" id="order.Mateprice" name="order.Mateprice">&nbsp;&nbsp;<img
														id="order.Matepriceimage" style="display: none"
														src="images/start.gif" /></td>

												</tr>
												<tr>
													<td align="right">派送价格<font color="red">*</font>：
													</td>
													<td colspan="2"><input type="text"
														onblur="showImage1(this)" id="order.Sendprice"  value="0" name="order.Sendprice">&nbsp;&nbsp;<img
														id="order.Sendpriceimage" style="display: none"
														src="images/start.gif" /></td>

													<td align="right">总价格<font color="red">*</font>：
													</td>
													<td colspan="2"><input type="text" onclick="addmoney(this)"
														onblur="showImage1(this)"  value="0"  readonly="readonly" style="background-color: silver" name="order.totalprice">&nbsp;&nbsp;<img
														id="order.totalpriceimage" style="display: none"
														src="images/start.gif" /></td>

												</tr>
												<tr>
													<td colspan="6">备注：带<font color="red">*</font>为必填,保价费用由客户自己填写，客户需要缴纳相应的保价金,保价金为保价的10%
													</td>

												</tr>
												<tr>
													<td colspan="6" align="center"><input type="reset"
														value="清空" class="button1" />&nbsp;&nbsp;&nbsp;&nbsp; <input
														type="submit" value="确定" onclick="return checkform()"
														class="button1" />&nbsp;&nbsp;&nbsp;&nbsp;
														</td>
												</tr>
											</table>
										</form>
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
			<td background="../admin/images/mail_rightbg.gif">&nbsp;</td>
		</tr>
		<tr>
			<td valign="middle" background="../admin/images/mail_leftbg.gif"><img
				src="images/buttom_left2.gif" width="17" height="17" /></td>
			<td height="17" valign="top"
				background="../admin/images/buttom_bgs.gif"><img
				src="../admin/images/buttom_bgs.gif" width="17" height="17" /></td>
			<td background="../admin/images/mail_rightbg.gif"><img
				src="../admin/images/buttom_right2.gif" width="16" height="17" /></td>
		</tr>
	</table>

</body>
<script type="text/javascript">


function  addmoney(total_input){
	//alert("ad")
//  var a=$("#order.Sendprice").value;//派送价格
  
 // var b=$("#order.Proteprice").val();
  var a= document.getElementById("order.Proteprice").value;
  var b= document.getElementById("order.Sendprice").value;
  var c= document.getElementById("order.Mateprice").value;
  //alert(parseFloat(c));
  var  totalprice=parseFloat(a)+parseFloat(b)+parseFloat(c);
  total_input.value=totalprice;
	
	
}
	function showImage(inp) {
		//alert("qq");
      
		var eleName = inp.name;
		var imageId = eleName + "image";
		var Kspan=eleName+"K";
		//alert(imageId+";"+inp.value);
		var image = document.getElementById(imageId);
		var sp=document.getElementById(Kspan);
	
		if (inp.value == null || inp.value == "" ) {
		
			image.style.display = "none";
			sp.style.display = "";
			return false;
		} else {

			image.style.display = "";
			sp.style.display = "none";
			return true;
		}

	}
	
	function showImage2(inp) {
		//alert("qq");
      
		var eleName = inp.name;
		var imageId = eleName + "image";
		var Kspan=eleName+"K";
		//alert(imageId+";"+inp.value);
		var image = document.getElementById(imageId);
		var sp=document.getElementById(Kspan);
	//alert(inp.value.length );
		if (inp.value == null || inp.value == ""||inp.value.length!=11 ) {
		
			image.style.display = "none";
			sp.style.display = "";
		//	inp.focus();
			return false;
		} else {

			image.style.display = "";
			sp.style.display = "none";
			return true;
		}

	}
	
	function showImage1(inp) {
		

		var eleName = inp.name;
		var imageId = eleName + "image";
		
		var image = document.getElementById(imageId);
	
		if (inp.value == null || inp.value == "" || checknum(inp) == false) {
		
			image.style.display = "none";
		} else {

			image.style.display = "";
		}

	}
	//邮箱验证
	function checkemail(email_input) {
		
		var  ename=email_input.name+"E";
		  var  emailW=document.getElementById(ename);
		var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
		if (!myreg.test(email_input.value)) {
			emailW.style.display = "";
		//	email_input.focus();
			
		}else{
			emailW.style.display = "none";
			
		}
	}
   //数字验证
	function checknum(inp) {

		var patrn = /^\d{0,11}$/;
		if (!patrn.test(inp.value)) {
			alert("您必须输入整数最多11位");
			inp.focus();
			return false;
		}
		return true;

	}

	function checkform() {
		var sel1= document.getElementById("hwlb");
		var sel2 = document.getElementById("shzd");
		var sender=document.getElementById("order.sender");//发送人
		var accepeter=document.getElementById("order.accepeter");//接收人
		
		var address=document.getElementById("order.Address");//送货地址
		var accepterphonenum=document.getElementById("order.accepterphonenum");//收货人电话
		 var  total=document.getElementById("order.totalpriceimage");
		//addmoney(total);//计算总价
		//alert(total.value);
		if(total.value=="0"){
			
			alert("总价不能为0！");
			return false;
		}
		if (sel1.value == "请选择"||sel2.value == "请选择"||showImage(sender)==false||showImage(accepeter)==false||showImage(address)==false||showImage2(accepterphonenum)==false) {
			alert("请先完善订单信息再提交！");
			return false;
		}

		var a = confirm("确定提交？");

		return a;
	}

	window.onload = function() {
		$.get("getGoodType", function(redata) {
			//alert(redata);
			var sel = document.getElementById("hwlb");
			sel.length = 1;
			for ( var i = 0; i < redata.length; i++) {
				// alert( redata[i].typeName);
				var op = document.createElement("option");
				op.value = redata[i].id;
				op.text = redata[i].typeName;
				sel.add(op);
			}

		}, "json");

		$.get("getSendNode", function(datas) {
			//alert("asd" + datas);
			var sels = document.getElementById("shzd");
			sels.length = 1;
			for ( var i = 0; i < datas.length; i++) {
		
				var op = document.createElement("option");
				op.value = datas[i].nodename;
				op.text = datas[i].nodename;
				sels.add(op);
			}

		}, "json");

	};
</script>
</html>