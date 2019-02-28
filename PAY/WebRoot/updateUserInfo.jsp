<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<style>
			*{margin: 0px;padding: 0px;}
			#bodyd a{text-decoration: none;color: #cccccc;}
		</style>
		<script type="text/javascript" src="js/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			$(function(){
				var pda = $("#fmz-dym-pda").html();
				if(pda==""){
					$("#fmz-dym-pda").html("<span style='color: red;'>未添加邮箱账户名</span>");
				}
				var pdb=$("#fmz-dym-pdb").html();
					if(pdb==""){
						$("#fmz-dym-pdb").html("<span style='color: red;'>未添加手机号</span>");
					}
				$("#fmz-dym a").hover(function(){$(this).css("text-decoration","underline")},function(){$(this).css("text-decoration","none")});
			});
		</script>
		<title>用户更新</title>
	</head>
	<body style="width: 100%; height: 100%; margin: 0px; padding: 0px; background-color: white;">
	<%@include file="head.jsp" %>
	
	
	
	
	<div id="fmz-dym" style="width: 990px; height:980px;margin: 0 auto;">
			<div style="width: 990px; height: 60px;margin: 0 auto; border-bottom:1px solid lightslategray;">
				<div style="width: 990px; height:20px;margin: 0 auto;"></div>
				<span style="font-size: 20px;">账户设置</span>
			</div>
			<div style="width: 990px; height:10px;margin: 0 auto;"></div>
			<div style="width: 190px;height: 850px;background-color:gainsboro;float: left;">
				<ul style="list-style-type:none;">
					<li id="fmz-dym-lia" style="height: 50px;line-height: 50px;font-size: 16px;"><img src="img/update/main/zhanghu.png"style="position: relative;top:2px;left: 20px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;基本信息
						<img src="img/update/main/you.png" style="float: right;position: relative;top:18px;"/></li>
					<li id="fmz-dym-lib" style="height: 50px;line-height: 50px;font-size: 16px;"><img src="img/update/main/zhifubaozhanghu.png"style="position: relative;top:2px;left: 20px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;支付宝客户端设置
						<img src="img/update/main/you.png" style="float: right;position: relative;top:18px;"/></li>
					<li id="fmz-dym-lic" style="height: 50px;line-height: 50px;font-size: 16px;"><img src="img/update/main/zhanghuanquan.png"style="position: relative;top:2px;left: 20px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;安全设置
						<img src="img/update/main/you.png" style="float: right;position: relative;top:18px;"/></li>
					<li id="fmz-dym-lid" style="height: 50px;line-height: 50px;font-size: 16px;"><img src="img/update/main/xiaoxizhanghu.png"style="position: relative;top:2px;left: 20px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;付款方式和金额
						<img src="img/update/main/you.png" style="float: right;position: relative;top:18px;"/></li>
					<li id="fmz-dym-lie" style="height: 50px;line-height: 50px;font-size: 16px;"><img src="img/update/main/quangou.png"style="position: relative;top:2px;left: 20px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;应用授权和代扣
						<img src="img/update/main/you.png" style="float: right;position: relative;top:18px;"/></li>
					<li id="fmz-dym-lif" style="height: 50px;line-height: 50px;font-size: 16px;"><img src="img/update/main/yunongtongzhanghumingxichaxun.png"style="position: relative;top:2px;left: 20px;"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;消息提醒
						<img src="img/update/main/you.png" style="float: right;position: relative;top:18px;"/></li>
				</ul>
			</div>
			<div style="width: 800px;height: 910px;float: left;">
				<div style="width:740px;height: 80px;border-bottom: 1px solid lightslategray;margin: 0 auto;">
					<div style="width:700px;height: 80px;margin: 0 auto;">
						<div style="width:200px;height: 80px;line-height: 80px;float: left;">真实姓名</div>
						<div style="width:300px;height: 80px;line-height: 80px;float: left;font-size: 13px;color: lightslategrey;">${user.name }</div>
						<div style="width:200px;height: 80px;line-height: 80px;float: left;"><a href="#" style="float: right;text-decoration: none;font-size: 13px;color:#219BD9 ;">查看</a></div>
					</div>	
				</div>
				
				<div style="width:740px;height: 80px;border-bottom: 1px solid lightslategray;margin: 0 auto;">
					<div style="width:700px;height: 80px;margin: 0 auto;">
						<div style="width:200px;height: 80px;line-height: 80px;float: left;">手机</div>
						<div id="fmz-dym-pdb" style="width:300px;height: 80px;line-height: 80px;float: left;font-size: 13px;color: lightslategrey;">${user.tel }</div>
						<div style="width:200px;height: 80px;line-height: 80px;float: left;"><a href="#" style="float: right;text-decoration: none;font-size: 13px;color:#219BD9 ;">修改</a></div>
					</div>	
				</div>
				<div style="width:740px;height: 80px;border-bottom: 1px solid lightslategray;margin: 0 auto;">
					<div style="width:700px;height: 80px;margin: 0 auto;">
						<div style="width:200px;height: 80px;line-height: 80px;float: left;">淘宝会员名</div>
						<div style="width:300px;height: 80px;line-height: 80px;float: left;font-size: 13px;color: lightslategrey;">${taobao.taobaoid }</div>
						<div style="width:200px;height: 80px;line-height: 80px;float: left;"><a href="#" style="float: right;text-decoration: none;font-size: 13px;color:#219BD9 ;">查看我的淘宝</a></div>
					</div>	
				</div>
				<div style="width:740px;height: 80px;border-bottom: 1px solid lightslategray;margin: 0 auto;">
					<div style="width:700px;height: 80px;margin: 0 auto;">
						<div style="width:200px;height: 80px;line-height: 80px;float: left;">登陆密码</div>
						<div style="width:300px;height: 80px;line-height: 80px;float: left;font-size: 13px;color: lightslategrey;">登录支付宝账户时需要输入的密码</div>
						<div style="width:200px;height: 80px;line-height: 80px;float: left;"><a href="updateLogin.jsp" style="float: right;text-decoration: none;font-size: 13px;color:#219BD9 ;">重置</a></div>
					</div>	
				</div>
				<div style="width:740px;height: 80px;border-bottom: 1px solid lightslategray;margin: 0 auto;">
					<div style="width:700px;height: 80px;margin: 0 auto;">
						<div style="width:200px;height: 80px;line-height: 80px;float: left;">支付密码</div>
						<div style="width:340px;height: 80px;line-height: 80px;float: left;font-size: 13px;color: lightslategrey;">在账户资金变动，修改账户信息时需要输入的密码</div>
						<div style="width:160px;height: 80px;line-height: 80px;float: left;"><a href="#" style="float: right;text-decoration: none;font-size: 13px;color:#219BD9 ;">重置</a></div>
					</div>	
				</div>
				<div style="width:740px;height: 80px;border-bottom: 1px solid lightslategray;margin: 0 auto;">
					<div style="width:700px;height: 80px;margin: 0 auto;">
						<div style="width:200px;height: 80px;line-height: 80px;float: left;">注册时间</div>
						<div style="width:300px;height: 80px;line-height: 80px;float: left;font-size: 13px;color: lightslategrey;">${user.registeRDate }</div>
						<div style="width:200px;height: 80px;line-height: 80px;float: left;"><a href="#" style="float: right;text-decoration: none;font-size: 13px;color:#219BD9 ;">注销账户</a></div>
					</div>	
				</div>
				<div style="width:740px;height: 80px;border-bottom: 1px solid lightslategray;margin: 0 auto;">
					<div style="width:700px;height: 80px;margin: 0 auto;">
						<div style="width:200px;height: 80px;line-height: 80px;float: left;">实名账户</div>
						<div style="width:300px;height: 80px;line-height: 80px;float: left;font-size: 13px;color: lightslategrey;">查看你名下的支付宝账户</div>
						<div style="width:200px;height: 80px;line-height: 80px;float: left;"><a href="#" style="float: right;text-decoration: none;font-size: 13px;color:#219BD9 ;">查看</a></div>
					</div>	
				</div>
				<div style="width:740px;height: 80px;border-bottom: 1px solid lightslategray;margin: 0 auto;">
					<div style="width:700px;height: 80px;margin: 0 auto;">
						<div style="width:200px;height: 80px;line-height: 80px;float: left;">银行卡</div>
						<div style="width:300px;height: 80px;line-height: 80px;float: left;font-size: 13px;color: lightslategrey;">已绑定 <span style="color:chartreuse;">${cardsCount }</span> 张银行卡</div>
						<div style="width:200px;height: 80px;line-height: 80px;float: left;"><a href="#" style="float: right;text-decoration: none;font-size: 13px;color:#219BD9 ;">添加</a>
							<span  style="float: right;text-decoration: none;font-size: 13px;color:lightslategray">&nbsp;|&nbsp; </span><a href="#" style="float: right;text-decoration: none;font-size: 13px;color:#219BD9 ;">管理</a></div>
					</div>	
				</div>
				<div style="width:740px;height: 80px;border-bottom: 1px solid lightslategray;margin: 0 auto;">
					<div style="width:700px;height: 80px;margin: 0 auto;">
						<div style="width:200px;height: 80px;line-height: 80px;float: left;">收货地址</div>
						<div style="width:300px;height: 80px;line-height: 80px;float: left;font-size: 13px;color: lightslategrey;">已添加 <span style="color: chartreuse;">0</span> 个地址，最多可添加 5 个地址</div>
						<div style="width:200px;height: 80px;line-height: 80px;float: left;"><a href="#" style="float: right;text-decoration: none;font-size: 13px;color:#219BD9 ;">管理</a></div>
					</div>	
				</div>
				<div style="width:740px;height: 80px;border-bottom: 1px solid lightslategray;margin: 0 auto;">
					<div style="width:700px;height: 80px;margin: 0 auto;">
						<div style="width:200px;height: 80px;line-height: 80px;float: left;">会员保障</div>
						<div style="width:300px;height: 80px;line-height: 80px;float: left; font-size: 13px;color: lightslategrey;">账户已受全面保障</div>
						<div style="width:200px;height: 80px;line-height: 80px;float: left;"><a href="#" style="float: right;text-decoration: none;font-size: 13px;color:#219BD9 ;">查看</a></div>
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

