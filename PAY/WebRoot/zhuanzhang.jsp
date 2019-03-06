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
		<script src="layer/layer.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			
			#nav{width: 210px;display: inline-block;position:relative;left:270px;margin-right: 50px;top: 50px;float: left;height: 600px;}
			#right{width: 750px;height: 400px;margin-left: 50px;float:left;position: relative;left: 200px; border: 1px solid #F2F6FA;top:50px;font-size: 18px;}
			#right_1{width: 750px;height: 400px;margin-left: 50px;float:left;position: relative;left: 200px; border: 1px solid #F2F6FA;top:50px;font-size: 18px;}
			#nav a{text-decoration: none; color: black;}
			#first,#three{display: block; width: 210px;height: 50px;line-height: 50px;color: gray;letter-spacing: 15px;text-indent: 20px;font-size: 20px;font-weight: bold;}
			#nav ul{list-style-type: none;}
			#mainul{position: absolute;left: 0px;top: -14px;}
			#nav ul li{display:block;width:210px;line-height:60px;margin-bottom:2px;margin-top:3px;}
			
			#two li,#four li{display:block;width:210px; height:57px; line-height:57px; text-indent: 60px; color: gray;}
			#two,#four{display:none;}
			#toCard{width: 100%;height:80px;border-bottom: solid #E6EEF6 1px;background-color: #F2F6FA;border-top: solid 2px #CFDBE8;}
			#toCard_tishi{display: inline-block; width: 250px; height: 60px; background-color: white;position: relative; top: 20px; left: 50px;border: solid 1px #E6EEF6; border-radius:8px 8px 0px 0px; border-bottom: none;}
			#btn{position: relative;left: 100px;}
			#checkbox{position: relative;left: 40px;}
			#checkname{position: absolute;left: 490px;top: 131px;height: 50px;}
			#nav textarea{vertical-align: top;}
			#beizhu,#username{display: none;}
			#friendslist{width:auto;height:auto; position: absolute;left: 420px;top:105px;border:1px black solid;background-color: white;display: none;}
			#friendsNav a{float: right;padding-right: 3px; color: black;}
			#friendslist table tr{border-bottom: 1px solid gray;width:100%;height: 30px;line-height: 30px;}
			#friendslist table tr td a:hover{background-color: #DBF0FF;}
			#friendsName{display: none;width: 171px;height: 19px;border: 1px solid #A9A9A9;line-height: 18px;position: absolute;left: 190px;top:103px;background-color: white;}
			#bodyd a{text-decoration: none;color: #cccccc;}
		</style>
		
		
	</head>
	<body style="width: 100%; height: 100%; margin: 0px; padding: 0px; background-color: white;">
		<%@include file="head.jsp" %>
					
		<!--转账层div-->
		<div style="width:100%;height:650px;">
			<div id="nav" >
				<ul id="mainul">
		            <li>
		                <div id='first' style="margin-top:15px;background-color:#F7F7F7;">我的应用</div>
		                <ul id='two'>
		                    <li class="zz_xtbs" id="zhuanzhang" style="background: url(img/combo.jpg) no-repeat 0px -116px;">转账到支付宝</li>
		                    <li class="zz_xtbs" style="background: url(img/combo.jpg) no-repeat 0px 0px;">信用卡还款</li>
		                    <li class="zz_xtbs" style="background: url(img/combo.jpg) no-repeat 0px -290px;">转账到银行卡</li>
		                    <li class="zz_xtbs" style="background: url(img/combo.jpg) no-repeat 0px -58px;">水电煤缴费</li>
		                    <li class="zz_xtbs" id="chongzhi" style="background: url(img/combo.jpg) no-repeat 0px -175px;">手机充值</li>
		                    <li class="zz_xtbs" style="background: url(img/combo.jpg) no-repeat 0px -231px;">爱心捐赠</li>
		                    <li class="zz_xtbs" style="background: url(img/combo.jpg) no-repeat 0px -405px;">话费卡充值</li>
		                    <li class="zz_xtbs" style="background: url(img/combo.jpg) no-repeat 0px -348px;">医院挂号</li>
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
			
			
			<script type="text/javascript">
			$(function(){
				$("#fmz_ewm").hide();
				
				$(".zz_xtbs").hover(function(){$(this).css({"color":"#0000FF","cursor":"pointer"});},function(){$(this).css("color","#80809A");});
				$("#chongzhi").click(function(){
					$("#right_1").show();
					$("#right").hide();
				})
				$("#zhuanzhang").click(function(){
					$("#right").show();
					$("#right_1").hide();
				})
			
				$("#btn").click(
					function(){
						var tel = $("#tel").val();
						var money = $("#money").val();
						var name = $("#usernameinput").val();
						var friendsId = $("#friendsId").html();
						if (tel == "") {
							alert("手机号不能为空！");
							return;
						}
						if (money == "") {
							alert("转账金额不能为空！");
							return;
						}

						var result1 = '';
						
						 $.ajax({ 
					        type: "POST", 
					        cache: false, 
					        data: "opr=searchBalance", 
					        async: false, 
					        url: "UserServlet", 
					        dataType:'text',
					        success: function(rtnData) { 
								if (parseInt(rtnData)>=parseInt(money)) {
									result1 = "true";	
								}							
					        }
					    }); 

						
						
						if (result1=="true") {
							$.post(
								'UserServlet',
								'opr=update&money='+money+"&friendsId="+friendsId,
								function(rtnData){
									
								},
								'text'
							)
							
							$.post(
								"UserServlet",
								"opr=update&money="+money+"&inorout=out",
								function(rtnData){
										
								},
								"text"
							)
							$.post(
								"BillServlet",
								"opr=add&tel="+tel+"&money="+money+"&typeid=4&description="+$("#description").val()+"&username="+name+"&friendsId="+friendsId+"&stateid=6",
								function(rtnData){
									if (rtnData=="true") {
									}
								},
								"text"
							)
							layer.msg('转账成功!');
							location.href="User.jsp";
						}else{
							$("#moneyError").html("余额不足!");
						}
						
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
							$("#friendsUserName").val(rtnData.username);
						}else{
							
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
			function chongzhi(){
				
				var tel = $("#telnum").val();
				var money = $("#moneynum").val();
				if (tel==""||money=="") {
					alert("不能为空！");
					$("#fmz_ewm").hide();
				}else {
					$.post(
						"UserServlet",
						"opr=huafei&telnum="+tel+"&money="+$("#moneynum").val()+"&inorout=out&type='充值'",
						function(rtnData){
							if (rtnData=="true") {
								$("#fmz_ewm").attr("src","http://qr.topscan.com/api.php?text=http://47.99.191.102:8080/PAY/huafei.jsp");
								$("#fmz_ewm").show();
							} else {
								
							}
						},
						"text"
					)	
					$.post(
						"BillServlet",
						"opr=add&tel="+tel+"&money="+money+"&typeid=6&stateid=6",
						function(rtnData){
							
						},
						"text"
					)
					
					
					
				}
				
				
				
				
				
			}
	</script>
			<div id="right" >
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
			
			
			<div id="right_1" style="display: none;">
				<div id="toCard">
					<div style="width: 100%;"><span id="toCard_tishi" style="line-height: 60px;text-align:center;font-size: 24px;letter-spacing: 3px;">手机充值</span></div>
					<div style="width: 80%; height: 300px;margin-top: 50px;margin-left: 15%;padding-top: 20px;">
						<label>手机号码：</label><input id="telnum" type="text" ><br/><br/>
						<label>充值金额：</label><input id="moneynum" type="text" ><br/><br/>
						
						<input type="button" value="确认充值" onclick="chongzhi()">
						<img id="fmz_ewm" src=""style="float: right;width: 150px; height:150px; position: relative;bottom: 100px;right: 120px;">
					</div>
				</div>
			</div>
			
			
		</div>	<!-- 转账层DIV -->	
				
		
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
	
</html>

