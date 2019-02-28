<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<style>
			*{padding: 0px; margin: 0px;}
			#bodyd a{text-decoration: none;color: #cccccc;}
		</style>
	</head>
	<body>
		<%@include file="head.jsp" %>
		<div style="width: 100%; height: 330px;margin-top: 40px;">
			<div  style=" width: 990px; height: 30px; margin: 0 auto;"></div>
			<div  style=" width: 990px; height: 70px; margin: 0 auto;background-color: lightgoldenrodyellow;border: 1px solid lightgrey;">
				<div  style=" width:150px; height: 70px;float: left">
					<div  style="height:32px; width:32px; border-radius:50%;position: relative;top: 18px;left: 107px;background-image: url(img/2019-02-20_1643471.png);"></div>
				</div>
				<div  style=" width: 840px; height: 70px;float: left;line-height: 70px;"><span style="font-size: 22px;">修改成功，请牢记新的登陆密码</span></div>
			</div>
			<div  style=" width: 990px; height: 30px; margin: 0 auto;border: 1px solid lightgrey;border-top:0px ;">
				<a href="User.jsp" style="position: relative;left: 150px;font-size: 13px;color: dimgrey;text-decoration: none;">返回我的支付宝</a>
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

