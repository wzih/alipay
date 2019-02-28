<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>转账</title>
		<link rel="stylesheet" type="text/css" href="layui/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="layer/theme/default/layer.css" />
		<script src="layDate-v5.0.9/laydate/laydate.js" type="text/javascript" charset="utf-8"></script>
		<script src="layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
		<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			
			#nav{width: 210px;display: inline-block;position:relative;left:270px;margin-right: 50px;top: 50px;float: left;height: 600px;}
			#right{width: 750px;height: 400px;margin-left: 50px;float:left;position: relative;left: 200px; border: 1px solid #F2F6FA;top:50px;font-size: 18px;}
			#nav a{text-decoration: none; color: black;}
			#first,#three{display: block; width: 210px;height: 50px;border-bottom:1px solid black;line-height: 50px;color: gray;letter-spacing: 15px;text-indent: 20px;font-size: 20px;font-weight: bold;}
			#nav ul{list-style-type: none;}
			#mainul{position: absolute;left: 0px;top: -14px;}
			#nav ul li{display:block;width:210px;line-height:60px;border-left: 1px solid gray;border-right: 1px solid gray;}
			#first,#three{border-bottom:1px solid #999;}
			#two li,#four li{display:block;width:210px; height:57px; line-height:57px; border-bottom:1px solid gray;text-indent: 60px; color: gray;}
			#two,#four{display:none;}
			#toCard{width: 100%;height:80px;border-bottom: solid #E6EEF6 1px;background-color: #F2F6FA;border-top: solid 2px #CFDBE8;}
			#toCard_tishi{display: inline-block; width: 250px; height: 60px; background-color: white;position: relative; top: 20px; left: 50px;border: solid 1px #E6EEF6; border-radius:8px 8px 0px 0px; border-bottom: none;}
			#btn{position: relative;left: 100px;}
			#checkbox{position: relative;left: 40px;}
			#checkname{position: absolute;left: 490px;top: 131px;height: 50px;}
			#nav textarea{vertical-align: top;}
			#beizhu,#username{display: none;}
			#friendslist{width:202px;height:300px; position: absolute;left: 420px;top:105px;border:1px black solid;background-color: white;display: none;}
			#friendsNav a{float: right;padding-right: 3px; color: black;}
			#friendslist table tr{border-bottom: 1px solid gray;width:100%;height: 30px;line-height: 30px;}
			#friendslist table tr td a:hover{background-color: #DBF0FF;}
			#friendsName{display: none;width: 171px;height: 19px;border: 1px solid #A9A9A9;line-height: 18px;position: absolute;left: 190px;top:103px;background-color: white;}
			#bodyd a{text-decoration: none;color: #cccccc;}
		</style>
		<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			var money1 = false;
			var money2 = false;
			var money3 = false;
			var infotb =null;				//表格信息
			var checkisshow=false;//是否批量
				var checkStatus = null;//选中行的信息
				
				$(function() {
				
					$("#tttttablediv").slideUp(1);
						
						//bodyBody
						var nowHour =new Date();
						var hour= nowHour.getHours();       //获取当前小时数(0-23)
						
						if(hour<6){
							
							$("#hellotext").text("凌晨好 ,")
							
						}else if(12<hour<18){
							
							$("#hellotext").text("晚上好 ,")
							
						}else if(6<hour<12){
							
							$("#hellotext").text("上午好 ,")
							
						}else if(18<hour<23){
							
							$("#hellotext").text("晚上好 ,")
							
						}
						
						
						
							setTimeout(function(){
								layer.tips('点此查看个人信息！', '#hellouser',{
									tips: [3, '#3595CC'],
									 tipsMore: true
								});//弹出一个tips层(一次性)
							},2000)
							
						$("#logOut").click(function(){
										layer.msg('你确定退出么？', {
										  time: 0 //不自动关闭
										  ,btn: ['确定', '取消']
										  ,yes: function(index){
										    layer.msg('已经安全退出',function(){
										    	
										    });
										   }
										});
						})
						
						
						
						$("#TopUserInfo").hover(function(){//最顶部个人信息div
							$("#user-info-hide").slideDown();
						})
						$("#user-info-hide").hover(function(){},function(){$("#user-info-hide").fadeOut();})
						
						
					
						
						
						
						$(".top_a_red").hover(function(){//第2，3div里的a标签鼠标悬浮事件
							$(this).css("color","#e0620d");},function(){
							$(".top_a_red").css("color","#393D49");
							$("#shouye").css("color","white");})
						
						$("#changeTouxiang").click(function(){
									//iframe层-父子操作
									layer.open({
									  type: 2,//0（信息框，默认）1（页面层）2（iframe层）3（加载层）4（tips层）
									  title: '修改头像',
									  area: ['700px', '450px'],
									  fixed: false, //不固定
									  maxmin: false,//可以最小化
									  scrollbar: false,//浏览器滚动条已锁
									  content: ['UserFiestweb.html', 'yes']//iframe里是否出现滚动条
									});
									
									//parent.layer.close(index);//关闭iframe
									// parent.layer.msg('Hi, man', {shade: 0.3})//在父层弹出一个层
									//parent.layer.iframeAuto(index);//让层自适应iframe
									//var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
									
						})
						
						$("#showxiaoxilist").hover(function(){//未读信息鼠标悬浮事件 id=showxiaoxilist
						layer.tips('您有未读信息！', '#showxiaoxilist',{
							tips: [2, '#3595CC'],
						});//弹出一个tips层
							$("#showxiaoxilist").css("opacity","1")},function(){
								layer.closeAll('tips'); //关闭所有的tips层 
								$("#showxiaoxilist").css("opacity","0.3")})
						$("#showxiaoxilist").click(function(){//未读信息鼠标单击事件 id=showxiaoxilist
							
							$("#xiaoxihidelist").slideDown();//显示未读信息div列表
							layer.closeAll('tips'); //关闭所有的tips层 

						})
						
						$("#xiaoxi-ul li").hover(function(){//隐藏的消息列表li的悬浮事件
							$(this).css("background-color","#374851");
							$(this).find("#hides-close").fadeIn();
							$(this).find("#hides-tips").fadeIn();
									
						},function(){
							$(this).css("background-color","transparent");
							$(this).find("#hides-close").hide();
							$(this).find("#hides-tips").hide();
									
								
						})
						
						$("#closexiaoxihidelist").click(function(){//未读信息div关闭事件 id=showxiaoxilist
							$("#xiaoxihidelist").slideUp();
						})
						
						$("#bindPhone").hover(function(){//绑定手机鼠标悬浮事件 
							layer.tips('您已绑定手机1234****123<br/><a href="#">管理<a/>', '#bindPhone2',{
							tips: [1, '#3595CC'],
						});//弹出一个tips层
						},function(){ });
						
						$("#shimingrenzheng").hover(function(){//实名认证鼠标悬浮事件
							layer.tips('您已通过支付宝实名认证！<br/><a href="#">查看详情<a/>', '#shimingrenzheng2',{
							tips: [1, '#3595CC'],
						});//弹出一个tips层
						},function(){});
						
						
						//最顶层div里的a 标签 悬浮事件
						$("#bodytop #BodyTopContent a").hover(function(){
							$(this).css("color","#007DDB");
						},function(){
							$(this).css("color","white");
						})
						
						
						$("#usersearch").focus(function(){//搜索框获取焦点事件
							$("#search-hide-ul").slideDown();
						})
						
						$("#usersearch").blur(function(){//搜索框失去焦点事件
							$("#search-hide-ul").slideUp();
					     })
				});
		</script>
	</head>
	<body style="width: 100%; height: 100%; margin: 0px; padding: 0px; background-color: white;">
		
				<!--最顶层div-->
				<div  id="bodytop" style="width: 100%; height:27px; background-color: #2F4056;">
												<div id="BodyTopContent" style="width: 66%; height:27px; position: absolute; left: 17%;">
													<img style="margin-top: 5px; width: 50px; height: 17px;"  src="img/UserFirstIMG/logo1.png"/>
													<img id="top_right_list" style="float: right; margin-top:5px;margin-left: 20px; cursor: pointer;" src="img/UserFirstIMG/LEIBIAO.png"/> <!--列表-->
													<span id="fuwudating">
														<img style="float: right; margin-top:5px; cursor: pointer;" src="img/UserFirstIMG/JIANTOU(1).png"/>
													<a  id="fuwudatinga" style="margin-top: 3px; color: white; float: right; font-size: 12px;text-decoration: none;" href="javascript:void(0)">服务大厅&nbsp;&nbsp;</a>
													</span>
													<a style="margin-top: 3px; color: white; float: right; font-size: 12px;text-decoration: none;" href="javascript:void(0)">安全中心 &nbsp;  &nbsp;   &nbsp;  &nbsp;  </a>
					<!--最顶部黑色div--><a style="margin-top: 3px; color: white; float: right; font-size: 12px;text-decoration: none;" href="javascript:void(0)">我的支付宝 &nbsp;  &nbsp;   &nbsp;  &nbsp;  </a>
													<a id="logOut" style="margin-top: 3px; color: white; float: right; font-size: 12px;text-decoration: none;" href="javascript:void(0)"> &nbsp;&nbsp; &nbsp;&nbsp;退出 &nbsp;  &nbsp;   &nbsp;  &nbsp;</a>
													<span id="TopUserInfo">
														<img id="jiantou111" style="float: right; margin-top:3px ; cursor: pointer;" src="img/UserFirstIMG/JIANTOU(1).png"/>
														<a  id="hellouser" style="margin-top: 3px; color: white; float: right; font-size: 12px;text-decoration: none;" href="javascript:void(0)">你好，${user.username } </a>
													</span>
												</div>
												<div hidden="hidden" id="user-info-hide" style="width: 230px; height: 150px; z-index: 1;background-color: whitesmoke; position: absolute;right: 38.3%; top: 0px;">
													<div id="user-info-hide-top" style="height: 27px; background-color: #2F4056;">
														<img  style="float: right; margin-top:3px ; cursor: pointer; margin-right: 8px; transform: rotate(180deg); " src="img/UserFirstIMG/JIANTOU(1).png"/>
														<a  id="hellouser" style="margin-top: 3px; color: white; float: right; font-size: 12px;text-decoration: none;" href="javascript:void(0)">你好，${user.username } </a>
													</div>
													<div id="user-info-hide-body" style=" height: 150px;">
														
																<div id="user-info-hide-body-1" style=" height: 60px;">
																	<img src="img/index2Imgs/diqiu.png" style="width: 50px; height: 50px; margin: 5px;"/>
																	
																	<a style="font-size: 14px; position: absolute; left: 65px; top: 65px;color: #555555;">${user.tel }</a>
																	<a href="" class="han-a-hover-orange-text-decoration" style="font-size: 13px; position: relative;top: -8px;">账户设置</a>
																	<a style="font-size: 12px; text-decoration: none;position: relative;top: -8px;color: #2F4056;">|</a>
																	<a href="" class="han-a-hover-orange-text-decoration" style="font-size: 13px;position: relative;top: -8px;">交易记录</a>
																	
																</div>
																<div id="user-info-hide-body-2" style="background-color: white; border-bottom: 0.1px dashed #DDDDDD;border-width: 80%; height: 45px;">
																		<a style="font-size: 13px; text-decoration: none;position: relative;top: 18px;left:10px; color:#555555 ;">账户余额：</a>
																		<a href="" id="top-hide-showmoney" style=" background-color: lightblue; border: #E2E2E2 1px solid; text-decoration: none;  border-radius:4px ; padding: 3px; font-size: 13px;position: relative;top: 18px;left:10px;">显示余额</a>
																		<a href="" class="han-a-hover-orange-text-decoration" style="font-size: 13px;position: relative;top: 18px;left:10px;">充值</a>
																		
																</div>
																<div id="user-info-hide-body-3" style="background-color: white; height: 45px;">
																		<a href="" class="han-a-hover-orange-text-decoration" style="font-size: 13px;position: relative;top: 15px;left:10px;">余额宝</a>
																	<a style="font-size: 12px; text-decoration: none;position: relative;top: 13px;left:10px;color: #2F4056;">|</a>
																		<a href="" class="han-a-hover-orange-text-decoration" style="font-size: 13px;position: relative;top: 15px;left:10px;">理财</a>
																	<a style="font-size: 12px; text-decoration: none;position: relative;top: 13px;left:10px;color: #2F4056;">|</a>
																		<a href="" class="han-a-hover-orange-text-decoration" style="font-size: 13px;position: relative;top: 15px;left:10px;">其他资产</a>
																		
																</div>
														
													</div>
													
												</div>
												
												
												
												
												
				</div><!---->
				
				<!--logo层div-->
				<div  id="bodyBody" style="width: 100%; height:75px;">
					<div id="BodyBodyContent" style="width: 66%; height:75px; position: absolute; left: 17%;">
							<a href="User.jsp"><img  style=" cursor: pointer; margin-top:20px ;" src="img/index2Imgs/index2logo.png"/></a>
						
							<ul style="float: right; margin-top: 45px; ">
								<li style=" margin-left: 50px; float: left;list-style: none;">
									<a  style="color: #e0620d;font-size: 16px; text-decoration: none;font-weight: bolder;" href="javascript:void(0)">
										<img style="position: relative; top: 2px; right: 8px; " src="img/UserFirstIMG/LX.png"/>我的支付宝</a>
								</li>
								<li style="margin-left: 50px; float: left;list-style: none;">
									<a class="top_a_red"  style="color: #2F4056;font-size: 16px; text-decoration: none;font-weight: bolder;" href="javascript:void(0)">
										<img style="position: relative; top: 2px; right: 8px; " src="img/UserFirstIMG/LX(1).png"/>交易记录</a>
								</li>
								<li style="margin-left: 50px; float: left;list-style: none;">
									<a  class="top_a_red" style="color: #2F4056;font-size: 16px; text-decoration: none;font-weight: bolder;" href="javascript:void(0)">
										<img style="position: relative; top: 2px; right: 8px; " src="img/UserFirstIMG/LX(1).png"/>会员保障</a>
								</li>
								<li style="margin-left: 50px; float: left;list-style: none;">
									<a class="top_a_red"  style="color: #2F4056;font-size: 16px; text-decoration: none;font-weight: bolder;" href="javascript:void(0)">
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
								<a href="#" id="shouye"  class="top_a_red"  style="text-align: center; text-decoration: none; color: white; font-size: 12px;">首页</a></li>
								
								<li style="margin-top: 3px;  list-style: none; padding-left: 25px; padding-right: 25px; padding-top: 4px; padding-bottom: 4px; float: left;">
								<a href="#" class="top_a_red"  style="text-align: center; text-decoration: none; color: #393D49; font-size: 12px;">账户资产</a></li>
								
								<li style="margin-top: 3px; list-style: none;padding-left: 25px; padding-right: 25px; padding-top: 4px; padding-bottom: 4px; float: left;">
								<a href="#" class="top_a_red"  style="text-align: center; text-decoration: none; color: #393D49; font-size: 12px;">账户设置</a></li>
								
								<li style="margin-top: 3px;  list-style: none;  padding-left: 25px; padding-right: 25px; padding-top: 4px; padding-bottom: 4px; float: left;">
								<a href="#" class="top_a_red"  style="text-align: center; text-decoration: none; color: #393D49; font-size: 12px;">账户通</a></li>
								
								<li style="margin-top: 3px; list-style: none; padding-left: 25px; padding-right: 25px; padding-top: 4px; padding-bottom: 4px; float: left;">
								<a href="#" class="top_a_red"  style="text-align: center; text-decoration: none; color: #393D49; font-size: 12px;">商户服务</a></li>
								
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
				
				<!--头像层div-->
				<div  id="bodyBody" style="width: 100%; height:120px; opacity: 1; background-position-y: -35px;background-position-x: -550px; background-image: url(img/UserFirstIMG/xiawu.jpg);">
					<div id="BodyBodyContent" style="width: 66%; height:120px; position: absolute; left: 17%;">
						
						<img id="UserImg" style="width: 80px; height:80px; border-radius:100px ; cursor: pointer;border: 2px white solid; margin-top: 18px;"
							 src="img/index2Imgs/item2.jpg"/>
						
						
						<a id="hellotext" style="position: absolute;top: 40px; left: 100px; color: whitesmoke;"></a>
						<a href="#" style="position: absolute;top: 40px; left: 160px; color: whitesmoke; margin-right: 10px; text-decoration: none; ">${user.username }</a>
						<a style="position: absolute;top: 45px; left: 240px; color: whitesmoke; font-size: 12px; ">转账看头像，安全有保障 </a>
						<a href="#" id="changeTouxiang" style="position: absolute;top: 45px; left: 375px; color:#1E9FFF; font-size: 12px;  text-decoration: none;">修改头像</a> 
						
						
						<a style="position: absolute;top: 80px; left: 100px; color: whitesmoke; font-size: 12px;">账户名：</a>
						<a href="#" style="position: absolute;top: 80px; left: 150px; color: whitesmoke; font-size: 14px;text-decoration: none;">${user.tel }</a>
						<a  id="shimingrenzheng2" style="position: absolute;left: 225px;top: 80px;"></a>
						<img id="shimingrenzheng" style="position: absolute;top: 80px; left: 240px;" src="img/UserFirstIMG/shimingrenzheng.png"/>
						<a  id="bindPhone2" style="position: absolute;left: 250px;top: 80px;"></a>
						<img id="bindPhone" style="position: absolute;top: 80px; left: 265px;" src="img/UserFirstIMG/shouji (2).png"/>
						<a style="position: absolute;top: 75px; left: 300px; color: white; font-size: 20px;">|&nbsp;&nbsp;&nbsp;</a>
						<a style="position: absolute;top: 80px; left: 310px; color: white; font-size: 12px;">&nbsp;&nbsp;&nbsp;上次登录时间 ：2019.02.19 18:03:08 </a>
						
						<span id="showxiaoxilist" style="cursor: pointer; position: absolute; top: 0px; left: 45%; width: 75px; height: 32px; background-color: #999999; opacity: 1; 
							border-bottom-left-radius: 5px; border-bottom-right-radius: 5px;">
							<img style="margin-left: 5px;" src="img/UserFirstIMG/xiaoxi.png"/>
							<a style="font-size: 20px;font-weight: bolder; color: whitesmoke; position: relative;bottom: -3px">12</a>
						</span>
						
					</div>
					
					
					<!--消息层隐藏的div-->
					<div hidden="hidden" id="xiaoxihidelist" style="width: 60%; height: 480px; border-bottom-left-radius:10px; border-bottom-right-radius:10px;  position: absolute; left: 20%;z-index: 1;">
						
						<div id="xiaoxihidelist-title" style="height: 40px; width: 100%; background-color: aliceblue;border: 1px solid #DDDDDD;">
						<a  style="position: absolute; left: 20px;top: 8px; color: #4476A7;font-weight: bold;">消息</a>
						</div>
						
						<div id="xiaoxihidelist-body-zhezhao" style="height: 405px; opacity: 0.9; background-color: #2F4056;"></div>
						<div id="xiaoxihidelist-body" style="height: 400px; width: 100%;  position: absolute; bottom: 40px; overflow-y: scroll;">
							
							<ul id="xiaoxi-ul" style="list-style: none; position: absolute; width: 100%; right:0px; top: -14px;">
								
								<!--退款至银行卡DIV高度100px-->
								<li id="thisLIxiaoxiID" style="width: 100%; height: 100px;border-bottom:1px solid #C2C2C2 ; position: relative;top: 15px;">
									<div id="xiaoxi-hide-body-ul-li-left" style="width: 20%; height: 100%;float: left;border-right:1px dashed #C2C2C2 ; ">
										
										<span id="" style="position: absolute; left:  60px;">
											<p  style="color: white;font-weight: bolder; position: relative; top: 15px; left: -30px;">退款至银行卡</p>
											<p style="color: #CCCCCC; font-size: 12px; margin-top: -30px; position: relative; top: 48px; left: -30px;">中国工商银行|尾号8740|</p>
											<p style="color: #CCCCCC;font-size: 12px; margin-top: -15px; position: relative; top: 66px; left: -30px;">金额：<span style="font-size: 18px; color: #5FB878;">507.00</span>元</p>
										</span>
										 
										  
									</div>
									<div id="xiaoxi-hide-body-ul-li-right"style="width: 79%; height: 100%;float: left;">
										
										<div id="5FB878yuan1" style=" position: relative; top: 34px; left: 53px;     float: left; width: 10px; height: 10px; border-radius: 5px; background-color: #5FB878;"></div>
										<div id="5FB878yuan2" style=" position: relative; top: 34px; left: 280px;   float: left; width: 10px; height: 10px; border-radius: 5px; background-color: #5FB878;"></div>
										<div id="5FB878yuan3" style=" position: relative; top: 34px; left: 520px;   float: left; width: 10px; height: 10px; border-radius: 5px; background-color: #5FB878;"></div>
										<hr width=" 480px" color="#5FB878" style="margin-top:  38px;margin-left: 60px;" /><!--淡绿的时间线，上面是三个小圆点 -->
										
										<span id="" style="position: relative; top: 20px;left:5px; float: left;">
												<p style="color: #CCCCCC; font-size: 12px; margin-top: -25px;text-align: center;">退款发往银行</p>
												<p style="color: #CCCCCC; font-size: 12px; margin-top: 0px;text-align: center;">12月06日 22点35分</p>
										</span>
										<span id="" style="position: relative; top: 20px;left: 135px; float: left;">
												<p style="color: #CCCCCC; font-size: 12px; margin-top: -25px; text-align: center;">银行受理</p>
												<p style="color: #CCCCCC; font-size: 12px; margin-top: 0px;text-align: center;">12月06日 23点00分</p>
										</span>
										<span id="" style="position: relative; top: 20px;left: 290px; float: left;">
												<p style="color: #5FB878; font-size: 12px; margin-top: -25px;text-align: center;">银行已入账</p>
												<p style="color: #CCCCCC; font-size: 12px; margin-top: 0px;text-align: center;">12月06日 22点35分</p>
										</span>
										
										<span hidden="hidden" id="hides-tips" style="position: relative; top: -30px;left: 160px; float: left;">
												<p style="color: #2D93CA; font-size: 12px; margin-top: -18px;text-align: center;">如这个时间点后退款仍未到账<br>请咨询银行</p>
												
										</span>
										
										<span hidden="hidden" id="hides-close" style="position: relative; top: -18px;left: 180px; float: left;">
											<img onclick="delDIV(this)" style="cursor: pointer;" src="img/UserFirstIMG/guanbi.png"/>
										</span>
										
									</div>
								</li>
								
								
									<li id="thisLIxiaoxiID" style="width: 100%; height: 100px;border-bottom:1px solid #C2C2C2 ; position: relative;top: 15px;">
										<div id="xiaoxi-hide-body-ul-li-left" style="width: 20%; height: 100%;float: left;border-right:1px dashed #C2C2C2 ; ">
											
											<span id="" style="position: absolute; left:  60px;">
												<p  style="color: white;font-weight: bolder; position: relative; top: 15px; left: -30px;"></p>
												<p style="color: #CCCCCC; font-size: 12px; margin-top: -30px; position: relative; top: 48px; left: -30px;">|尾号|</p>
												<p style="color: #CCCCCC;font-size: 12px; margin-top: -15px; position: relative; top: 66px; left: -30px;">金额：<span style="font-size: 18px; color: #5FB878;"></span>元</p>
											</span>
											 
											  
										</div>
										<div id="xiaoxi-hide-body-ul-li-right"style="width: 79%; height: 100%;float: left;">
											
											<div id="5FB878yuan1" style=" position: relative; top: 34px; left: 53px;     float: left; width: 10px; height: 10px; border-radius: 5px; background-color: #5FB878;"></div>
											<div id="5FB878yuan2" style=" position: relative; top: 34px; left: 280px;   float: left; width: 10px; height: 10px; border-radius: 5px; background-color: #5FB878;"></div>
											<div id="5FB878yuan3" style=" position: relative; top: 34px; left: 520px;   float: left; width: 10px; height: 10px; border-radius: 5px; background-color: #5FB878;"></div>
											<hr width=" 480px" color="#5FB878" style="margin-top:  38px;margin-left: 60px;" /><!--淡绿的时间线，上面是三个小圆点 -->
											
											<span id="" style="position: relative; top: 20px;left:5px; float: left;">
													<p style="color: #CCCCCC; font-size: 12px; margin-top: -25px;text-align: center;">退款发往银行</p>
													<p style="color: #CCCCCC; font-size: 12px; margin-top: 0px;text-align: center;">12月06日 22点35分</p>
											</span>
											<span id="" style="position: relative; top: 20px;left: 135px; float: left;">
													<p style="color: #CCCCCC; font-size: 12px; margin-top: -25px; text-align: center;">银行受理</p>
													<p style="color: #CCCCCC; font-size: 12px; margin-top: 0px;text-align: center;">12月06日 23点00分</p>
											</span>
											<span id="" style="position: relative; top: 20px;left: 290px; float: left;">
													<p style="color: #5FB878; font-size: 12px; margin-top: -25px;text-align: center;">银行已入账</p>
													<p style="color: #CCCCCC; font-size: 12px; margin-top: 0px;text-align: center;">12月06日 22点35分</p>
											</span>
											
											<span hidden="hidden" id="hides-tips" style="position: relative; top: -30px;left: 160px; float: left;">
													<p style="color: #2D93CA; font-size: 12px; margin-top: -18px;text-align: center;">如这个时间点后退款仍未到账<br>请咨询银行</p>
													
											</span>
											
											<span hidden="hidden" id="hides-close" style="position: relative; top: -18px;left: 180px; float: left;">
												<img onclick="delDIV(this)" style="cursor: pointer;" src="img/UserFirstIMG/guanbi.png"/>
											</span>
											
										</div>
									</li>
								
								
								<!--提现DIV高度100px-->
								<li id="thisLIxiaoxiID" style="width: 100%; height: 100px;border-bottom:1px solid #C2C2C2 ; position: relative;top: 15px;">
									<div id="xiaoxi-hide-body-ul-li-left" style="width: 20%; height: 100%;float: left;border-right:1px dashed #C2C2C2 ; ">
										
										<span id="" style="position: absolute; left:  60px;">
											<p  style="color: white;font-weight: bolder; position: relative; top: 15px; left: -30px;">提现</p>
											<p style="color: #CCCCCC; font-size: 12px; margin-top: -30px; position: relative; top:48px; left: -30px;">中国工商银行|尾号8740|</p>
											<p style="color: #CCCCCC;font-size: 12px; margin-top: -15px; position: relative; top: 66px; left: -30px;">金额：<span style="font-size: 18px; color: #5FB878;">123.45</span>元</p>
										</span>
										  
									</div>
									<div id="xiaoxi-hide-body-ul-li-right"style="width: 79%; height: 100%;float: left;">
										
										<div id="5FB878yuan1" style=" position: relative; top: 34px; left: 53px;     float: left; width: 10px; height: 10px; border-radius: 5px; background-color: #5FB878;"></div>
										<!--<div id="5FB878yuan2" style=" position: relative; top: 40px; left: 280px;   float: left; width: 10px; height: 10px; border-radius: 5px; background-color: #5FB878;"></div>-->
										<div id="5FB878yuan3" style=" position: relative; top: 34px; left: 530px;   float: left; width: 10px; height: 10px; border-radius: 5px; background-color: #5FB878;"></div>
										
										<hr width=" 480px" color="#5FB878" style="margin-top:  38px;margin-left: 60px;" /><!--淡绿的时间线，上面是三个小圆点 -->
										
										<span id="" style="position: relative; top: 20px;left:5px; float: left;">
												<p style="color: #CCCCCC; font-size: 12px; margin-top: -15px;text-align: center; position: relative; top: -10px;left: 5px; ">提现付款成功</p>
												<p style="color: #CCCCCC; font-size: 12px; margin-top: -15px;text-align: center; position: relative; top: 6px;left: 5px; ">2019-01-01 21:15</p>
										</span>
										<span id="" style="position: relative; top: 20px;left: 135px; float: left;">
												<p style="color: #CCCCCC; font-size: 12px; margin-top: -15px; text-align: center;"></p>
												<p style="color: #CCCCCC; font-size: 12px; margin-top: -15px;text-align: center;"></p>
										</span>
										<span id="" style="position: relative; top: 20px;left: 396px; float: left;">
												<p style="color: #5FB878; font-size: 12px; margin-top: -15px;text-align: center;  position: relative; top: -10px;left: 6px; ">银行处理成功</p>
												<p style="color: #CCCCCC; font-size: 12px; margin-top: -15px;text-align: center; position: relative; top: 6px;left: 6px; ">2019-01-01 21:16</p>
										</span>
										
										<span hidden="hidden" id="hides-tips" style="position: relative; top: -30px;left: 280px; float: left;">
												<p style="color: #2D93CA; font-size: 12px; margin-top: -15px;text-align: center; position: relative;left: 32px; "><br>如未到账请咨询银行</p>
												
										</span>
										
										<span hidden="hidden" id="hides-close" style="position: relative; top: -18px;left: 350px; float: left;">
											<img onclick="delDIV(this)" style="cursor: pointer;" src="img/UserFirstIMG/guanbi.png"/>
										</span>
										
									</div>
								</li>
								
								<!--退款至银行卡DIV高度100px-->
								<li id="thisLIxiaoxiID" style="width: 100%; height: 100px;border-bottom:1px solid #C2C2C2 ; position: relative;top: 15px;">
									<div id="xiaoxi-hide-body-ul-li-left" style="width: 20%; height: 100%;float: left;border-right:1px dashed #C2C2C2 ; ">
										
										<span id="" style="position: absolute; left:  60px;">
											<p  style="color: white;font-weight: bolder; position: relative; top: 15px; left: -30px;">充值到余额</p>
											<p style="color: #CCCCCC; font-size: 12px; margin-top: -30px; position: relative; top: 48px; left: -30px;">中国工商银行|尾号8888|</p>
											<p style="color: #CCCCCC;font-size: 12px; margin-top: -15px; position: relative; top: 66px; left: -30px;">金额：<span style="font-size: 18px; color: #5FB878;">66666.66</span>元</p>
										</span>
										  
									</div>
									<div id="xiaoxi-hide-body-ul-li-right"style="width: 79%; height: 100%;float: left;">
										
										<div id="5FB878yuan1" style=" position: relative; top: 34px; left: 53px;     float: left; width: 10px; height: 10px; border-radius: 5px; background-color: #5FB878;"></div>
										<div id="5FB878yuan2" style=" position: relative; top: 34px; left: 280px;   float: left; width: 10px; height: 10px; border-radius: 5px; background-color: #5FB878;"></div>
										<div id="5FB878yuan3" style=" position: relative; top: 34px; left: 520px;   float: left; width: 10px; height: 10px; border-radius: 5px; background-color: #5FB878;"></div>
										<hr width=" 480px" color="#5FB878" style="margin-top:  38px;margin-left: 60px;" /><!--淡绿的时间线，上面是三个小圆点 -->
										
										<span id="" style="position: relative; top: 20px;left:5px; float: left;">
												<p style="color: #CCCCCC; font-size: 12px; margin-top: -25px;text-align: center;">请求发往银行</p>
												<p style="color: #CCCCCC; font-size: 12px; margin-top: 0px;text-align: center;">2月23日 20点09分</p>
										</span>
										<span id="" style="position: relative; top: 20px;left: 135px; float: left;">
												<p style="color: #CCCCCC; font-size: 12px; margin-top: -25px; text-align: center;"> 银行受理</p>
												<p style="color: #CCCCCC; font-size: 12px; margin-top: 0px;text-align: center;">2月23日 20点16分</p>
										</span>
										<span id="" style="position: relative; top: 20px;left: 290px; float: left;">
												<p style="color: #5FB878; font-size: 12px; margin-top: -25px;text-align: center;">余额已入账</p>
												<p style="color: #CCCCCC; font-size: 12px; margin-top: 0px;text-align: center;">2月23日 20点16分</p>
										</span>
										
										<span hidden="hidden" id="hides-tips" style="position: relative; top: -30px;left: 160px; float: left;">
												<p style="color: #2D93CA; font-size: 12px; margin-top: -18px;text-align: center;">如这个时间点后退款仍未到账<br>请咨询银行</p>
												
										</span>
										
										<span hidden="hidden" id="hides-close" style="position: relative; top: -18px;left: 180px; float: left;">
											<img onclick="delDIV(this)" style="cursor: pointer;" src="img/UserFirstIMG/guanbi.png"/>
										</span>
										
									</div>
								</li>
								
								  
								
								
							</ul>
							
						</div>
						
						
						<div id="xiaoxihidelist-foot" style="height: 40px; width: 100%; border-bottom-left-radius:10px;border: 1px solid #DDDDDD; border-bottom-right-radius:10px;   position: absolute; bottom: 0px; background-color: aliceblue;">
						<a  href="#" style=" position: absolute; left: 780px;top: 8px; color: #4476A7;font-weight: bold; text-decoration: none;">查看全部消息></a>
						</div>
						
						
						
						<img id="closexiaoxihidelist" style="position: absolute;bottom: 0px;left: 49%; cursor: pointer;" src="img/UserFirstIMG/sqq.png"/>
					</div>
					
				</div>
		
		<!--转账层div-->
		<div style="width:100%;height:650px;">
			<div id="nav" >
				<ul id="mainul">
		            <li>
		                <div id='first' style="margin-top:15px;border-top:1px solid gray;background-color:#F7F7F7;">我的应用</div>
		                <ul id='two'>
		                    <li style="background: url(img/combo.jpg) no-repeat 0px -116px;">转账到支付宝</li>
		                    <li style="background: url(img/combo.jpg) no-repeat 0px 0px;">信用卡还款</li>
		                    <li style="background: url(img/combo.jpg) no-repeat 0px -290px;">转账到银行卡</li>
		                    <li style="background: url(img/combo.jpg) no-repeat 0px -58px;">水电煤缴费</li>
		                    <li style="background: url(img/combo.jpg) no-repeat 0px -175px;">手机充值</li>
		                    <li style="background: url(img/combo.jpg) no-repeat 0px -231px;">爱心捐赠</li>
		                    <li style="background: url(img/combo.jpg) no-repeat 0px -405px;">话费卡充值</li>
		                    <li style="background: url(img/combo.jpg) no-repeat 0px -348px;">医院挂号</li>
		                </ul>
		            </li>
		            <li>
		                <div id='three' style="background-color:#F7F7F7;">转账汇款</div>
		                <ul id='four'>
		                    <li style="background: url(img/combo.jpg) no-repeat 0px -290px;">转账到银行卡</li>
		                    <li style="background: url(img/combo.jpg) no-repeat 0px -116px;">转账到支付宝</li>
		                    <li style="background: url(img/combo.jpg) no-repeat 0px -175px;">手机充值</li>
		                    <li style="background: url(img/combo.jpg) no-repeat 0px -405px;">话费充值</li>
		                    <li style="background: url(img/combo.jpg) no-repeat 0px -464px;">红包</li>
		                </ul>
		            </li>
		        </ul>	
					
				
				
			</div>
			<div id="right">
				<div id="toCard">
					<div style="width: 100%;"><span id="toCard_tishi" style="line-height: 60px;text-align:center;font-size: 24px;letter-spacing: 3px;">转账到支付宝</span></div>
					<div style="width: 80%; height: 300px;margin-top: 50px;margin-left: 15%;padding-top: 20px;">
						<label>收款账户:</label>&nbsp;&nbsp;<input type="text" id="tel" name="tel" placeholder="手机号码" onblur="checkTel(this)"/>&nbsp;<a id="friends" href="javascript:void(0);" onclick="showFriendsList()">好友列表</a>
						
						<span id="checkname">&nbsp;&nbsp;<input type="checkbox" id="checkboxname" name="name" onchange="checkBoxName()"/>校验收款人姓名</span><br /><span id="checkUsername"></span><br />
						<span id="username"><label> 对方姓名:</label>&nbsp;&nbsp;<input type="text" name="username" id="usernameinput"/><br/><br/></span>
						<label>付款金额:</label>&nbsp;&nbsp;<input type="text" id="money" name="money" /><span id="moneyError"></span><br /><br />
						<label>付款说明:</label>&nbsp;&nbsp;<input type="text" id="type" name="type" value="转账"/><a href="javascript:viod(0);" id="addbeizhu" style="color: black;">&nbsp;添加备注</a><br /><br />
						<span id="beizhu">
							转账备注:&nbsp;&nbsp;<textarea rows="3" cols="35" name="description" id="description"></textarea><br />
							<span style="font-size: 14px; color: #8D8D8D;position: absolute;left: 190px;">备注内容对方可以看到。(还可以输入50个字）</span><br/>
						</span><br />
						
						<input id="btn" type="button" value="下一步" />
						<div id="friendslist">
							<div style="width: 100%;height: 40px;border-bottom: 1px solid gray;background-color:#F2F6FA;" id="friendsNav"><span style="display: block; width: 100px;height: 30px;border: 1px solid gray;text-indent:13px;border-bottom: none;position: absolute;left: 10px;top: 10px;background-color: white;border-radius:4px 4px 0px 0px;line-height:35px;">好友列表</span><a href="javascript:void(0);" onclick="closeFriendsList()" style="display: block;height: 100%;width: 10px;position: absolute;top:0px;right: 0px;">X</a></div>
							<table  style="width: 100%;border-collapse: collapse ;">
								<c:forEach var="friends" items="${friends}">
									<tr>
										<td><a href="javascript:void(0);" onclick="add(this)" style="display: block;width: 100%;height: 100%;">${friends.friend.username }(${friends.friend.tel})</a><span id="friendsId" style="display: none;">${friends.friend.id}</span><span id="friendsUserName" style="display: none;">${friends.friend.username}</span></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>		
				
		
		<div  id="bodyd" style="width: 100%;  height:auto; position:relative; bottom:0px;  background-color: #23262E ">
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
	<script type="text/javascript">
			$(function(){
				$("#btn").click(
					function(){
						var tel = $("#tel").val();
						var money = $("#money").val();
						var name = $("#usernameinput").val();
						var friendsId = $("#friendsId").html();
						if (tel == "") {
							alert(1);
							return;
						}
						if (money == "") {
							alert(1);
							return;
						}
						$.post(
							"UserServlet",
							"opr=searchBalance&username="+$("#friendsUserName").html(),
							function(rtnData){
								if (parseInt(rtnData)>parseInt(money)) {
									$.post(
										"BillServlet",
										"opr=add&tel="+tel+"&money="+money+"&typeid=4&description="+$("#description").val()+"&username="+name+"&friendsId="+friendsId+"&stateid=6",
										function(rtnData){
											if (rtnData=="true") {
												alert("转账成功！");
												location.href="User.jsp";
											}else{
												alert("转账失败！");
												return;
											}
										},
										"text"
									)
									$.post(
										"UserServlet",
										"opr=update&money="+money,
										function(rtnData){
											
										},
										"text"
									)
								}else{
									$("#moneyError").html("余额不足!");
									
								}
							},
							"text"
						)
					}
				)
				
				$("#first").click(
					function(){
						if ($("#first").next().css("display")=="none") {
							$("#two").show();
							$("#four").hide();
						}else{
							$("#two").hide();
						}
					}
				)
				
				$("#three").click(
					function(){
						if ($("#three").next().css("display")=="none") {+
							$("#four").show();
							$("#two").hide();
						}else{
							$("#four").hide();
						}
					}
				)
			
				 
				
				$("#addbeizhu").click(
					function(){
						if($("#addbeizhu").html()=="添加备注"){
							$("#addbeizhu").html("关闭备注");
							$("#beizhu").show();
						}else {
							$("#addbeizhu").html("添加备注");
							$("#beizhu").hide();
						}
					}
				)
				
				
				
			})
			
			function checkTel(thiz){
				var tel = $(thiz).val();
				$.post(
					"UserServlet",
					"opr=checkTel&tel="+tel,
					function(rtnData){
						if (rtnData!="false") {
							var len = rtnData.tel.length;
							var a = rtnData.name.substring(1,len);
							var d=rtnData.tel.substring(4);
							var l=d.length;
							var b="";
							for(var i=0;i<l;i++){
								 b+="*";
							};
							var newtel =rtnData.tel.substring(0,4)+b.toString(); 
							$("#tel").val("*"+a+"("+newtel+")");
							$("#friendsId").val(rtnData.id);
							$("#friendsUserName").val(rtnData.user.username);
						}else{
							alert(1);
						}
					},
					"json"
				)
			}
			
			function add(thiz){
				var val = $(thiz).html();
				$("#username").hide();
				$("#tel").val(val);
				$("#checkname").hide();
				$("#friendslist").hide();
			}
			
			function showFriendsList(){
				$("#friendslist").show();
			}
			function closeFriendsList(){
				$("#friendslist").hide();
			}
			function checkBoxName(){
				if ($("#checkboxname").is(":checked")){
				 	$("#username").show();	
				}else{
				 	$("#username").hide();
				}
			}
	</script>
</html>
