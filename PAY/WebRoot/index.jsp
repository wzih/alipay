<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!--2019-2-15 - 晚上 :  写好了index.html-->
<!--2019-2-16 - 晚上 : 写好了index2.html整体框架结构-->
<!--2019-2-17 - 下午 : 写好了index2.html两种登录方式div的整体结构框架-->
<!--2019-2-18 - 10：44 : 实现了扫码登录前端代码-->
<!--2019-2-18 - 10：45 :开始写div3456加载动画-->
<!DOCTYPE html>
<html>
		<meta charset="UTF-8">
		<title>支付宝 知托付！</title>
		<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
		<script src="layer/layer.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/layer.js" type="text/javascript" charset="utf-8"></script>
		<script src="layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
		<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>  <!--获取客户端IP[搜狐接口]-->
		<link rel="stylesheet" type="text/css" href="layui/css/layui.css" media="all"/>
		<link rel="icon" href="img/indexImgs/favicon.ico" type="image/x-icon"/>
		<link rel="stylesheet" type="text/css" href="css/index2Css/index2.css"/>
		<script type="text/javascript">
			
			
			var lunindex=0;			//轮播当前index
			var lun=null;					//轮播实例
			var loginType=true;    //判断右上角切换登录方式div
			var erweimapost=null;//判断是否循环发送ajax
			
			$(function(){
				
				
				
				
				
				////////////////////////////////////////////////////////////////////////////////
					layui.use('carousel', function(){
				  var carousel = layui.carousel;
				  //建造实例
				 lun= carousel.render({
				    elem: '#test3'
				    //,width: '100%' //设置容器宽度
				    ,arrow: 'hover' //显示箭头
				    ,full:true//是否全屏轮播
				    ,anim: 'updown' //切换动画方式
				   	,autoplay:false//是否自动切换
				  });
				    $("[lay-type='sub']").css("display","none")//s一页按钮
				  $("[lay-type='add']").css("margin-bottom","60px")//下一页按钮
				   							
									   	
				   
				  ///////////////////////////////////////////////////////////////////////////////////
					 	 //监听轮播切换事件
					  	carousel.on('change(test1)', function(obj){ //test1来源于对应HTML容器的 lay-filter="test1" 属性值
					  		lunindex=obj.index;
				  				if(obj.index!=0){//当前条目的索引
				  						
				  					//显示登录
				  					$(".loginul").fadeIn();
				  					
				  					if(obj.index==1){//滑雪div
				  						ainf5();//重置动画
				  						
				  						
				  						
				  						$("#item2-ren").animate({"left":"50%","width":"800px"},1500)
				  						$("#item2-y1").animate({"left":"15%"},5000)
	  									$("#item2-y2").animate({"left":"35%"},5000)
				  						$("#item2-y3").animate({"left":"55%"},5000)
				  						$("#item2-zi").animate({"width":"400px"},2000)
										$("[lay-type='add']").css("display","block");
				  						
				  					}else if(obj.index==2){//买菜div
				  						ainf5();//重置动画
				  						$("#item3-p").animate({"left":"16%"},2000)
	  									$("#item3-s").animate({"right":"0%"},2000)
	  									$("#item3-zi").animate({"width":"400px"},2000)
	  									$("[lay-type='add']").css("display","block");
				  					}else if(obj.index==3){//海淘div
				  						ainf5();//重置动画
				  						
				  						$("#item4-bj").animate({"width":"103%"},3000);
				  						$("#item4-zi").animate({"width":"400px"},2000);
										$("[lay-type='add']").css("display","block");
				  					}else if(obj.index==4){//电影div
				  						ainf5();//重置动画
				  						$("#item5-zi").animate({"width":"360px"},2000);
				  						$("#item5-bj").animate({"width":"103%"},2000);
				  						$("[lay-type='add']").css("display","block");
				  					}else if(obj.index==5){//看病div
				  						ainf5();//重置动画
				  							$("#item6-zi").animate({"width":"380px"},2000);
				  							$("#item6-bj").animate({"width":"103%"},2000);
				  							 $("[lay-type='add']").css("display","block");
				  					}else if(obj.index==6){
				  						ainf5();//重置动画
				  					$("[lay-type='add']").css("display","none")
				  					}
				  					
				  					
				  				}else{
				  					//登录和注册按钮在index非首页出现
				  						$(".loginul").fadeOut();
				  							
				  						$("[lay-type='add']").css("display","block");
				  					   
				  						
				  				}
				  				
				  				
						});
				  
				});
				///////////////////////////////////////////////////////////////////
				//客户服务li悬浮事件
				$(".topli3").parent().hover(function(){
					//$("#jiantou").animate({"transform":"rotate(180deg)"},"fast",function(){})
						$("#jiantou").css("transform","rotate(180deg)");
						$(".hideul").fadeIn();
						$(".hideul").hover(function(){
									$(".hideul").show();
									$(".hideul").css("z-index","999999")
								},function(){
									$("#jiantou").css("transform","rotate(0deg)");
									$(".hideul").fadeOut();
								});
				})
				///////////////////////////////////////////////////////////////////////////////
				//使用帮助a标签悬浮事件
				$("#hepldivshow").hover(function(){
					$("#hepldivshow").css("color","#007DDB");
					$("#useHelp").fadeIn();
					$("#erweima").hide();
				},function(){
					$("#hepldivshow").css("color","white");
					$("#useHelp").hide();
					$("#erweima").fadeIn();
				})
				
				
				
				$("#wangjipwd").hover(function(){
					$("#wangjipwd").css("color","#007DDB")
				},function(){
					$("#wangjipwd").css("color","white")
				})
			
				
				
			})//$(function{///})
			
			//动画重置方法
			function ainf5(){
				$("#item2-ren").animate({"left":"80%","width":"500px"},0)
				$("#item2-y1").animate({"left":"-30%"},0)
				$("#item2-y2").animate({"left":"-30%"},0)
				$("#item2-y3").animate({"left":"100%"},0)
				$("#item2-zi").animate({"width":"1px"},5)
				
				$("#item3-zi").animate({"width":"10px"},5)
				$("#item3-p").animate({"left":"0%"},0)
				$("#item3-s").animate({"right":"-50%"},0)
				
				$("#item4-zi").animate({"width":"5px"},5)
				$("#item5-zi").animate({"width":"5px"},5)
				$("#item6-zi").animate({"width":"5px"},5)
				 
				$("#item4-bj").animate({"width":"100%"},0);
				$("#item5-bj").animate({"width":"100%"},0);
				$("#item6-bj").animate({"width":"100%"},0);
				
			}
					
			//登录按钮单击事件
			function layerLogin(){
				$("#logindazhezhao").show();
				
				$("#loginpage").show();
				erweimapost = setInterval("erweimaPost()",1000);
			
			}
			
			//关闭遮罩
			function closezhezao(){
				$("#logindazhezhao").hide();
				$("#loginpage").hide();
				
				setTimeout(function(){
						$.post(//发一个ajax到服务器清除扫码
						"UserServlet",
						"opr=ClearIamshaomaPage",
						function(rtnData){},
						"text"
						);
				},0)
				
			}
			
			
						
			//切换登录方式
			function changeloginType(){
						if(loginType){
							
							clearInterval(erweimapost);//停止发送Ajax
							//账户密码
							$("#loginType2").show();
							
							$("#shaomadenglu").hide();
							$("#erweima").hide();
							//$("#useHelp").hide();
							$("#plaseshao").hide();
							$("#loginhelp").hide();
							 $("#logintypeimg").css("background-position-x","0px");
							$("#logintypeimg").css("background-position-y","0px");
											loginType=false;
						}else{
							//二维码
							$("#loginType2").hide();
							$("#shaomadenglu").show();
							$("#erweima").show();
							$("#plaseshao").show();
							$("#loginhelp").show();
							$("#logintypeimg").css("background-position-x","-98px");
							$("#logintypeimg").css("background-position-y","-100px");
							
							erweimapost = setInterval("erweimaPost()",1000);
							
							
							loginType=true;
							
						}
									
							
			}
					
			//二维码方式登录时重复发送ajax-Post请求
			function erweimaPost(){
				
				$.post(
					"UserServlet",
					"opr=sm&uip="+returnCitySN["cip"]+"&ucity="+returnCitySN["cname"],
					function(rtnData){//out.print("smok"+uip);后台
						var smokandip ="smok"+returnCitySN["cip"];
						if(rtnData==smokandip){
							$("#shaomaOKtips").show();
							$("#shaomaOKimg").show();
						}else{
							$("#shaomaOKtips").hide();
							$("#shaomaOKimg").hide();
						}
							
						
					},
					"text"
				);
					
			}
			
			function checkUser(){
				var username= $("#userLoginname").val();
				var loginPWD= $("#userLoginPassword").val();
				$.post(
					"UserServlet",
					"opr=login&tel="+username+"&loginPWD="+loginPWD,
					function(rtnData){
						if (rtnData=="true") {
							location.href="User.jsp";
						}else{
							$("#loginError").html(rtnData);
						}
					},
					"text"
				);
			};
			
			function zhuce(){
				location.href="zhuce.jsp";
			}
			
		</script>
		
	<head>
		<div id="top">
				<div id="toptitle"></div>
				<div id="topzhezhao"></div><!--顶部遮罩层-->
				<div id="topbody">
					<ul>
						<li><a id="topli1" class="topli" href="javascript:void(0)">个人</a></li>
						<li><a class="topli" href="javascript:void(0)">企业</a></li>
						<li><a class="topli" href="javascript:void(0)">合作伙伴</a></li>
						<li><a class="topli2" href="javascript:void(0)">支付宝APP&nbsp;&nbsp;&nbsp;&nbsp;|</a></li>
						<li><a class="topli3" href="javascript:void(0)">客户服务</a><img id="jiantou" src="img/index2Imgs/down.png"/></li>
					</ul>
					<ol class="hideul">
						<li><a  href="javascript:void(0)">服务大厅</a></li>
						<li><a  href="javascript:void(0)">自助服务</a></li>
						<li><a  href="javascript:void(0)">提建议</a></li>
					</ol>
								<img width="114" height="40" src="img/index2Imgs/index2logo.png"/>
								<div id="top2ul">
									<ul>
										<li><a style="color: #00BFFF;" href="javascript:void(0)">首页</a></li>
										<li><a href="javascript:void(0)">财富中心</a></li>
										<li><a href="javascript:void(0)">安全保障</a></li>
										<li>|</li>
										<li><a href="javascript:void(0)">商家中心</a></li>
										<li><a  href="javascript:void(0)">开放平台</a></li>
									</ul>
								</div>
								
				</div>		
								<ul class="loginul">
							    	<li  onclick="layerLogin()" id="xl1"><a>登录</a></li>
							    	<li id="xl2"><a>注册</a></li>
							    </ul>
		</div>
	</head>
	<body style="margin: auto;">
			<div class="layui-carousel" id="test3" lay-filter="test1">
				  <div carousel-item >
				  
				  		<div id="item1">
							    	<video width="100%"  autoplay loop ><!--视频自动重复播放-->
							    		<source src="img/index2Imgs/index2video.mp4" type="video/mp4"> </source>
							    	</video>
							    	<div id="item1zhezhao"></div><!--遮罩层-->
							    	<div id="item1body"><!--主题-->
							    		<img width="33%" src="img/index2Imgs/change.png"/>
							    		<ul>
							    			<li  onclick="layerLogin()" id="l1"><a>登录</a></li>
							    			<li id="l2"><a href="javascript:void(0)" onclick="zhuce()">立即注册</a></li>
							    		</ul>
							    	</div>
							    	
							    	
					    </div>
				    
					    <div id="item2">
					    	<div id="item2-img">
					    		<img width="100%" src="img/index2Imgs/item2.jpg"/>
					    		<img id="item2-y1" src="img/index2Imgs/itme2-1.png"/>
					    		<img id="item2-y2"  src="img/index2Imgs/item2-2.png"/>
					    		<img id="item2-y3"  src="img/index2Imgs/item2-3.png"/>
					    		<img id="item2-ren"  src="img/index2Imgs/item2-ren.png"/>
					    		<img id="item2-zi"  src="img/index2Imgs/item2-zi.png"/>
					    	</div>
					    	
					    	<div style="position: fixed; bottom: 0%; height: 80px; width: 100%; opacity: 0.3; background-color: black;" id="item2zhezhao"></div>
					    	
					    	<div style="position: fixed; bottom: 0%; height: 80px; width: 100%; " id="zhezhao-zi">
					    		<span style="position: absolute;top: 20px; width: 500px; left: 400px; " id="">
					    			<img style="border-right: 1px solid whitesmoke; width: 50px;  float: left; padding-right: 20px; margin-right: 20px;" src="img/icon/zhuanzhang.png"/>
					    			<p style="color: white; font-size: 18px;">转账付款</p>
									<p style="color: white;">转到支付宝账户，瞬间到账 | 转到银行卡，2小时到账</p>
					    		</span>
					    	</div>
					    	
					    	
					    	
					    	
					    </div>
					    
					    <div id="item3">
					    			<div id="item2-img">
							    		<img width="100%" src="img/index2Imgs/item3.jpg"/><!--每个背景图-->
							    		<img id="item3-p" src="img/index2Imgs/item3-1.png"/><!--扫码喷枪-->
							    		<img id="item3-s"  src="img/index2Imgs/item3-2.png"/><!--手臂-->
							    		<img id="item3-zi"  src="img/index2Imgs/item3-zi.png"/><!--字-->
							    	</div>
							    	
							    	<div style="position: fixed; bottom: 0%; height: 80px; width: 100%; opacity: 0.3; background-color: black;" id="item2zhezhao"></div>
							    	
							    	<div style="position: fixed; bottom: 0%; height: 80px; width: 100%; " id="zhezhao-zi">
							    		<span style="position: absolute;top: 20px; width: 500px; left: 100px; ">
							    			<img style="border-right: 1px solid whitesmoke; width: 50px;  float: left; padding-right: 20px; margin-right: 20px;" src="img/icon/saoma.png"/>
							    			<p style="color: white; font-size: 18px;">扫描二维码或条码付款</p>
											<p style="color: white;">自动识别不安全链接，安心付款 </p>
							    		</span>
							    		
							    		<span style="position: absolute;top: 20px; width: 500px; left: 600px; ">
							    			<img style="border-right: 1px solid whitesmoke; width: 50px;  float: left; padding-right: 20px; margin-right: 20px;" src="img/icon/fukuanma.png"/>
							    			<p style="color: white; font-size: 18px;">出示付款码付款</p>
											<p style="color: white;">付款码每次不同，保障付款安全 </p>
							    		</span>
							    		
							    		<span style="position: absolute;top: 20px; width: 500px; left: 1100px; " >
							    			<img style="border-right: 1px solid whitesmoke; width: 50px;  float: left; padding-right: 20px; margin-right: 20px;" src="img/icon/icon-test.png"/>
							    			<p style="color: white; font-size: 18px;">通过声波收付款</p>
											<p style="color: white;">没有网络也能收款付款 </p>
							    		</span>
							    		
							    	</div>
					    	
					    </div>
					    
						<div id="item4">
					    			
					    			<div id="item2-img">
							    		<img id="item4-bj" width="100%" src="img/index2Imgs/item4.jpg"/><!--每个背景图-->
							    		<img id="item4-zi"  src="img/index2Imgs/item4-zi.png"/>
							    	</div>
							    	
							    	<div style="position: fixed; bottom: 0%; height: 80px; width: 100%; opacity: 0.3; background-color: black;" id="item2zhezhao"></div>
							    	
							    	<div style="position: fixed; bottom: 0%; height: 80px; width: 100%; " id="zhezhao-zi">
							    		<span style="position: absolute;top: 20px; width: 500px; left: 100px; ">
							    			<img style="border-right: 1px solid whitesmoke; width: 50px;  float: left; padding-right: 20px; margin-right: 20px;" src="img/icon/yunshu-.png"/>
							    			<p style="color: white; font-size: 18px;">国际运输</p>
											<p style="color: white;">如淘宝购物般简单，无需办理转运  </p>
							    		</span>
							    		
							    		<span style="position: absolute;top: 20px; width: 500px; left: 600px; ">
							    			<img style="border-right: 1px solid whitesmoke; width: 50px;  float: left; padding-right: 20px; margin-right: 20px;" src="img/icon/zhengpinbaozhang.png"/>
							    			<p style="color: white; font-size: 18px;">品牌正品</p>
											<p style="color: white;">海外商家直发，100%正品保证  </p>
							    		</span>
							    		
							    		<span style="position: absolute;top: 20px; width: 500px; left: 1100px; " >
							    			<img style="border-right: 1px solid whitesmoke; width: 50px;  float: left; padding-right: 20px; margin-right: 20px;" src="img/icon/rmb.png"/>
							    			<p style="color: white; font-size: 18px;">人民币付款</p>
											<p style="color: white;">无需外币兑换费，无需双币种信用卡</p>
							    		</span>
							    		
							    	</div>
					    			
					    	
					    </div>
					 
					 	<div id="item5">
					 		
					    			<div id="item2-img">
							    		<img id="item5-bj"  width="100%" src="img/index2Imgs/item5.jpg"/><!--每个背景图-->
							    		<img id="item5-zi"  src="img/index2Imgs/item5-zi.png"/>
							    	</div>
							    	
							    	<div style="position: fixed; bottom: 0%; height: 80px; width: 100%; opacity: 0.3; background-color: black;" id="item2zhezhao"></div>
							    	
							    	<div style="position: fixed; bottom: 0%; height: 80px; width: 100%; " id="zhezhao-zi">
							    		<span style="position: absolute;top: 20px; width: 500px; left: 100px; ">
							    			<img style="border-right: 1px solid whitesmoke; width: 50px;  float: left;  padding-right: 20px; margin-right: 20px;" src="img/icon/icon3.png"/>
							    			<p style="color: white; font-size: 18px;">赚的更多</p>
											<p style="color: white;">定期稳定收益，让你赚更多 </p>
							    		</span>
							    		
							    		<span style="position: absolute;top: 20px; width: 500px; left: 600px; ">
							    			<img style="border-right: 1px solid whitesmoke; width: 50px;  float: left;  padding-right: 20px;margin-right: 20px;" src="img/icon/49.png"/>
							    			<p style="color: white; font-size: 18px;">安全保障</p>
											<p style="color: white;">权威金融机构负责风险管理 </p>
							    		</span>
							    		
							    		<span style="position: absolute;top: 20px; width: 500px; left: 1100px; " >
							    			<img style="border-right: 1px solid whitesmoke; width: 50px;  float: left; padding-right: 20px; margin-right: 20px;" src="img/icon/waimaifuwu-shiyongfangbian.png"/>
							    			<p style="color: white; font-size: 18px;">买的方便</p>
											<p style="color: white;">一键购买，坐享收益</p>
							    		</span>
							    		
							    	</div>
					 	</div>
					    
					    <div id="item6">
					    	
					    			<div id="item2-img">
							    		<img  id="item6-bj"  width="100%" src="img/index2Imgs/item6.jpg"/><!--每个背景图-->
							    		<img id="item6-zi"  src="img/index2Imgs/item6-zi.png"/>
							    	</div>
							    	
							    	<div style="position: fixed; bottom: 0%; height: 80px; width: 100%; opacity: 0.3; background-color: black;" id="item2zhezhao"></div>
							    	
							    	<div style="position: fixed; bottom: 0%; height: 80px; width: 100%; " id="zhezhao-zi">
							    		<span style="position: absolute;top: 20px; width: 500px; left: 50px; ">
							    			<img style="border-right: 1px solid whitesmoke; width: 50px;  float: left; padding-right: 20px; margin-right: 20px;" src="img/icon/666.png"/>
							    			<p style="color: white; font-size: 18px;">挂号</p>
											<p style="color: white;">余号查询，足不出户就能挂号 </p>
							    		</span>
							    		
							    		<span style="position: absolute;top: 20px; width: 500px; left: 400px; ">
							    			<img style="border-right: 1px solid whitesmoke; width: 50px;  float: left; padding-right: 20px; margin-right: 20px;" src="img/icon/guahao.png"/>
							    			<p style="color: white; font-size: 18px;">智能导诊</p>
											<p style="color: white;">叫号与导航，按时到达科室不迷路 </p>
							    		</span>
							    		
							    		<span style="position: absolute;top: 20px; width: 500px; left: 800px; " >
							    			<img style="border-right: 1px solid whitesmoke; width: 50px;  float: left; padding-right: 20px; margin-right: 20px;" src="img/icon/555.png"/>
							    			<p style="color: white; font-size: 18px;">付医药费</p>
											<p style="color: white;">手机支付，各类医药费边走边付 </p>
							    		</span>
							    		
							    		<span style="position: absolute;top: 20px; width: 500px; left: 1200px; " >
							    			<img style="border-right: 1px solid whitesmoke; width: 50px;  float: left; padding-right: 20px; margin-right: 20px;" src="img/icon/tijianbaogao.png"/>
							    			<p style="color: white; font-size: 18px;">查看报告</p>
											<p style="color: white;">消息通知，随时查看就诊报告 </p>
							    		</span>
							    		
							    	</div>
					    </div>
					    
					    <div id="item7">
					    		
					    		
					    	<div style="position: fixed; bottom: 0px;" id="bbbbbbb">
					    		
					  
					    		
					    		
					    		
					    		<div id="colo1" style="background-color: #F5F5F5;">
		<div id="top" style="margin-left:175px;width: 1176px;height: 418px;color: darkgrey;">
			<div id="top1" style="border-bottom: 1px #A9A9A9 solid;width: 1176px;height: 141px; margin-top: 150px;">
				<div class="top1" style="margin-top: 20px;font-size: 14px;display: inline-block;width: 290px;height: 139px;vertical-align:middle;"><img style=" padding-right:10px ; float: left;" src="img/index2Imgs/kafei.png" /><p style="color:black;">付款，是件容易的事</p><br/><a href="#">付款方式<a/><span> | </span><a href="#">135家金融机构<a/></div>
				<div class="top1" style="margin-top: 20px;font-size: 14px;display: inline-block;width: 290px;height: 139px;vertical-align:middle;"><img style=" padding-right:10px ;float: left;" src="img/index2Imgs/anquanbaozhang.png" /><p style="color:black;">会员保障，安心付款</p><br/><a href="#">安全升级<a/><span> | </span><a href="#">应急服务<a/><span> | </span><a href="#">理赔服务<a/></div>
				<div class="top1" style="margin-top: 20px;font-size: 14px;display: inline-block;width: 290px;height: 139px;vertical-align:middle;"><img style=" padding-right:10px ;float: left;" src="img/index2Imgs/diqiu.png" /><p style="color:black;">海外商品，想购就购</p><br/><a href="#">全球直购<a/><span> | </span><a href="#">海外直邮<a/></div>
				<div class="top1" style="margin-top: 20px;font-size: 14px;display: inline-block;width: 290px;height: 139px;vertical-align:middle;"><img style=" padding-right:10px ;float: left;" src="img/index2Imgs/wanjufengche.png"/><p style="color:black;">玩转支付宝</p><br/><a href="#">如何购物<a/><span> | </span><a href="#">新手须知<a/><span> | </span><a href="#">我要开店<a/></div>
			</div>
			<div id="top2" style="width: 1176px;height: 141px;">
				<div class="fmztop2" style="margin-top: 40px;font-size: 14px;display: inline-block;width: 290px;height: 139px;vertical-align:middle;"><h5><a href="#">支付宝收费规则</a><span> | </span>
					<a href="#">支付宝服务协议</a><br/><br/><a href="#">支付宝隐藏权政策</a><span> | </span><a href="#">蚂蚁金服客户权益保障承诺书</a><br/><br/><br/><br/><span style="font-size: 12px;">公告</span><br /><br />
				<a style="margin-top: 5px;" href="#">支付宝服务协议的更新公告</a><br/><a href="#">关于防范和打击电信网络诈骗... </a></h5></div>
				<div class="fmztop2" style="margin-top: 40px;font-size: 14px;display: inline-block;width: 290px;height: 139px;vertical-align:middle;"><span>支付宝官方微博</span> <a href="#" style="text-decoration:underline;">+关注</a><br/><br/><br/></div>
				<div class="fmztop2" style="margin-top: 40px;font-size: 14px;display: inline-block;width: 290px;height: 139px;vertical-align:middle;"><p>下载支付宝</p>
					<img src="http://b.bshare.cn/barCode?site=weixin&url=http://47.99.191.102:8080/PAY/" /></div>
				<div class="fmztop2" style="margin-top: 40px;font-size: 14px;display: inline-block;width: 290px;height: 139px;vertical-align:middle;"><h4 style="color:black; font-weight: bolder;">支付宝E公益</h4><br/><p>帮助听力智障儿童，献爱心。</p>
					<a href="javascript:void(0)" style="text-align: center; margin-top: 15px; color: white; display: block; width: 80px; height: 25px; line-height: 25px; background-color: #555555;">立即查看</a>
					<img style="position: relative;bottom: 110px;left:180px;" src="img/index2Imgs/item7-ren.jpg"/>
				</div>
			</div>
		</div>
		</div>
		<div id="colo2" style="width: 1000000px; background-color:#000000;">
			<div id="bottom" style="color: #F5F5F5; font-size: 12px;margin-left:175px;width: 1176px;height: 194px;background-color: black;">
				<br/><br/><br/>
				<div><a href="#">诚征英才</a><span> | </span><a href="#">联系我们</a><span> | </span><a>International Business </a><span style="color: darkgrey;">泸ICP备15027489号</span></div>
				<div style="height: 5px;"></div>
				<p><a href="#">蚂蚁金服集团</a><span> | </span><a href="#">支付宝</a><span> | </span><a href="#">余额宝</a><span> | </span><a href="#">招财宝</a><span> | </span><a href="#">芝麻信用</a><span> | </span><a href="#">蚂蚁微货</a><span> | </span><a href="#">网商银行</a><span> | </span><a href="#">蚂蚁达客</a></p>
				<div style="height: 5px;"></div>
				<div><a href="#">阿里巴巴集团</a><span> | </span><a href="#">淘宝网</a><span> | </span><a href="#">天猫</a><span> | </span><a href="#">聚划算</a><span> | </span><a href="#">全球速卖通</a><span> | </span><a href="#">阿里巴巴国际交易市场</a><span> | </span><a href="#">1688</a><span> | </span><a href="#">阿里妈妈</a><span> | </span><a href="#">阿里旅行·去啊</a><span> | </span><a href="#">阿里云计算</a><span> | </span><a href="#">Alios</a><span> | </span><a href="#">阿里通信</a><span> | </span><a href="#">万网</a><span> | </span><a href="#">高德</a><span> | </span><a href="#">优视</a><span> | </span><a href="#">友盟</a><span> | </span><a href="#">虾米</a><span> | </span><a href="#">天天动听</a><span> | </span><a href="#">来往</a><span> | </span><a href="#">钉钉</a></div>
				<div style="height: 5px;"></div>
				<div>
								
								<ul>
									<li id="f1" onclick=""></li>
									<li id="f2" onclick=""></li>
									<li id="f3" onclick=""></li>
									<li id="f4" onclick=""></li>
									<li id="f5" onclick=""></li>
								</ul>
					
				</div>
			</div>
		</div>

					    		
					    		
					    		
					    		
					    		
					    	  	</div>		
					    		
					    		
					    		
					    		
					    		
					    		
					    		
					    		
					    			
					    </div>
					    
					    
				  </div>
			</div> //lun
			
			<div hidden="hidden" id="logindazhezhao" onclick="closezhezao()" style="z-index: 999999988;opacity: 0.2;background-color: black;position: fixed;top: 0%;left: 0%;width: 90000px;height: 90000px;"></div>
			<div hidden="hidden" id="loginpage" style="z-index: 999999999;position: fixed; top: 30%;  left: 41%;width: 100%;height: 100%; text-align: center;">
				<div style="opacity: 0.7; background-color: #000000; width: 20%; height: 45%;border-radius: 5px;" id="loginzhezhao"></div>
				
				<div style="  position: fixed; top: 30%;  width: 20%; height: 45%;border-radius: 5px;">
					
					
					<!--//右上角切换div--><div onclick="changeloginType()" id="logintypeimg"  style=" transition: all 0.3s; width: 98px; height: 98px; position: absolute; right: 0px; background-position-x: -98px; background-position-y: -100px;border-radius: 5px; background-image: url(img/index2Imgs/loginChange.png);"  id="divChange"></div>
					
					
											<p id="shaomadenglu" style="color: white; font-size: 18px; margin-top: 20px;margin-bottom: 10px;">扫码登录</p>
											
											<!--//二维码div--><div id="erweima"  style=" text-align: center; margin-bottom: 30px; margin-top: 20px; padding: 0px; background-color: white; width: 50%; height: 38%; position: relative; left: 25%; ">
																			<!--二维码--><img width="100%"  src="http://qr.topscan.com/api.php?text=http://47.99.191.102:8080/PAY/smLogin.jsp"/>
																			
																			<!--shaomaOK图片--><img id="shaomaOKimg"  style=" display: none; position: relative;bottom:110px;left:0px;" width="70px"  src="img/index2Imgs/smOK.png"/>
																			<!--shaomaOK提示--><p id="shaomaOKtips"   style="display: none;color: #1E9FFF;position: relative;left: 25px;bottom: 54px; width: 100px;">请在手机上确认</p>
																			
																		 </div>
											<!--//使用帮助div--><div id="useHelp"  hidden="hidden"  style=" margin-bottom: 30px; margin-top: 20px; padding:0px;background-image: url(img/index2Imgs/loginChange.png);  width: 50%; height: 38%; position: relative; left: 25%;background-position-y:-328px ; ">
												
											</div>
															<p id="plaseshao" style="color: white; font-size: 16px; font-family: '新宋体';">请使用手机支付宝扫码</p><br />
														  	<span id="loginhelp">
														  		<a id="hepldivshow" style="color: white; font-size: 12px;" href="javascript:void(0)">使用帮助</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a style="color: white; font-size: 12px;">|</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														  		<a style="color: white; font-size: 12px;" href="javascript:void(0)">下载手机支付宝</a>
														  	</span>
					
					  
					  <div id="loginType2" hidden="hidden">
					  				<p style="color: white; font-size: 18px; margin-top: 20px;margin-bottom: 10px;">登录支付宝</p>
					  				<br />
					  				<img  style="cursor: pointer; background-color: white; position: relative;bottom: 1px;left: 6px;" width="38px" height="38px" src="img/index2Imgs/用户icon.png"/>
					  				
					  				<input style="padding-left: 10px; border: 0px; width: 200px; height: 39px;" type="text" placeholder="邮箱/手机号/淘宝会员名" id="userLoginname" />
					  				<br /><br />
					  				<img  style="cursor: pointer; background-color: white; position: relative;bottom: 1px;left: 6px;" width="38px" height="39px"  src="img/index2Imgs/密码.png"/>
					  				<input style="padding-left: 10px; border: 0px; width: 200px; height: 39px;" type="password"  id="userLoginPassword" />
					  				<br />
					  				<span id="loginError" style="position: absolute;left:50px;color: red;"></span>
					  				<a id="wangjipwd" href="javascript:void(0)" style="position: relative;left:80px;top: 5px; color: white;">忘记登录密码?</a>
					  				<br /><br /><br />
					  				<input style=" cursor: pointer; border: 0px; border-radius: 5px; width: 236px; height: 36px;background-color: #007DDB;" type="button" id="loginButton" value="登录" onclick="checkUser()" />
					  				<br /><br />
					  									<span id="loginhelp">
														  		<a style="color: white; font-size: 12px;" href="javascript:void(0)">淘宝会员登录</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														  		<a style="color: white; font-size: 12px;" href="javascript:void(0)">账户激活</a>
														  		<a style="color: dodgerblue; font-size: 12px;" href="javascript:void(0)" onclick="zhuce()">立即注册</a>
														  	</span>
					  				
					  </div>
					  
					  
					  
				</div>
				
			</div>
			
			
	</body>
	<footer>
		
	</footer>
	
			
</html>

