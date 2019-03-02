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
		<script src="js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
			
				setTimeout(function(){
						$.post(//进此页面就发一个ajax到服务器，告诉服务器有人扫码了，无返回值-han01
						"UserServlet",
						"opr=IamshaomaPage",
						function(rtnData){},
						"text"
						);
				},0)
			
			$("#loginYES").click(function(){
				var username = $("#userLoginname").val();
				$.post(
					"UserServlet",
					"opr=loginOK&username="+username,
					function(rtnData){
						if(rtnData=="true"){
							$("#PhoneLogin").hide();//登录模块隐藏
							$("#goComputer").show();//提示模块出现//请在PC端继续操作
						}else if(rtnData=="false"){
								$("#tips").text("先在手机app上登录！")
						}
						
					},
					"text"
				);
				
				
			})
			
					$("#loginNO").click(function(){
								$.post(//发一个ajax到服务器清除扫码
								"UserServlet",
								"opr=ClearIamshaomaPage",
								function(rtnData){},
								"text"
								);
						
						
					});
			
			})
			
		
		</script>
	</head>
	<body style="width: 100%; height: 100%;">
			<div id="PhoneLogin" style="width: 80%; height: 50%;  position: relative;  left: 5%; ">
				<p style="width: 100%; position: relative;font-size: 60px;">输入您的用户名：</p>
				<input type="text"  id="userLoginname" value="" style="font-size: 80px;width: 100%;margin-top: 1px; height: 130px;"  /><br />
				<input type="button" id="loginYES" value="确认登录" style="font-size: 50px; color: white; width: 101%;margin-top: 10px; height: 130px;border:0px;background-color: #00BFFF; border-radius:5px ;" /><br />
				<input type="button" id="loginNO" value="取消" style="font-size: 50px;width: 101%;margin-top: 5px;height: 130px; border-radius:5px ;border:0px;"  />
			</div>
			<div id="goComputer"  style="width: 90%; height: 100%;  position: fixed; left: 5%;" hidden="hidden">
				<p id="tips" style="width: 80%; position: absolute; left: 28%; top: 10%; font-size: 60px;">请在PC端继续操作</p>
				
			</div>
	</body>
</html>
