<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<style type="text/css">
		*{
			padding: 0px;
			margin: 0px;
			
		}
		#bodyd a{text-decoration: none;color: #cccccc;}
	</style>
	<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#fmz-gmli-a").hover(function(){$("#fmz-gmli-a").css("border-color","lightskyblue")},function(){$("#fmz-gmli-a").css("border-color","gainsboro")});
			$("#fmz-gmli-b").hover(function(){$("#fmz-gmli-b").css("border-color","lightskyblue")},function(){$("#fmz-gmli-b").css("border-color","gainsboro")});
			$("#fmz-gmli-c").hover(function(){$("#fmz-gmli-c").css("border-color","lightskyblue")},function(){$("#fmz-gmli-c").css("border-color","gainsboro")});
			$("#fmz-gmli-a input").hover(function(){$("#fmz-gmli-a input").css("opacity","0.8")},function(){$("#fmz-gmli-a input").css("opacity","1.0")});
			$("#fmz-gmli-b input").hover(function(){$("#fmz-gmli-b input").css("opacity","0.8")},function(){$("#fmz-gmli-b input").css("opacity","1.0")});
			$("#fmz-gmli-c input").hover(function(){$("#fmz-gmli-c input").css("opacity","0.8")},function(){$("#fmz-gmli-c input").css("opacity","1.0")});
		
		});
		
		function loginPwd(){
			location.href = "updateLoginfirst.jsp";
		}
	</script>
	<head>
		<meta charset="utf-8" />
		<title></title>
	</head>
	<body style="width: 100%; height: 100%; margin: 0px; padding: 0px; background-color: white;">
	<%@include file="head.jsp"   %>	
	
		<div style="width: 990px; height: 530px;margin: 0 auto;">
			<div style="width: 990px; height: 30px; margin: 0 auto;"></div>
			<p style="font-size: 14px;">你正在为账户 133******19 重置登录密码，请选择重置方式：</p>
			<ul style="list-style: none;">
				<li id="fmz-gmli-a" style="width: 670px; height: 90px; line-height:90px;border: 1px solid gainsboro;margin-top: 30px;">
					<img src="img/update/login/3DFRZw5xB7(2).png" style="position: relative;top: 20px;margin-left: 30px;"/>&nbsp;&nbsp;&nbsp;
					<span>通过登陆密码</span>
					<img src="img/update/login/2019-02-20_172751.png"style="position: relative;top: 2px;"/>
					<input type="button" onclick="loginPwd()"  value="立即重置" style="width: 100px; height: 30px;background-color: #F29813; position: relative;left: 282px;color: ghostwhite;border: 0px;" />
				</li>
				<li id="fmz-gmli-b" style="width: 670px; height: 90px;line-height:90px;border: 1px solid gainsboro;margin-top: 30px;">
					<img src="img/update/login/2019-02-20_164457.png" style="position: relative;top: 10px;margin-left: 25px;"/>&nbsp;&nbsp;
					<span>通过验证身份证件</span>
					<input type="button"  value="立即重置" style="width: 100px; height: 30px;background-color: #F29813; position: relative;left: 298px; color: ghostwhite;border: 0px;" />
				</li>
				
				<li id="fmz-gmli-c" style="width: 670px; height: 90px;line-height:90px;border: 1px solid gainsboro;margin-top: 30px;">
					<img src="img/update/login/2019-02-20_164347.png" style="position: relative;top: 20px;margin-left: 30px;"/>&nbsp;&nbsp;&nbsp;&nbsp;
					<span>通过验证短信</span>
					<input type="button"  value="立即重置" style="width: 100px; height: 30px;background-color: #F29813; position: relative;left: 330px;color: ghostwhite;border: 0px;               " />
				</li>
			</ul>
		</div>
		
		<div  id="bodyd" style="width: 100%;  height:auto;   background-color: #23262E ">
			<div id="bottom" style="color: #F5F5F5; font-size: 12px;margin-left:10%; z-index: 3;height: 180px;">
				<br/><br/><br/>
				<div style="margin-bottom: 5px;">
					<a href="#">诚征英才</a><span> | </span>
					<a href="#">联系我们</a><span> | </span>
					<a href="#">International Business  </a>
					<span style="color: darkgrey;"> 泸ICP备15027489号</span>
				</div>
				
				<p><a href="#">蚂蚁金服集团</a><span> | </span>
					<a href="#">支付宝</a><span> | </span>
					<a href="#">余额宝</a><span> | </span>
					<a href="#">招财宝</a><span> | </span>
					<a href="#">芝麻信用</a><span> | </span>
					<a href="#">蚂蚁微货</a><span> | </span>
					<a href="#">网商银行</a><span> | </span>
					<a href="#">虾米</a><span> | </span>
					<a href="#">天天动听</a><span> | </span>
					<a href="#">来往</a><span> | </span>
					<a href="#">蚂蚁达客</a>
				</p>
				
				<div style="margin-bottom: 5px;">
					<a href="#">阿里巴巴集团</a><span> | </span>
					<a href="#">淘宝网</a><span> | </span>
					<a href="#">天猫</a><span> | </span>
					<a href="#">聚划算</a><span> | </span>
					<a href="#">全球速卖通</a><span> | </span>
					<a href="#">阿里巴巴国际交易市场</a><span> | </span>
					<a href="#">1688</a><span> | </span>
					<a href="#">阿里妈妈</a><span> | </span>
					<a href="#">阿里旅行·去啊</a><span> | </span>
					<a href="#">阿里云计算</a><span> | </span>
					<a href="#">Alios</a><span> | </span>
					<a href="#">阿里通信</a><span> | </span>
					<a href="#">万网</a><span> | </span>
					<a href="#">高德</a><span> | </span>
					<a href="#">优视</a><span> | </span>
					<a href="#">友盟</a><span> | </span>
					<a href="#">钉钉</a>
				</div>
				
			</div>
						
		</div>	
	</body>
</html>

