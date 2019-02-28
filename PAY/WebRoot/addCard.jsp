<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>新增银行卡</title>
  </head>
   <script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript">
  		$(function(){
  			$("#addbtn").click(
  				function(){
  					var bankcardid = $("#bankcardid").val();
  					if (bankcardid==""||bankcardid.length!=20) {
						$("#bankcardid").next().html("请输入正确银行卡号！");
						return;
					}
					var bankid = $("#bankid").val();
  					if (bankid==0) {
						$("#bankid").next().html("请选择银行！");
						return;
					}
					if ($("#tel").val()=="") {
						$("#tel").next().html("请输入手机号！");
						return;
					}
					$.post(
						"CardServlet",
						"opr=add&cardNum="+bankcardid+"&bankid="+bankid,
						function(rtnData){
							if (rtnData=="true") {
								alert("添加成功！");
								location.href = "CardServlet";
							}
						},
						"text"
					)
  				}
  			)
  		})
  </script>
  <body style="background-color: #EFF0F1;">
  	<div id="addcard" style="width: 70%;height: 500px;position: absolute;background-color: white;left: 15%;top: 40px;border: 1px solid #E6E6E6;">
   		<div style="width: 100%;height: 50px;border-bottom: 1px solid black;line-height: 50px;">
   			<span style="margin-left: 10px;">新增银行卡</span>
   			<a id="addcard_close" href="javascript:void(0);" style="font-size: 24px;position: absolute;right: 10px;text-decoration: none;color: black;">X</a>
   		</div>
   		<div id="addcard_info" style="padding-top: 40px;padding-left: 15%;">
   			真实姓名：<input type="text" value="${user.name }"  readonly="readonly" style="background-color: #F2F2F2;text-indent: 5px;"/><span id=""></span><br/><br/>
   			身份证号：<input type="text" value="${user.idCard }"  readonly="readonly" style="background-color: #F2F2F2;"/><br/><br/>
   			银行卡号：<input type="text" id="bankcardid"/><span style="position: absolute;"></span><br/><br/>
   			银行名称：<select id="bankid" style="width: 171px;">
   						<option value="0">--请选择--</option>
   						<c:forEach var="banks" items="${banks}">
   							<option value="${banks.id }">${banks.name }</option>
   						</c:forEach>
   					</select><span style="position: absolute;"></span><br/><br/>
   			手机号码：<input type="text" id="tel"/><span style="position: absolute;"></span><br/>
   			<span style="font-size: 10px;color: gray;margin-left: 80px;">请填写您在银行预留的手机号码</span><br/><br/>
   			<input type="button" id="addbtn" value="同意协议并确定" style="width: 180px;height: 40px;background-color: orange;color: white;border: none;border-radius:4px;margin-left: 60px;"><br/>
   			<span style="text-decoration: underline;font-size: 12px;color: gray;margin-left: 75px;">《支付宝快捷支付服务协议》</span>
   			
   		</div>
   		<div style="position: absolute;right: 110px;top:80px;">
   			<img src="img/T1zyJiXi4kXXXXXXXX.png"><br/>
   			<span style="margin-left: -20px;">港澳台及海外用户请使用支付宝客户端绑卡</span>
   		</div>
   	</div>
  		
  </body>
</html>
