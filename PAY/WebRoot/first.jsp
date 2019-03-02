<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8" />
		<title>支付宝 知托付！</title>
		<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/layer.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/layui.all.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="css/indexCss/index.css" media="all"/>
		<link rel="stylesheet" type="text/css" href="css/layui.css" media="all"/>
		<link rel="icon" href="img/indexImgs/favicon.ico" type="image/x-icon"/>

		<script type="text/javascript">
			$(function(){
				/////////////////////////////////////////////////////////////////////////////////////////////////////
				layui.use('carousel', function(){
				  var carousel = layui.carousel;
				  //建造实例
				  carousel.render({
				    elem: '#imgs'
				    //,width: '100%' //设置容器宽度
				    ,arrow: 'none' //始终不显示箭头
				    ,full:true//是否全屏轮播
				    ,anim: 'fade' //切换动画方式
				   	,indicator:'none'
				   	,interval:4000
				  });
				});
				////
			})
			
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			function li1(){
				location.href="index.jsp";
			}
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			function li2(){
				location.href="index.jsp";
			}
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			function li3(){
				location.href="index.jsp";
			}
			/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			function login(){
				location.href="index.jsp";
			}
		</script>
	</head>
	<body >
		<div id="top">
			<img id="top-logo" width="88px"  height="30px" src="img/indexImgs/logo1.png"/>
			<p id="top-p-login">我已有支付宝账户 <a onclick="login()" href="javascript:void(0)"> 快速登录</a></p>
		</div>
		
		<div id="body">
					<div class="layui-carousel" id="imgs">
						  	<div carousel-item>
							    <div><img width="100%" height="100%" class="body-imgs" src="img/indexImgs/indexpage2.jpg"/></div>
							    <div><img width="100%" height="100%" class="body-imgs" src="img/indexImgs/indexpage1.jpg"/></div>
							    <div><img width="100%" height="100%" class="body-imgs" src="img/indexImgs/indexpage3.jpg"/></div>
						    </div>
					</div>
					<div id="bodytitle">
						<img width="600px" height="160px"  src="img/indexImgs/indexpagetitle.png"/>
						<ul>
							<li onclick="li1()"><span class="lispan">
								<img width="24px" height="24px" src="img/indexImgs/icon1.png"/><p>我是合作伙伴</p>
							</span></li>
							<li onclick="li2()"><span class="lispan">
								<img width="24px" height="24px" src="img/indexImgs/icon2.png"/><p>我是商家用户</p>
							</span></li>
							<li onclick="li3()"><span class="lispan">
								<img width="24px" height="24px" src="img/indexImgs/icon3.png"/><p>我是个人用户</p>
							</span></li>
						</ul>
					</div>
		</div>
		
		<div id="foot">
			<ul id="footul">
				<li> <a href="javascript:void(0)">蚂蚁金服集团</a>   | </li>
				<li>  <a href="javascript:void(0)"> 支付宝 </a>   | </li>
				<li> <a href="javascript:void(0)"> 余额宝 </a>   | </li>
				<li> <a href="javascript:void(0)"> 招财宝 </a>   | </li>
				<li> <a href="javascript:void(0)"> 蚂蚁商家中心 </a>   | </li>
				<li> <a href="javascript:void(0)"> 芝麻信用 </a>   | </li>
				<li> <a href="javascript:void(0)"> 蚂蚁微贷 </a>   | </li>
				<li> <a href="javascript:void(0)"> 网商银行 </a>   | </li>
				<li> <a href="javascript:void(0)"> 开放平台 </a>   | </li>
				<li> <a href="javascript:void(0)"> 诚征英才 </a>   | </li>
				<li> <a href="javascript:void(0)"> 联系我们 </a>   | </li>
				<li> <a href="javascript:void(0)"> International Business </a></li>
			</ul>
			<p id="hu">沪ICP备15027489号 </p>
			<ul>
				<li id="f1" onclick=""></li>
				<li id="f2" onclick=""></li>
				<li id="f3" onclick=""></li>
				<li id="f4" onclick=""></li>
				<li id="f5" onclick=""></li>
			</ul>
		</div>
	</body>
</html>
