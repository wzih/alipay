<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>我的支付宝-支付宝</title>
		<link rel="stylesheet" type="text/css" href="css/UserFirstPage.css"/>
		
		<link rel="stylesheet" type="text/css" href="layui/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="layer/theme/default/layer.css" />
		<script src="layDate-v5.0.9/laydate/laydate.js" type="text/javascript" charset="utf-8"></script>
		<script src="layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
		<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
		
		
		
		<script src="layer/layer.js" type="text/javascript" charset="utf-8"></script>
		
		<script type="text/javascript">
			var money1 = false;
			var money2 = false;
			var money3 = false;
			var infotb =null;				//表格信息
			
			var checkisshow=false;//是否批量
				var checkStatus = null;//选中行的信息
				
				$(function(){
					
				
				
				
					$("#tttttablediv").slideUp(1);
						
						//bodyBody
						var nowHour =new Date();
						var hour= nowHour.getHours();       //获取当前小时数(0-23)
						
						if(hour<6){
							
							$("#hellotext").text("凌晨好 ,")
							
						}else if(12<hour&&hour<18){
							
							$("#hellotext").text("下午好 ,")
							
						}else if(6<hour&&hour<12){
							
							$("#hellotext").text("上午好 ,")
							
						}else if(18<hour&&hour<23){
							$("#hellotext").text("晚上好 ,")
							
						}
						
						
						
							setTimeout(function(){
								layer.tips('点此查看个人信息！', '#hellouser',{
									tips: [3, '#3595CC'],
									 tipsMore: true
								});//弹出一个tips层(一次性)
							},2000)
							
						
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
									  area: ['240px', '280px'],
									  fixed: false, //不固定
									  maxmin: false,//可以最小化
									  scrollbar: false,//浏览器滚动条已锁
									  content: ['headimgs.jsp', 'no']//iframe里是否出现滚动条
									});
									
									
									
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
						
						$("#showMoney1").click(function(){
							
							if(money1==false){
								$("#showMoney1").text("隐藏金额");
								$("#Money1").css("font-size","16px");
								$("#Money1").css("color","#5FB878");
								$.post(
									"UserServlet",
									"opr=searchBalance",
									function(rtnData){
										$("#Money1").html(rtnData);
									},
									"text"
								);
								money1=true;
							}else{
								$("#showMoney1").text("显示金额");
								$("#Money1").html("**.**");
								$("#Money1").css("font-size","13px");
								$("#Money1").css("color","#4E5465");
								money1=false;
							}
						})
						
						$("#showMoney2").click(function(){
							
							if(money2==false){
								$("#showMoney2").text("隐藏金额");
								$("#Money2").css("font-size","16px");
								$("#Money2").css("color","#5FB878");
								$.post(
									"YuebaoServlet",
									"opr=search",
									function(rtnData){
										if (rtnData!=null) {
											$("#Money2").html(rtnData.balance);
										}else {
											$("#Money2").html("0.0");
										}
									},
									"json"
								);
								money2=true;
							}else{
								$("#showMoney2").text("显示金额");
								$("#Money2").html("**.**");
								$("#Money2").css("font-size","13px");
								$("#Money2").css("color","#4E5465");
								money2=false;
							}
						})
						
						$("#showMoney3").click(function(){
							
							if(money3==false){
								
								$.post(
									"HuabaiServlet",
									"opr=search",
									function(rtnDate){
										if (rtnDate==null) {
											layer.open({
												title: '提示'
												,content: '您还未开通花呗！'
											});
										} else {
											$("#showMoney3").text("隐藏金额");
											$("#Money3").css("font-size","16px");
											$("#Money3").css("color","#5FB878");
											$("#Money4").html(rtnDate.totalamount);
											$("#Money3").html(rtnDate.availableamount);
										}
									},
									"json"
								);
								$("#Money4").css("font-size","16px");
								$("#Money4").css("color","#5FB878");
								
								
								money3=true;
							}else{
								$("#showMoney3").text("显示金额");
								$("#Money3").html("**.**");
								$("#Money3").css("font-size","13px");
								$("#Money3").css("color","#9F9F9F");
								$("#Money4").html("**.**");
								$("#Money4").css("font-size","13px");
								$("#Money4").css("color","#9F9F9F");
								money3=false;
							}
						})
						
						
						
				var searchMsg = setInterval(function() {//反复有没有未读信息
					$.post(
						"UnReadMsgServlet",
						"opr=getAllmsg",
						function(rtnData){
							if(rtnData!=null){//有未读信息
								if(rtnData.size==$("#xiaoxi-ul").find("li").length){//数据量没变
								
								
								}else{//数据量有变化
									$("#xiaoxi-ul li").remove();
									$.each(rtnData,function(index,item){
									
						        	var li="<li id='"+item.id+"' style='width: 100%; height: 100px;border-bottom:1px solid #C2C2C2 ; position: relative;top: 15px;'><div id='xiaoxi-hide-body-ul-li-left' style='width: 20%; height: 100%;float: left;border-right:1px dashed #C2C2C2 ; '><span id='' style='position: absolute; left:  60px;'><p  style='color: white;font-weight: bolder; position: relative; top: 15px; left: -30px;'>"+item.type+"</p><p style='color: #CCCCCC; font-size: 12px; margin-top: -30px; position: relative; top: 48px; left: -30px;'>"+item.account+"</p><p style='color: #CCCCCC;font-size: 12px; margin-top: -15px; position: relative; top: 66px; left: -30px;'>金额：<span style='font-size: 18px; color: #5FB878;'>"+item.money+"</span>元</p></span></div><div id='xiaoxi-hide-body-ul-li-right'style='width: 79%; height: 100%;float: left;'><div id='5FB878yuan1' style=' position: relative; top: 34px; left: 53px;     float: left; width: 10px; height: 10px; border-radius: 5px; background-color: #5FB878;'></div><div id='5FB878yuan2' style=' position: relative; top: 34px; left: 280px;   float: left; width: 10px; height: 10px; border-radius: 5px; background-color: #5FB878;'></div><div id='5FB878yuan3' style=' position: relative; top: 34px; left: 520px;   float: left; width: 10px; height: 10px; border-radius: 5px; background-color: #5FB878;'></div><hr width=' 480px' color='#5FB878' style='margin-top:  38px;margin-left: 60px;' /><!--淡绿的时间线，上面是三个小圆点 --><span id='' style='position: relative; top: 20px;left:25px; float: left;'><p style='color: #CCCCCC; font-size: 12px; margin-top: -25px;text-align: center;'>转账请求发起</p><p style='color: #CCCCCC; font-size: 12px; margin-top: 0px;text-align: center;'>"+item.date+"</p></span><span id='' style='position: relative; top: 20px;left: 190px; float: left;'><p style='color: #CCCCCC; font-size: 12px; margin-top: -25px; text-align: center;'>已受理</p><p style='color: #CCCCCC; font-size: 12px; margin-top: 0px;text-align: center;'>"+item.date+"</p></span><span id='' style='position: relative; top: 20px;left: 370px; float: left;'><p style='color: #5FB878; font-size: 12px; margin-top: -25px;text-align: center;'>转账已到账</p><p style='color: #CCCCCC; font-size: 12px; margin-top: 0px;text-align: center;'>"+item.date+"</p></span><span hidden='hidden' id='hides-tips' style='position: relative; top: -30px;left: 160px; float: left;'><p style='color: #2D93CA; font-size: 12px; margin-top: -18px;text-align: center;'>如这个时间点后仍未到账<br>请咨询客服</p></span><span  id='hides-close' style='position: relative; top: -18px;left: 430px; float: left;'><img onclick='delDIV(this)' style='cursor: pointer;' src='img/UserFirstIMG/guanbi.png'/></span></div></li>";	
						        	
						        	$("#xiaoxi-ul").prepend(li) //将li插入到ul的内部前面
						        	})
								}
								
							
							}//有未读信息
						},"json"
					);
					var licount = 	$("#xiaoxi-ul").find("li").length;
					$("#xiaoxiCount").text(licount);	//显示未读信息数量
				
				}, 1000)		
				});
		</script>
		<script type="text/javascript">
			
			function delDIV(thiz){ //确认删除这信息li方法 
				
				var licount = 	$("#xiaoxi-ul").find("li").length;
				$("#xiaoxiCount").text(licount);//xiaoxi-ul.li.count//更新消息显示数量
				$.post(
				"UnReadMsgServlet",
				"opr=delmsg&msgid="+$(thiz).parent().parent().parent().attr("id"),//这个li的id
				function(rtnData){
					if(rtnData=="true"){
						$(thiz).parent().parent().parent().remove();//img>spen>div>li.remove
					}
				},"text")
				
			}
			
			function searcgoninput(){
				console.log(
						$("#usersearch").val()
						)
			}
			
			function logout(){//退出方法
				layer.msg('你确定退出吗？', {
				  time: 0 //不自动关闭
				  ,btn: ['安全退出', '取消']
				  ,yes: function(index){
				    layer.close(index);
				    location.href="UserServlet?opr=logout";
				  }
				});
				
			}
			
			
		</script>
	</head>
	<body style="width: 100%; height: 100%; margin: 0px; padding: 0px; background-color: whitesmoke;" >
				
				
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
													<a id="logOut" style="margin-top: 3px; color: white; float: right; font-size: 12px;text-decoration: none;" href="javascript:void(0)" onclick="logout()"> &nbsp;&nbsp; &nbsp;&nbsp;退出 &nbsp;  &nbsp;   &nbsp;  &nbsp;</a>
													<span id="TopUserInfo">
														<img id="jiantou111" style="float: right; margin-top:3px ; cursor: pointer;" src="img/UserFirstIMG/JIANTOU(1).png"/>
														<a  id="hellouser" style="margin-top: 3px; color: white; float: right; font-size: 12px;text-decoration: none;" href="javascript:void(0)">你好，${user.name } </a>
													</span>
												</div>
												<div hidden="hidden" id="user-info-hide" style="width: 230px; height: 150px; z-index: 1;background-color: whitesmoke; position: absolute;right: 38.3%; top: 0px;">
													<div id="user-info-hide-top" style="height: 27px; background-color: #2F4056;">
														<img  style="float: right; margin-top:3px ; cursor: pointer; margin-right: 8px; transform: rotate(180deg); " src="img/UserFirstIMG/JIANTOU(1).png"/>
														<a  id="hellouser" style="margin-top: 3px; color: white; float: right; font-size: 12px;text-decoration: none;" href="javascript:void(0)">你好，${user.name } </a>
													</div>
													<div id="user-info-hide-body" style=" height: 150px;">
														
																<div id="user-info-hide-body-1" style=" height: 60px;">
																	<img src="img/index2Imgs/diqiu.png" style="width: 50px; height: 50px; margin: 5px;"/>
																	
																	<a style="font-size: 14px; position: absolute; left: 65px; top: 65px;color: #555555;">${user.tel }</a>
																	<a href="updateUserInfo.jsp" class="han-a-hover-orange-text-decoration" style="font-size: 13px; position: relative;top: -8px;">账户设置</a>
																	<a style="font-size: 12px; text-decoration: none;position: relative;top: -8px;color: #2F4056;">|</a>
																	<a href="" class="han-a-hover-orange-text-decoration" style="font-size: 13px;position: relative;top: -8px;">交易记录</a>
																	
																</div>
																<div id="user-info-hide-body-2" style="background-color: white; border-bottom: 0.1px dashed #DDDDDD;border-width: 80%; height: 45px;">
																		<a style="font-size: 13px; text-decoration: none;position: relative;top: 18px;left:10px; color:#555555 ;">账户余额：**.**</a>
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
								<a href="updateUserInfo.jsp" class="top_a_red"  style="text-align: center; text-decoration: none; color: #393D49; font-size: 12px;">账户设置</a></li>
								
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
							 src='http://47.99.191.102:8080/PAY/UserImgs/${image}'/>
						
						<span id="imgurl" style="display: none;">${image }</span>
						<a id="hellotext" style="position: absolute;top: 40px; left: 100px; color: whitesmoke;"></a>
						<a href="#" style="position: absolute;top:       40px; left: 160px; color: whitesmoke; margin-right: 10px; text-decoration: none; ">${user.name }</a>
						<a style="position: absolute;top: 45px; left: 240px; color: whitesmoke; font-size: 12px; ">转账看头像，安全有保障 </a>
						<a href="#" id="changeTouxiang" style="position: absolute;top: 45px; left: 375px; color:#1E9FFF; font-size: 12px;  text-decoration: none;">修改头像</a> 
						
						
						<a style="position: absolute;top: 80px; left: 100px; color: whitesmoke; font-size: 12px;">账户名：</a>
						<a href="#" style="position: absolute;top: 80px; left: 150px; color: whitesmoke; font-size: 14px;text-decoration: none;">${user.tel }</a>
						<a  id="shimingrenzheng2" style="position: absolute;left: 225px;top: 80px;"></a>
						<img id="shimingrenzheng" style="position: absolute;top: 80px; left: 240px;" src="img/UserFirstIMG/shimingrenzheng.png"/>
						<a  id="bindPhone2" style="position: absolute;left: 250px;top: 80px;"></a>
						<img id="bindPhone" style="position: absolute;top: 80px; left: 265px;" src="img/UserFirstIMG/shouji (2).png"/>
						<a style="position: absolute;top: 75px; left: 300px; color: white; font-size: 20px;">|&nbsp;&nbsp;&nbsp;</a>
						<a style="position: absolute;top: 80px; left: 310px; color: white; font-size: 12px;">&nbsp;&nbsp;&nbsp;上次登录时间 ：${lastLoginDate } </a>
						
						<span id="showxiaoxilist" style="cursor: pointer; position: absolute; top: 0px; left: 45%; width: 75px; height: 32px; background-color: #999999; opacity: 1; 
							border-bottom-left-radius: 5px; border-bottom-right-radius: 5px;">
							<img style="margin-left: 5px;" src="img/UserFirstIMG/xiaoxi.png"/>
							<a id="xiaoxiCount" style="margin-left:5px; font-size: 20px;font-weight: bolder; color: whitesmoke; position: relative;bottom: -3px">3</a>
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
								
								
								
							</ul>
							
						</div>
						
						
						<div id="xiaoxihidelist-foot" style="height: 40px; width: 100%; border-bottom-left-radius:10px;border: 1px solid #DDDDDD; border-bottom-right-radius:10px;   position: absolute; bottom: 0px; background-color: aliceblue;">
						<a  href="#" style=" position: absolute; left: 780px;top: 8px; color: #4476A7;font-weight: bold; text-decoration: none;">查看全部消息></a>
						</div>
						
						
						
						<img id="closexiaoxihidelist" style="position: absolute;bottom: 0px;left: 49%; cursor: pointer;" src="img/UserFirstIMG/sqq.png"/>
					</div>
					
				</div>
				
				
				
				
				
				
				
				
				
				
				<!--主体层div-->
				<div  id="bodyw" style="width: 100%; height:auto; background-color: #E8E8E8;">
					<div id="bodyn" style="width: 66%; height:750px; position: absolute; left: 17%;">
							
							<div id="UserInfoDIV" style=" height: 300px; background-color: white; margin-top: 10px;">
								
								
								
								<div id="user-info-left1" style="height: 160px; width: 60%; background-color: white; border: 1px solid #CCCCCC; ">
									
									<span id="" style="position: absolute;left: 50px;top: 60px;">
										<a style="color: #4E5465;font-size: 16px;position: relative;right: 5px;">账户余额 &nbsp;&nbsp;</a>
										<a href="javascript:void(0)" id="showMoney1" style="position: relative;left: 7px; color: #4476A7;font-size: 12px;text-decoration: none;" >显示金额 </a>
										<br />
										<p  style="color: #4E5465;font-size: 13px;position: relative;right: 5px;top: 15px;"><span id="Money1">**.**</span> 元</p>
												<a href="#" style="position: absolute; left: 80px; top: 35px; width: 50px; height: 20px; display: block; background-color: #E9E7E7;
													 border: solid #888888 1px; border-radius: 3px; font-size: 13px;
													  text-decoration: none; text-align: center;  margin-left: 10px; margin-right: 20px; font-weight: bold; color: #555555; line-height: 20px;">充值</a>
													  
												<a href="#" style="position: absolute; left: 140px; top: 35px; width: 50px; height: 20px; display: block; background-color: #E9E7E7;
													 border: solid #888888 1px; border-radius: 3px; font-size: 13px;
													  text-decoration: none; text-align: center;  margin-left: 10px; margin-right: 20px; font-weight: bold; color: #555555; line-height: 20px; ">提现</a>
											  
											  	<a href="zhuanzhang.jsp" style="position: absolute; left: 200px; top: 35px; width: 50px; height: 20px; display: block; background-color: #E9E7E7;
													 border: solid #888888 1px; border-radius: 3px; font-size: 13px;
													  text-decoration: none; text-align: center;   margin-left: 10px; margin-right: 20px; font-weight: bold; color: #555555; line-height: 20px; ">转账</a>
											  
											  	<a href="#" style="position: absolute; left: 270px; top: 37px; margin-left: 10px; width: 50px;color:#2D93CA; font-size: 12px; text-decoration: none; ">查看</a>
													  
									</span>
									
									
									
								</div>
								
								<div id="user-info-left2" style="height: 140px; width: 60%;  background-color: white; border-left: 1px solid #CCCCCC;border-bottom: 1px solid #CCCCCC; border-right: 1px solid #CCCCCC;">
									
									
									<span id="" style="position: absolute;left: 50px;top: 210px;">
										<a style="color: #4E5465;font-size: 16px;position: relative;right: 7px;">余额宝 &nbsp;&nbsp;</a>
										<a href="javascript:void(0)" id="showMoney2" style="color: #4476A7;font-size: 12px;text-decoration: none;position: relative;left:20px;" >显示金额 </a>
										<br />
										<p style="color: #4E5465;font-size: 13px; float: left;position: relative;right: 7px;top: 15px;"><span id="Money2">**.**</span> 元</p>
												<a href="#" style="position: absolute; left: 88px; top: 35px; width: 50px; height: 20px; display: block; background-color: darkorange;
													 border: solid darkorange 1px; border-radius: 3px; font-size: 13px;
													  text-decoration: none; text-align: center;  float: left; margin-right: 20px; font-weight: bold; color: whitesmoke; line-height: 20px;">转入</a>
													  
												<a href="#" style="position: absolute; left: 150px; top: 35px; width: 50px; height: 20px; display: block; 
													 font-size: 12px;text-decoration: none;  float: left; margin-right: 20px; margin-left: 15px; margin-top: 2px;  color: #1E9FFF; ">转出</a>
											  
											  <a href="#" style="position: absolute; left: 206px; top: 35px; width: 50px; height: 20px; display: block; 
													 font-size: 12px;text-decoration: none;  float: left; margin-right: 20px; margin-left: 15px; margin-top: 2px;  color: #1E9FFF; ">管理</a>
											  
											  	
											  
											  	<a href="#" style="position: absolute; left: 270px; top: 37px; width: 150px; font-size: 12px; color:#333333; text-decoration: none; ">累计收益<span id="" style="color:#2D93CA;">0.00</span>  元 [?]</a> 
													  
									</span>
									
									
								</div>
								
								<div id="user-info-right1" style="height: 300px; width: 20%; position: absolute;left: 60%;top: 10px; background-color: white;border-bottom: 1px solid #CCCCCC;border-top: 1px solid #CCCCCC;border-left: 1px solid #CCCCCC; ">
										
										<span id="" style="position: absolute;left: 10px;top: 30px;">
											
										<img src="img/UserFirstIMG/huabei.png" style="position: absolute; left: 0px; top: -10px;"/>
										<a style="color: #4E5465;font-size: 16px;position: relative; left: 33px;">花呗 &nbsp;&nbsp;</a>
										<a href="javascript:void(0)" id="showMoney3" style="color: #4476A7;font-size: 12px;text-decoration: none;position: relative; left: 20px;" > &nbsp;&nbsp;显示金额 </a>
										<img style="position: absolute; top: 5px; left: 160px;" src="img/UserFirstIMG/tubiao-.png"/>
										<br /><br />	
										<p style="color: #9F9F9F;font-size: 13px;margin-left: 5px;">可用额度</p>
										<p   style="margin-left: 5px;color: #9F9F9F;font-size: 13px;position: absolute;top: 70px; width: 300px; "><span id="Money3">**.**</span> 元</p>
										<p    style="margin-left: 5px;color: #9F9F9F;font-size: 13px; position: absolute;top: 96px; width: 300px;">总额度:<span id="Money4">**.**</span> 元</p>
											  <a href="#" style="position: absolute; left: 6px; top: 170px; width: 50px; height: 20px; display: block; background-color: #E9E7E7;
													 border: solid #888888 1px; border-radius: 3px; font-size: 13px;
													  text-decoration: none; text-align: center; float: left; margin-right: 20px; font-weight: bold; color: #555555; line-height: 20px; ">查看</a>
											  
										<p style="color: #9F9F9F;font-size: 13px; margin-top: 90px;position: absolute; top: 150px; left: 5px; width: 200px;">这月买，下月还！</p>
											  	
									</span>
										
								</div>
								
								<div id="user-info-right2" style="height: 300px; width: 20%; position: absolute;left: 80%;top: 10px; background-color: white;border: 1px solid #CCCCCC; ">
											<span id="" style="position: absolute;left: 10px;top: 30px;">
												<a style="color: #4E5465;font-size: 16px;">其他账户 &nbsp;&nbsp;</a>
												<a href="javascript:void(0)" id="" style="color: #4476A7;font-size: 12px;text-decoration: none; position: absolute; top: 5px; left: 140px; width: 40px;" > &nbsp;&nbsp;更多> </a>
												<br />	
												<img style="position: relative; top: 10px;" src="img/UserFirstIMG/linedesign-08.png"/>
												<a style="color: #666666;font-size: 13px; position: relative; top: 10px; ">银行卡：</a>
												<a href="BankServlet" style="text-decoration: none; color:#2D93CA; font-size: 13px; position: relative; top: 10px;  ">管理</a>
												<hr color="#D3D4D3"  style="width: 130%; position: relative; top: 10px;" />  
												  	
												<img style="position: relative; top: 10px;" src="img/UserFirstIMG/alibaba.png"/>
												<a style="color: #666666;font-size: 13px;  position: relative; top: 10px; ">阿里账户：</a>
												<a href="#" style="text-decoration: none;  color:#2D93CA; font-size: 13px; position: relative; top: 10px;  ">管理</a>
													
												
												<br /><br />
												<a href="#" style="text-decoration: none; color:#2D93CA; font-size: 13px; ">进入账户通</a>
												  	<br />
												 <hr color="#D3D4D3"  style="width: 130%; position: relative; top: -6px;" />   	
												 <br />
												 <a style="color: #666666;font-size: 13px; ">花呗:</a>
												<a href="#" style="text-decoration: none; color:#2D93CA; font-size: 13px; ">管理</a> <br />
												<a style="color: #666666;font-size: 13px; ">红包：</a>
												<a href="#" style="text-decoration: none; color:#1E9FFF; font-size: 13px; ">1</a>
												<a style="color: #666666;font-size: 13px; ">个</a> <br />
												<a style="color: #666666;font-size: 13px; ">支付宝购物卡:</a>
												<a href="#" style="text-decoration: none; color:#2D93CA; font-size: 13px; ">管理</a>
												 
											</span>
										
								</div>
							</div>	
							
							<div id="jiluQueryDIV" style=" height: 50px; background-color: white; margin-top: 10px;border: 1px solid #CCCCCC;">
								<ul style="list-style: none; float: left; position: absolute;  top: 330px; left: 40px;">
									<li style="float: left; margin: 0px;  "><img src="img/UserFirstIMG/zhangdan.png"/></li>
									
									<li style="float: left; margin: 6px; color: #4E5465;  ">交易记录</li>
									<li style="float: left; margin: 8px; font-size: 12px;"><a href="#" style="color: #2D93CA;text-decoration: none;">充值记录</a></li>
									<li style="float: left; margin: 8px;font-size: 12px;">|</li>
									<li style="float: left; margin: 8px;font-size: 12px;"  ><a href="#" style="color: #2D93CA;text-decoration: none;">提现记录</a></li>
									<li style="float: left; margin: 8px;font-size: 12px;">|</li>
									<li style="float: left; margin: 8px;font-size: 12px;"><a href="#" style="color: #2D93CA;text-decoration: none;">退款记录</a></li>
									<li style="float: left; margin: 8px;font-size: 12px;">|</li>
									<li style="float: left; margin: 8px;font-size: 12px;"><a href="#" style="color: #2D93CA;text-decoration: none;">查看所有交易记录</a></li>
								</ul>
								
								<select name="" style="float: right; margin: 10px; width: 200px; height: 30px;">
									<option value="" style="height: 50px;">余额收支明细</option>
									<option value="" style="height: 50px;">余额包收支明细</option>
									<option value="" style="height: 50px;">花呗额度明细</option>
								</select>
								
								
							</div>
							
							<div id="search-bill" style=" height: 300px; margin-top: -10px;">

	<script type="text/javascript">
				$(function(){
						$("#1month_wzh").css({"backgroundColor":"#999999","color":"white"});
						$("#type0_wzh").css({"backgroundColor":"#999999","color":"white"});
						$("#state0_wzh").css({"backgroundColor":"#999999","color":"white"});
						var date = new Date();
						var year = date.getFullYear(); //获取年份
						var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1) : date.getMonth() + 1;
						var oldmonth = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() ) : date.getMonth();
						var date = date.getDate() < 10 ? "0" + date.getDate() : date.getDate();  
						var newDate = year+"-"+month+"-"+date;
						var oldDate = year+"-"+oldmonth+"-"+date;
						laydate.render({
						   elem: '#test1' //指定元素
						   ,value:oldDate
						});
						  
						laydate.render({
						  elem: '#test2' //指定元素
						   ,value:newDate
						});
				
				
						$(".search-a-time").click(function(){
							$(".search-a-time").css({"backgroundColor":"white","color":"#2D93CA"});
							$(this).css({"backgroundColor":"#999999","color":"white"});
						})
						$(".typecolor").click(function(){
							$(".typecolor").css({"backgroundColor":"white","color":"#2D93CA"});
							$(this).css({"backgroundColor":"#999999","color":"white"});
						})
						$(".statecolor").click(function(){
							$(".statecolor").css({"backgroundColor":"white","color":"#2D93CA"});
							$(this).css({"backgroundColor":"#999999","color":"white"});
						})

				});
				
				function searchByTime(n){
					$("#tttttablediv").slideDown(1000);
					var lastTime=new Date();
	           		var h=lastTime.getFullYear();
	           		var m=lastTime.getMonth()+1;
					var a = m-n;
	          		if(a<=0){
	            	  h=h-1;
	            	  a=12+a;
	          		}
	            	if (a < 10) 
			       	 a = "0" + a; 
					var day = lastTime.getDate();
				    var lastMonth = h.toString()+"-"+ a.toString()+"-"+day.toString();
					var stateid = $("#stateid").html();
					var typeid = $("#typeid").html();
					billtable.reload({
						url:'BillServlet',
						method:'post',
						
						where:{
							opr:'search',
							date1 : lastMonth,
							typeid : typeid,
							stateid : stateid
						},
						page:{
							curr:1
						}
					})
								
							
					
					if (n==0) {
						return lastMonth;
					} else {
						laydate.render({
						   elem: '#test1' //指定元素
						   ,value:lastMonth
						});
					}
			}
			
			function searchByType(num){
				var date1 = $("#test1").val();
				
				var stateid = $("#stateid").html();
				billtable.reload({
						url:'BillServlet',
						method:'post',
						where:{
							opr:'search',
							date1 : date1,
							typeid : num,
							stateid : stateid
						},
						page:{
							curr:1
						}
					})
			}
			
			
			function searchByState(num){
				var date1 = $("#test1").val();
				var typeid = $("#typeid").html();
				billtable.reload({
						url:'BillServlet',
						method:'post',
						where:{
							opr:'search',
							date1 : date1,
							typeid : typeid,
							stateid : num
						},
						page:{
							curr:1
						}
				})
				
			}	
			
			
			function del(thiz){
				var id = $(thiz).parent().parent().find("td:first").html();
				var date1 = $("#test1").val();
				var date2 = $("#test2").val();
				var typeid = $("#typeid").html();
				var stateid = $("#stateid").html();
				$.post(
					"BillServlet",
					"opr=del&stateid="+stateid+"&date1="+date1+"&date2="+date2+"&typeid="+typeid+"&billid="+id,
					function(rtnData){
						if (rtnData=="true") {
							$(thiz).parent().parent().remove();
						}
					},
					"text"
				);
			}			
</script>

								<div id="condition_wzh" style="background-color: white;border-left: 1px solid #CCCCCC;border-right: 1px solid #CCCCCC;">
									<hr width="46%" style="margin-left: 4%; color: whitesmoke;margin-top: -10PX;"/>
									<br />
									
									<div id="time_wzh" style="margin-left: 10px;">
										
										<a  style="color: #4E5465;font-size: 12px;margin-left: 35px;margin-right: 15px;position: relative; bottom: 3px; ">时间：</a>
											<input id="test1" type="text" name="date1" />&nbsp;-&nbsp;<input id="test2" type="text" name="date2">&nbsp;
											<a class="search-a-time" href="javascript:void(0)" id="today_wzh" onclick="searchByTime(1)"   style="">今天</a>
										<a  style="color: #4E5465;font-size: 13px;margin-left: 135px;margin-right: 15px;position: relative; bottom: 3px; ">最近：</a>
										
											<a  class="search-a-time"  id="1month_wzh"   href="javascript:void(0)"  onclick="searchByTime(1)"  >1个月</a>&nbsp;&nbsp;&nbsp;
											<a  class="search-a-time"  id="3month_wzh"   href="javascript:void(0)"  onclick="searchByTime(3)"   >3个月</a>&nbsp;&nbsp;&nbsp;
											<a  class="search-a-time"  id="12month_wzh" href="javascript:void(0)"  onclick="searchByTime(12)" >1年</a>
											
									</div>
									
									
									<br />
									<div id="type_wzh" style="margin-left: 10px; height: 40px; line-height: 40px;">
										<a  style="color: #4E5465;font-size: 12px;margin-left: 35px;margin-right: 15px;position: relative; bottom: 3px; ">分类：</a>
											<a id="type0_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(0)">全部</a>&nbsp;&nbsp;&nbsp;
											<a id="type1_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(1)">购物</a>&nbsp;&nbsp;&nbsp;
											<a id="type2_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(2)">线下</a>&nbsp;&nbsp;&nbsp;
											<a id="type3_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(3)">理财</a>&nbsp;&nbsp;&nbsp;
											<a id="type4_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(4)">转账</a>&nbsp;&nbsp;&nbsp;
											<a id="type5_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(5)">还款</a>&nbsp;&nbsp;&nbsp;
											<a id="type6_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(6)">缴费</a>&nbsp;&nbsp;&nbsp;
											<a id="type7_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(7)">充值</a>&nbsp;&nbsp;&nbsp;
											<a id="type8_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(8)">提现</a>&nbsp;&nbsp;&nbsp;
											<span style="display: none;" id="typeid">0</span>
											
									</div>
									<br />
									<div id="state_wzh" style="margin-left: 10px; height: 40px; line-height: 40px;">
											<a  style="color: #4E5465;font-size: 12px;margin-left: 35px;margin-right: 15px;position: relative; bottom: 3px; ">状态：</a>
											<a id="state0_wzh" class="statecolor" href="javascript:void(0)" onclick="searchByState(0)">全部</a>&nbsp;&nbsp;&nbsp;
											<a id="state1_wzh" class="statecolor" href="javascript:void(0)" onclick="searchByState(1)">进行中</a>&nbsp;&nbsp;&nbsp;
											<a id="state2_wzh" class="statecolor" href="javascript:void(0)" onclick="searchByState(2)">未付款</a>&nbsp;&nbsp;&nbsp;
											<a id="state3_wzh" class="statecolor" href="javascript:void(0)" onclick="searchByState(3)">等待发货</a>&nbsp;&nbsp;&nbsp;
											<a id="state4_wzh" class="statecolor" href="javascript:void(0)" onclick="searchByState(4)">未收货</a>&nbsp;&nbsp;&nbsp;
											<a id="state5_wzh" class="statecolor" href="javascript:void(0)" onclick="searchByState(5)">退款</a>&nbsp;&nbsp;&nbsp;
											<a id="state6_wzh" class="statecolor" href="javascript:void(0)" onclick="searchByState(6)">成功</a>&nbsp;&nbsp;&nbsp;
											<a id="state7_wzh" class="statecolor" href="javascript:void(0)" onclick="searchByState(7)">失败</a>&nbsp;&nbsp;&nbsp;
											
											<span style="display: none;" id="stateid">0</span>
									</div>
									<br />
								</div>
								<script src="layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
							<script type="text/javascript">
																		
																		
																		
																		
																		
																		
																		
																		
																		
								$(function(){
									 
								})
								
								
							</script>
							
								<div id="info_wzh">
											<div id="tttttablediv"  style="width: 100%;">
												<table id="demo" lay-filter="test"></table>
												
											</div>
											
											<div id="guanggao" style="margin-top: 10px;margin-bottom: 10px;padding-left: 8px;cursor: pointer;">
													 <img width="66.9%"  src="img/UserFirstIMG/guanggao1.jpg"/><img width="33.3%" src="img/UserFirstIMG/ggao2.png"/>
											</div>
											
											<!--最底层div-->
				<div  id="bodyd" style="width: 160%;  height:auto; position: absolute; left: -29.5%;  background-color: #23262E ">
					
						<div id="bottom" style="color: #F5F5F5; font-size: 12px;margin-left:10%; margin-right:10%; z-index: 3;height: 180px;">
						<br/><br/><br/>
						<div><a href="#">诚征英才</a><span> | </span><a href="#">联系我们</a><span> | </span><a href="#">International Business  </a><span style="color: darkgrey;"> 泸ICP备15027489号</span></div>
						<div style="height: 5px;"></div>
						<p><a href="#">蚂蚁金服集团</a><span> | </span><a href="#">支付宝</a><span> | </span><a href="#">余额宝</a><span> | </span><a href="#">招财宝</a><span> | </span><a href="#">芝麻信用</a><span> | </span><a href="#">蚂蚁微货</a><span> | </span><a href="#">网商银行</a><span> | </span><a href="#">虾米</a><span> | </span><a href="#">天天动听</a><span> | </span><a href="#">来往</a><span> | </span><a href="#">蚂蚁达客</a></p>
						<div style="height: 5px;"></div>
						<div><a href="#">阿里巴巴集团</a><span> | </span><a href="#">淘宝网</a><span> | </span><a href="#">天猫</a><span> | </span><a href="#">聚划算</a><span> | </span><a href="#">全球速卖通</a><span> | </span><a href="#">阿里巴巴国际交易市场</a><span> | </span><a href="#">1688</a><span> | </span><a href="#">阿里妈妈</a><span> | </span><a href="#">阿里旅行·去啊</a><span> | </span><a href="#">阿里云计算</a><span> | </span><a href="#">Alios</a><span> | </span><a href="#">阿里通信</a><span> | </span><a href="#">万网</a><span> | </span><a href="#">高德</a><span> | </span><a href="#">优视</a><span> | </span><a href="#">友盟</a><span> | </span><a href="#">钉钉</a></div>
						<div style="height: 5px;"></div>
							
						</div>
						
				</div>
											
								</div>
								
							</div>
							
							<!--//////////////////-->
							
							
					</div>
				</div>
	<script type="text/javascript">
			var billtable =null;
			$(function(){
				
						layui.use('table', function(){
						  var table = layui.table;
						  
						  //第一个实例
						billtable =  table.render({
						    elem: '#demo'
						    ,height: 500
						    ,width:1000
						    ,url: '' //数据接口
						    ,parseData: function(res){ //res 即为原始返回的数据
								    return {
								      "code": 0, //解析接口状态
								      "msg": "", //解析提示文本
								      "count": res.length, //解析数据长度
								      "data": res //解析数据列表
								    };
						  	}
						    ,page: true //开启分页
						    ,toolbar: true//仅开启工具栏，不显示左侧模板
						    ,defaultToolbar: [ 'exports','print']
						    ,page:true
						    ,title:'BillTable'
						    ,id: 'BillTable'
						    ,cols: [[ //表头
						      {field: 'id', title: '交易号', width:'13%',unresize:true, fixed: 'left'}
						      ,{field: 'typeName', title: '分类',align:'center',unresize:true, width:'9%'}
						      ,{field: 'createDate', title: '时间', width:'11%',align:'center',unresize:true, sort: true}
						      ,{field: 'description', title: '详情', width:'43%',unresize:true} 
						      ,{field: 'money', title: '金额', width: '9%',align:'center',unresize:true,sort: true}
						      ,{field: 'stateName', title: '状态', width: '9%',align:'center',unresize:true}
						      ,{field: 'del', title: '操作', width: '7%',type:'checkbox',align:'center',unresize:true}
						    ]]
						  });
						  
						});
				
			})
			function cz(){
				
						billtable.reload({
							
						  where: {}
						  ,page: {
						    curr: 1 //重新从第 1 页开始
						  }
						});
						alert(1)
						
			}
		</script>		
				
				
				
				
				
				
				
	</body>
</html>
