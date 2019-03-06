<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="UTF-8">
		<title>支付宝，知托付！</title>
		<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
			var user=null;
									setTimeout(function(){
											$.post(//进此页面就发一个ajax到服务器，告诉服务器有人扫码了，无返回值-han01
											"UserServlet",
											"opr=huafeiPage",
											function(rtnData){
												if(rtnData!=null){
											    user = rtnData;//user对象的 json 格式
												$("#tel").text(user.tel);
												$("#money").text(user.username);
										}
											},
											"json"
											);
									},0)
			
										$("#loginYES").click(function(){
										var tel = $("#tel").text();
										var money = $("#money").text();
												$.post(
													"UserServlet",
													"opr=huafei2",
													function(rtnData){
														if(rtnData=="true"){
															$("#PhoneLogin").hide();//确认模块隐藏
															$("#goComputer").show();//提示模块出现//充值成功！
														}else if(rtnData=="false"){
															   $("#goComputer").show();//提示模块出现
																$("#tips").text("支付宝余额不足！")
														}
														
													},
													"text"
												);
									})
			
					$("#loginNO").click(function(){
								$.post(//发一个ajax到服务器清除话费支付
								"UserServlet",
								"opr=clearhuafei",
								function(rtnData){},
								"text"
								);
						
						
					});
			
		})
		</script>
	</head>
	<body style="width: 100%; height: 100%;">
			<div id="PhoneLogin" style="width: 80%; height: 50%;  position: relative;  left: 5%; ">
				<p style="width: 100%; position: relative; left: 200px; font-size: 80px;">支付宝话费充值</p>
				<p style="width: 100%; position: relative;font-size: 60px;">手机号码：<span id="tel"></span></p>
				<p style="width: 100%; position: relative;font-size: 60px;">充值金额：<span id="money"></span></p>
				<input type="button" id="loginYES" value="确认充值" style="font-size: 50px; color: white; width: 101%;margin-top: 10px; height: 130px;border:0px;background-color: #00BFFF; border-radius:5px ;" /><br />
				<input type="button" id="loginNO" value="取消" style="font-size: 50px;width: 101%;margin-top: 5px;height: 130px; border-radius:5px ;border:0px;"  />
			</div>
			<div id="goComputer"  style="width: 90%; height: 100%;  position: fixed; left: 5%;" hidden="hidden">
				<p id="tips" style="width: 80%; position: absolute; left: 28%; top: 10%; font-size: 60px;">充值成功！</p>
				
			</div>
	</body>
</html>
