<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
			*{
			padding: 0px;
			margin: 0px;
			}
			#bodyd a{text-decoration: none;color: #cccccc;}
		</style>
		<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#fmz-gmma-cwts").html("");
				$("#fmz-gmm").hover(function(){$("#fmz-gmm").css("border-color","black")},function(){$("#fmz-gmm").css("border-color","lightgray")});
				$("#fmz-gmm-a").hover(function(){$("#fmz-gmm-a").css("text-decoration","underline")},function(){$("#fmz-gmm-a").css("text-decoration","none")});
				$("#fmz-gmm-input").hover(function(){$("#fmz-gmm-input").css("opacity","0.8")},function(){$("#fmz-gmm-input	").css("opacity","1.0")});
				
			});
			function fmzgmmaxyb(){
				
				var loginpwd = $("#fmz-gmm").val();
				$.post(
					"UserServlet",
					"opr=checkLoginPwd&loginpwd="+loginpwd,
					function(rtnData){
						if (rtnData=="true") {
							location.href = "updateLogintwo.jsp";
						} else {
							$("#fmz-gmma-cwts").html("密码错误，请重新输入！");			
						}
					},
					"text"
				)
				
			}
		</script>
		<title></title>
	</head>
	<body style="width: 100%; height: 100%; margin: 0px; padding: 0px; background-color: white;">
	<%@include file="head.jsp"  %>
	
	
		<div style="width: 100%; height: 530px;">
			<div  style=" width: 990px; height: 40px; margin: 0 auto;"></div>
			<div  style=" width: 990px; height: 80px; margin: 0 auto;">
				<ul style="list-style:none;">
					<li style="float:left;width:80px;height:30px;"></li>
					<li style="float:left;width:30px;height:30px; background-image: url(img/update/login/2019-02-20_112721.png);background-repeat:no-repeat;"><h4 style="position: relative;left:10px; top: 4px;color: #FFFFFF;">1</h4></li>
					<li style="float:left;width:370px;height:30px;"><div style="width:370px; height:14px;border-bottom: 3px solid #B9B9B9;"></div></li>
					<li style="float:left;width:30px;height:30px;background-image: url(img/update/login/2019-02-20_112754.png);background-repeat:no-repeat;"><h4 style="position: relative;left:10px; top: 4px;color: #FFFFFF;">2</h4></li>
					<li style="float:left;width:370px;height:30px;"><div style="width:370px; height:14px;border-bottom: 3px solid #B9B9B9;"></div></li>
					<li style="float:left;width:30px;height:30px;background-image: url(img/update/login/2019-02-20_112754.png);background-repeat:no-repeat;"><h4 style="position: relative;left:10px; top: 4px;color: #FFFFFF;">3</h4></li>
					<li style="float:left;width:80px;height:30px;"></li>  
				</ul>
				<ul style="list-style:none;">
					<li style="float:left;width:67px;height:30px;"></li>
					<li style="float:left;width:104px;height:30px; color: #FF7001;;"><span style="font-size: 14px;">验证身份</span></li>
					<li style="float:left;width:280px;height:30px;"></li>
					<li style="float:left;width:120px;height:30px;color: #B9B9B9;"><span style="font-size: 14px;">重置登陆密码</span></li>
					<li style="float:left;width:295px;height:30px;"></li>
					<li style="float:left;width:100px;height:30px;color: #B9B9B9;"><span style="font-size: 14px;">重置完成</span></li>
				</ul>
			</div>
			<div style="width: 970px; height:300px; margin: 0 auto; border: 1px solid #B9B9B9;">
				<div style="width: 970px; height:20px;"></div>
				<div  style=" width: 900px; height: 25px; margin: 0 auto; border-bottom: 1px solid #B9B9B9;">
					<img src="img/update/login/2019-02-20_120939.png" style="float:left;position: relative;top: 3px;"/>
					<p style="float:left; font-size: 14px;">&nbsp;&nbsp;您正在使用“<span style="color: #FF7001;">登陆密码</span>”进行校验</p>
				</div>
				<div style=" width: 900px; height: 260px;margin: 0 auto; text-align: center;">
					<div style=" width: 900px; height: 60px;margin: 0 auto;"></div>
					<div style="width: 900px; height: 70px;">
						<span style="color: #4D4D4D;font-size: 14px;">登陆密码</span>&nbsp;&nbsp;<input id="fmz-gmm" type="text" style="width: 200px; height: 30px; border:1px solid lightgray;"/>
						<a id="fmz-gmm-a" href="#" style="font-size: 12px;text-decoration: none;position: relative;top: 6px;">忘记密码？</a>
						<br/><span id="fmz-gmma-cwts" style="font-size: 13px; color: red;"></span>
					</div>
					<div>
						<input id="fmz-gmm-input" type="button" value="下一步" onclick="fmzgmmaxyb()" style="width: 85px;height: 30px;background-color: #F29813;border: 0px; color: ivory;"/>
					</div>
				<div id="exe" style="width: 120px; height: 110px;position: absolute;right: 0px;top: 300px;">
					<img src="img/update/login/1tdi7nR70h(2).png"/>
					<input type="button"value="&nbsp;X&nbsp;" style="float: right;" onclick="exe()"/>
				</div>
				</div>
			
			</div>
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
