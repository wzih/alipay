<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<style type="text/css">
			#bodyd a{text-decoration: none;color: #cccccc;}
		</style>
		
		<link rel="stylesheet" type="text/css" href="layui/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="layer/theme/default/layer.css" />
		<script src="layDate-v5.0.9/laydate/laydate.js" type="text/javascript" charset="utf-8"></script>
		<script src="layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
		<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>

		<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			$(function(){
				
					
			
				
			});
			function fmzgmmqd(){
				var username = $("#fmz-zc-username").val();
				var cardid = $("#fmz-zc-cardid").val();
				var name = $("#fmz-zc-name").val();
				var loginpwd = $("#fmz-zc-login").val();
				var reloginpwd = $("#fmz-zc-relogin").val();
				var paypwd = $("#fmz-zc-pay").val();
				var repaypwd = $("#fmz-zc-repay").val();
				var tel = $("#fmz-zc-tel").val();
				var id="";
				
				if ($("#main input[type='text']").val()==""||$("#main input[type='password']".val)=="") {
					layer.open({
						title: '提示'
						,content: '请完整填写所有信息！'
					});   
					return;
				}
				if (reloginpwd!=loginpwd) {
					layer.open({
						title: '提示'
						,content: '两次输入的登录密码不同，请重新输入！'
					});
					$("#fmz-zc-login").val("");
					$("#fmz-zc-relogin").val("");   
					return;
				}
				if (repaypwd!=paypwd) {
					layer.open({
						title: '提示'
						,content: '两次输入的支付密码不同，请重新输入！'
					});   
					$("#fmz-zc-pay").val("");
					$("#fmz-zc-repay").val("");  
					return;
				}
				var checkcardid = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
				if (!checkcardid.test(cardid)) {
					layer.open({
						title: '提示'
						,content: '身份证格式有误，请重新输入！'
					});   
					$("#fmz-zc-cardid").val("");
					return;
				}
				
				 var checktel = /^[1](([3][0-9])|([4][5-9])|([5][0-3,5-9])|([6][5,6])|([7][0-8])|([8][0-9])|([9][1,8,9]))[0-9]{8}$/;
		         if(!checktel.test(tel))
		         {
		        	layer.open({
						title: '提示'
						,content: '手机号格式不正确，请重新输入！'
					}); 
		            return;
		         }
		         
		         
				 $.post(
					"UserServlet",
					"opr=checkidCard&idCard="+cardid,
					function(rtnDate){
						if (rtnDate!="false") {
							layer.open({
								title: '提示'
								,content: '身份号已注册，请重新输入其他身份证号！'
							}); 
						}else {
							$.post(
								"UserServlet",
								"opr=add&tel="+tel+"&username="+username+"&name="+name+"&idCard="+cardid+"&loginPWD="+loginpwd+"&payPWD="+paypwd,
								function(rtnDate){
									if (rtnDate!="true") {
										id=rtnDate;
										layer.open({
											title: '提示'
											,content: '注册成功！'
										});
										
									}	
								},
								"json"
							)
							
							$.post(
								"VIPServlet",
								"opr=add&userid="+id,
								function(rtnDate){
									if (rtnDate=="true") {
										alert(1);
									}
								},
								"text"
							)
							
							
							
							location.href = "index.jsp";
						}				
					},
					"json"
				)
				
				
			}
				
			function checkLoginpwd(thiz){
				var password = $(thiz).val();
				var reqPassword =/^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,20}$/;
		        if(password.length < 8)
		        {
		        	layer.open({
						title: '提示'
						,content: '密码长度不能小于8，请重新输入！'
					}); 
		           
		            return;
		        }
		        if(password.length > 20)
		        {
		        	layer.open({
						title: '提示'
						,content: '手机密码长度不能大于20，请重新输入！'
					}); 
		          
		            return;
		        }
		
		        if(!reqPassword.test(password))
		        {
		        	layer.open({
						title: '提示'
						,content: '密码格式不正确，请重新输入！'
					}); 
		           
		            return;
		         }
		        
			}
			
			function checkPaypwd(thiz){
				var password = $(thiz).val();
				
		        if(password.length != 6)
		        {
		        	layer.open({
						title: '提示'
						,content: '密码长度只能为6位，请重新输入！'
					}); 
		            return;
		        }
		        
			}
			
			function send(){
				var tel = $("#fmz-zc-tel").val();
				$.post(
					"UserServlet",
					"opr=checkTel&tel="+tel,
					function(rtnDate){
						if (rtnDate!="false") {
							layer.open({
								title: '提示'
								,content: '手机号已注册，请登录或重新输入其他手机号！'
							}); 
							return;
						}					
					},
					"json"
				)
			}
		</script>
		<title>注册</title>
	</head>
	<body style="width: 100%; height: 100%; margin: 0px; padding: 0px; background-color: white;">
				
				
		<!--最顶层div-->
		<div  id="bodytop" style="width: 100%; height:27px; background-color: #2F4056;">
			<div id="BodyTopContent" style="width: 66%; height:27px; position: absolute; left: 17%;">
				<img style="margin-top: 5px; width: 50px; height: 17px;"  src="img/UserFirstIMG/logo1.png"/>
				<a style="float: right;color: white;line-height: 27px;" href="index.jsp">登录</a>
			</div>
		</div>
				
				
		<!--logo层div-->
		<div  id="bodyBody" style="width: 100%; height:75px;">
			<div id="BodyBodyContent" style="width: 66%; height:75px; position: absolute; left: 17%;">
				<a href="User.jsp">
					<img  style=" cursor: pointer; margin-top:20px ;" src="img/index2Imgs/index2logo.png"/>
				</a>
				<ul style="float: right; margin-top: 45px; ">
					<li style=" margin-left: 50px; float: left;list-style: none;">
						<a  style="color: #e0620d;font-size: 16px; text-decoration: none;font-weight: bolder;" href="index.jsp">
						<img style="position: relative; top: 2px; right: 8px; " src="img/UserFirstIMG/LX.png"/>我的支付宝</a>
					</li>
					<li style="margin-left: 50px; float: left;list-style: none;">
						<a class="top_a_red"  style="color: #2F4056;font-size: 16px; text-decoration: none;font-weight: bolder;" href="index.jsp">
						<img style="position: relative; top: 2px; right: 8px; " src="img/UserFirstIMG/LX(1).png"/>交易记录</a>
					</li>
					<li style="margin-left: 50px; float: left;list-style: none;">
						<a  class="top_a_red" style="color: #2F4056;font-size: 16px; text-decoration: none;font-weight: bolder;" href="index.jsp">
						<img style="position: relative; top: 2px; right: 8px; " src="img/UserFirstIMG/LX(1).png"/>会员保障</a>
					</li>
					<li style="margin-left: 50px; float: left;list-style: none;">
						<a class="top_a_red"  style="color: #2F4056;font-size: 16px; text-decoration: none;font-weight: bolder;" href="index.jsp">
						<img style="position: relative; top: 2px; right: 8px; " src="img/UserFirstIMG/LX(1).png"/>应用中心</a>
					</li>
								
				</ul>
							
			</div>
		</div>
				
		<!--搜索框层div-->
		<div  id="bodytop3" style="width: 100%; height:32px; ">
			<div  id="bodytop3" style="width: 100%; height:32px; opacity: 0.5; background-image: url(img/UserFirstIMG/xiawu.jpg);"></div>
			
			<div id="BodyTopContent" style="width: 66%; height:32px; position: absolute; left: 17%;top: 103px;">
				<ul style="margin: 0px; padding: 0px;">
					<li style="margin-top: 3px; border-radius: 4px; list-style: none; background-color: #8D8D8D; padding-left: 25px; padding-right: 25px; padding-top: 4px; padding-bottom: 4px; float: left;">
						<a href="index.jsp" id="shouye"  class="top_a_red"  style="text-align: center; text-decoration: none; color: white; font-size: 12px;">首页</a>
					</li>
					<li style="margin-top: 3px;  list-style: none; padding-left: 25px; padding-right: 25px; padding-top: 4px; padding-bottom: 4px; float: left;">
						<a href="index.jsp" class="top_a_red"  style="text-align: center; text-decoration: none; color: #393D49; font-size: 12px;">账户资产</a>
					</li>
					<li style="margin-top: 3px; list-style: none;padding-left: 25px; padding-right: 25px; padding-top: 4px; padding-bottom: 4px; float: left;">
						<a href="index.jsp" class="top_a_red"  style="text-align: center; text-decoration: none; color: #393D49; font-size: 12px;">账户设置</a>
					</li>
					<li style="margin-top: 3px;  list-style: none;  padding-left: 25px; padding-right: 25px; padding-top: 4px; padding-bottom: 4px; float: left;">
						<a href="index.jsp" class="top_a_red"  style="text-align: center; text-decoration: none; color: #393D49; font-size: 12px;">账户通</a>
					</li>
					<li style="margin-top: 3px; list-style: none; padding-left: 25px; padding-right: 25px; padding-top: 4px; padding-bottom: 4px; float: left;">
						<a href="index.jsp" class="top_a_red"  style="text-align: center; text-decoration: none; color: #393D49; font-size: 12px;">商户服务</a>
					</li>
							
				</ul>
					
				<input type="text" id="usersearch" oninput="searcgoninput()"
						style="border-radius: 15px; border: 0px; padding-left: 6px; border: 0px; height: 20px; width:180px; margin-right: 10px; margin-top: 5px; float: right;outline: none;"
						placeholder="输入关键字，如‘密码’" />
				<img style="position: absolute; right: 20px;top: 8px;" src="img/UserFirstIMG/sousuo.png"/>
				
				<ul id="search-hide-ul" hidden="hidden" style="border: 1px solid #C2C2C2; padding: 0px; width: 200px; height:auto; position: absolute; right: 0px;top: 30px; background-color: white; list-style: none; z-index: 1;">
					<li class=" li--search-w-h" style="background-color: white;line-height: 30px;font-size: 12px;color: #4E5465;cursor: default;"><a>热门搜索：</a></li>
					<li class=" li--search-w-h"><a href="#" class="a-nounLine">手机服务</a></li>
					<li class=" li--search-w-h"><a href="#" class="a-nounLine">实名认证</a></li>
					<li class=" li--search-w-h"><a href="#" class="a-nounLine">找回支付密码</a></li>
					<li class=" li--search-w-h"><a href="#" class="a-nounLine">收支明细</a></li>
					<li class=" li--search-w-h"><a href="#" class="a-nounLine">充值记录</a></li>
					<li class=" li--search-w-h"><a href="#" class="a-nounLine">数字证书</a></li>
					<li class=" li--search-w-h"><a href="#" class="a-nounLine">缴费</a></li>
					<li class=" li--search-w-h"><a href="#" class="a-nounLine">还款</a></li>
				</ul>		
			</div>
		</div>

		<div id="main" style="width: 100%; height: 800px;">
			<div  style=" width: 990px; height: 40px; margin: 0 auto;"></div>
			
			<div style="width: 970px; height:700px; margin: 0 auto; border: 1px solid #B9B9B9;">
				<div style="width: 970px; height:60px;"></div>
				<div style="float: left;width: 330px;height: 240px;"><!--左-->
                                                                     
					<div style="width: 330px;height: 55px; "><span style="float:right;position: relative;top: 6px;color: #4D4D4D;font-size: 14px;">真实姓名</span></div>
					
					<div style="width: 330px;height: 55px; "><span style="float:right;position: relative;top: 6px;color: #4D4D4D;font-size: 14px;">身份证</span></div>
					<div style="width: 330px;height: 55px; "><span style="float:right;position: relative;top: 6px;color: #4D4D4D;font-size: 14px;">账户名</span></div>
					<div style="width: 330px;height: 55px; "><span style="float:right;position: relative;top: 6px;color: #4D4D4D;font-size: 14px;">登陆密码</span></div>
					<div style="width: 330px;height: 55px; "><span style="float:right;position: relative;top: 6px;color: #4D4D4D;font-size: 14px;">确认登录密码</span></div>
					<div style="width: 330px;height: 55px; "><span style="float:right;position: relative;top: 6px;color: #4D4D4D;font-size: 14px;">支付密码</span></div>
					<div style="width: 330px;height: 55px; "><span style="float:right;position: relative;top: 6px;color: #4D4D4D;font-size: 14px;">确认支付密码</span></div>
					<div style="width: 330px;height: 55px; "><span style="float:right;position: relative;top: 6px;color: #4D4D4D;font-size: 14px;">手机号</span></div>
					<div style="width: 330px;height: 55px; "><span style="float:right;position: relative;top: 6px;color: #4D4D4D;font-size: 14px;"></span></div>
				</div>
				
				
				<div style="float: left;width: 640px;height:240px;"><!--右-->
					<div style="width: 640px;height: 55px; ">&nbsp;&nbsp;&nbsp;
						<input id="fmz-zc-name"onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'')" 
								onbeforepaste="clipboardData.setData('text',clipboardData.getData('text').replace(/[^\u4E00-\u9FA5]/g,''))"  type="text" style="width: 200px; height: 30px; border:1px solid lightgray;"/>
						<br/>&nbsp;&nbsp;&nbsp;
					</div>
					
					<div style="width: 640px;height: 55px; ">&nbsp;&nbsp;&nbsp;
						<input id="fmz-zc-cardid" maxlength="18" type="text" style="width: 200px; height: 30px; border:1px solid lightgray;"/>
						<br/>&nbsp;&nbsp;&nbsp;
					</div>
					
					<div style="width: 640px;height: 55px; ">&nbsp;&nbsp;&nbsp;
						<input id="fmz-zc-username" type="text" style="width: 200px; height: 30px; border:1px solid lightgray;"/>
						<br/>&nbsp;&nbsp;&nbsp;
					</div>
					
					<div style="width: 640px;height: 55px; ">&nbsp;&nbsp;&nbsp;
						<input id="fmz-zc-login" type="password" onblur="checkLoginpwd(this)" style="width: 200px; height: 30px; border:1px solid lightgray;"/>
						&nbsp;&nbsp;<a href="javascript:void(0);" style="position: relative;top: 8px;text-decoration: none;font-size: 12px;">如何设置安全密码？</a>
						<br/>&nbsp;&nbsp;&nbsp;
					</div>
					
					<div style="width: 640px;height: 55px; ">&nbsp;&nbsp;&nbsp;
						<input id="fmz-zc-relogin" type="password" style="width: 200px; height: 30px; border:1px solid lightgray;"/>
						<br/>&nbsp;&nbsp;&nbsp;
					</div>
					
					<div style="width: 640px;height: 55px; ">&nbsp;&nbsp;&nbsp;
						<input id="fmz-zc-pay" type="password" onblur="checkPaypwd(this)" style="width: 200px; height: 30px; border:1px solid lightgray;"/>
						&nbsp;&nbsp;<a href="javascript:void(0);" style="position: relative;top: 8px;text-decoration: none;font-size: 12px;">如何设置安全密码？</a>
						<br/>&nbsp;&nbsp;&nbsp;
					</div>
					
					<div style="width: 640px;height: 55px; ">&nbsp;&nbsp;&nbsp;
						<input id="fmz-zc-repay" type="password" style="width: 200px; height: 30px; border:1px solid lightgray;"/>
						<br/>&nbsp;&nbsp;&nbsp;
					</div>
					
					<div style="width: 640px;height: 55px; ">&nbsp;&nbsp;&nbsp;
						<input id="fmz-zc-tel" maxlength="11"oninput = "value=value.replace(/[^\d]/g,'')"
						 type="text" style="width: 200px; height: 30px; border:1px solid lightgray;"/>
						<br/>&nbsp;&nbsp;&nbsp;
					</div>
					
					<div style="width: 640px;height: 55px; ">&nbsp;&nbsp;&nbsp;
						<input id="fmz-zc-inputg"  	 type="text" style="width: 100px; height: 30px; border:1px solid lightgray;"/>
						&nbsp;<input type="button" onclick="send()" value="发送验证码" style="width: 90px;height: 34px;"/>
						<br/>&nbsp;&nbsp;&nbsp;
					</div>
					<div style="width: 640px;height: 55px; ">&nbsp;&nbsp;
						<input  type="button" value="注册" onclick="fmzgmmqd()" style="width: 70px;height: 30px;background-color:#F29813 ;color: floralwhite;font-size: 15px;border: 0px;"/>
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
