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
			*{padding: 0px; margin: 0px;}
			#bodyd a{text-decoration: none;color: #cccccc;}
		</style>
		<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			$(function(){
				$("#fmz-gmmb").hover(function(){$("#fmz-gmmb").css("border-color","black")},function(){$("#fmz-gmmb").css("border-color","lightgray")});
				$("#fmz-gmmc").hover(function(){$("#fmz-gmmc").css("border-color","black")},function(){$("#fmz-gmmc").css("border-color","lightgray")});
				$("#fmz-gmmd").hover(function(){$("#fmz-gmmd").css("opacity","0.8")},function(){$("#fmz-gmmd").css("opacity","1.0")});
				$("#fmz-gmm-aa").hover(function(){$("#fmz-gmm-aa").css("text-decoration","underline")},function(){$("#fmz-gmm-aa").css("text-decoration","none")});
			});
			function fmzgmmqd(){
				
		        var password =  $("#fmz-gmmb").val();
		        var repassword = $("#fmz-gmmc").val();
		        var reqPassword =/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,20}$/;
		        if(password=="")
		        {
		       		$("#fmz-gmmb-cwts").html("密码不能为空");
		            $("#fmz-gmmb").focus();
		            return;
		        }
		        if(password.length < 8)
		        {
		           $("#fmz-gmmb-cwts").html("密码长度不能小于8");
		           $("#fmz-gmmb").focus();
		            return;
		        }
		        if(password.length > 20)
		        {
		            $("#fmz-gmmb-cwts").html("密码长度不能大于20");
		     		$("#fmz-gmmb").focus();
		            return;
		        }
		
		        if(!reqPassword.test(password))
		        {
		             $("#fmz-gmmb-cwts").html("密码格式不正确");
		             $("#fmz-gmmb").focus();
		             return;
		         }
		         
		        if (password!=repassword) {
					$("#fmz-gmmb-cwts").html("两次输入的密码不一致！");
					return;
				}
				$.post(
					"UserServlet",
					"opr=update&loginPWD="+password,
					function(rtnData){
						if (rtnData == "true") {
							location.href="updateLoginthree.jsp";
						}else{
							alert("修改失败！");
						}
					},
					"text"
				)

			}
		</script>
		<title></title>
	</head>
	<body style="width: 100%; height: 100%; margin: 0px; padding: 0px; background-color: white;">
	<%@include file="head.jsp" %>
					
		<div style="width: 100%; height: 530px;">
			<div  style=" width: 990px; height: 40px; margin: 0 auto;"></div>
			<div  style=" width: 990px; height: 80px; margin: 0 auto;">
				<ul style="list-style:none;">
					<li style="float:left;width:80px;height:30px;"></li>
					<li style="float:left;width:30px;height:30px; background-image: url(img/update/login/2019-02-20_112721.png);background-repeat:no-repeat;"><h4 style="position: relative;left:10px; top: 4px;color: #FFFFFF;">1</h4></li>
					<li style="float:left;width:370px;height:30px;"><div style="width:370px; height:14px;border-bottom: 3px solid #F29813;"></div></li>
					<li style="float:left;width:30px;height:30px;background-image: url(img/update/login/2019-02-20_112721.png);background-repeat:no-repeat;"><h4 style="position: relative;left:10px; top: 4px;color: #FFFFFF;">2</h4></li>
					<li style="float:left;width:370px;height:30px;"><div style="width:370px; height:14px;border-bottom: 3px solid #B9B9B9;"></div></li>
					<li style="float:left;width:30px;height:30px;background-image: url(img/update/login/2019-02-20_112754.png);background-repeat:no-repeat;"><h4 style="position: relative;left:10px; top: 4px;color: #FFFFFF;">3</h4></li>
					<li style="float:left;width:80px;height:30px;"></li>  
				</ul>
				<ul style="list-style:none;">
					<li style="float:left;width:67px;height:30px;"></li>
					<li style="float:left;width:104px;height:30px; color: #FF7001;"><span style="font-size: 14px;">验证身份</span></li>
					<li style="float:left;width:280px;height:30px;"></li>
					<li style="float:left;width:120px;height:30px;color: #FF7001;"><span style="font-size: 14px;">重置登陆密码</span></li>
					<li style="float:left;width:295px;height:30px;"></li>
					<li style="float:left;width:100px;height:30px;color: #B9B9B9;"><span style="font-size: 14px;">重置完成</span></li>
				</ul>
			</div>
			<div style="width: 970px; height:300px; margin: 0 auto; border: 1px solid #B9B9B9;">
				<div style="width: 970px; height:60px;"></div>
				<div style="float: left;width: 330px;height: 240px;">
					<div style="width: 330px;height: 50px; "><span style="float:right;color: #4D4D4D;font-size: 14px;">账户名</span></div>
					<div style="width: 330px;height: 60px; "><span style="float:right;position: relative;top: 6px;color: #4D4D4D;font-size: 14px;">新的登陆密码</span></div>
					<div style="width: 330px;height: 60px; "><span style="float:right;position: relative;top: 6px;color: #4D4D4D;font-size: 14px;">确认新的登录密码</span></div>
					
				</div>
				<div style="float: left;width: 640px;height:240px;">
					<div style="width: 640px;height: 50px; ">&nbsp;&nbsp;&nbsp;<span style="color:#F29813 ;">${user.username }</span></div>
					<div style="width: 640px;height: 60px; ">&nbsp;&nbsp;&nbsp;<input id="fmz-gmmb" type="password" style="width: 200px; height: 30px; border:1px solid lightgray;"/>
						&nbsp;&nbsp;<a href="#" id="fmz-gmm-aa" style="position: relative;top: 8px;text-decoration: none;font-size: 12px;">如何设置安全密码？</a>
						<br/><span style="color: lightgray;font-size: 12px;">&nbsp;&nbsp;&nbsp;&nbsp;必须是8-20位英文字母、数字或符号，不能是纯数字或纯字母 </span>
					</div>
					<div style="width: 640px;height: 60px; ">&nbsp;&nbsp;&nbsp;<input id="fmz-gmmc" type="password" style="width: 200px; height: 30px; border:1px solid lightgray;"/>
					<br/><span id="fmz-gmmb-cwts" style="font-size: 13px; color: red;"></span></div>
					
					<div style="width: 640px;height: 60px; ">&nbsp;&nbsp;&nbsp;<input id="fmz-gmmd" type="button" value="确定" onclick="fmzgmmqd()" style="width: 70px;height: 30px;background-color:#F29813 ;color: floralwhite;font-size: 15px;border: 0px;"/></div>
				</div>
				
				
				<div id="exe" style="width: 120px; height: 110px;position: absolute;right: 0px;top: 300px;">
					<img src="img/update/login/1tdi7nR70h(2).png"/>
					<input type="button"value="&nbsp;X&nbsp;" style="float: right;" onclick="exe()"/>
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
