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
		<title></title>
		
		<link rel="stylesheet" type="text/css" href="layDate-v5.0.9/laydate/theme/default/laydate.css"/>
		<script src="layDate-v5.0.9/laydate/laydate.js" type="text/javascript" charset="utf-8"></script>
		<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
			$(function(){
				$("#1month_wzh").css("backgroundColor","gray");
				$("#type0_wzh").css("backgroundColor","gray");
				$("#state0_wzh").css("backgroundColor","gray");
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
			})
			
			
			
			function searchByTime(n){
					if (n!=0) {
						$(".monthcolor").css("backgroundColor","beige");
						var name = "#"+n+"month_wzh";
						$(name).css("backgroundColor","gray");
					}
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
					$.post(
						"BillServlet",
						"opr=search&date1="+lastMonth+"&typeid="+typeid+"&stateid="+stateid,
						function(rtnData){
							if (rtnData!="") {
								$("table tbody tr").remove();
								$.each(rtnData,function(index,item){
									var tr = "<tr>"+
													"<td><span class='itemid'>"+item.id+"</span>"+item.type.name+"</td>"+
													"<td>"+item.createDate+"</td>"+
													"<td>"+item.otheruser.username+"</td>"+
													"<td>"+item.money+"</td>"+
													"<td>"+item.state.name+"</td>"+
													"<td><a class='del' href='javascript:void(0)' onclick='del(this)'>删除</a></td>"+
											 "</tr>";
									$("table tbody").append(tr);
								})
							}else {
								$("table tbody tr").remove();
								var tr = "<tr><td colspan='6'>没有找到记录，请调整搜索条件。</td></tr>";
								$("table tbody").append(tr);
							}
						},
						"json"
					);
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
				$("#typeid").html(num);
				$(".typecolor").css("backgroundColor","beige");
				var name = "#type"+num+"_wzh";
				$(name).css("backgroundColor","gray");
				var date1 = $("#test1").val();
				var date2 = $("#test2").val();
				var stateid = $("#stateid").html();
				$.post(
					"BillServlet",
					"opr=search&typeid="+num+"&date1="+date1+"&date2="+date2+"&stateid="+stateid,
					function(rtnData){
						if (rtnData!="") {
								$("table tbody tr").remove();
								$.each(rtnData,function(index,item){
									var tr = "<tr>"+
													"<td><span class='itemid'>"+item.id+"</span>"+item.type.name+"</td>"+
													"<td>"+item.createDate+"</td>"+
													"<td>"+item.otheruser.username+"</td>"+
													"<td>"+item.money+"</td>"+
													"<td>"+item.state.name+"</td>"+
													"<td><a class='del' href='javascript:void(0)' onclick='del(this)'>删除</a></td>"+
												"</tr>";
									$("table tbody").append(tr);
								})
							}else {
								$("table tbody tr").remove();
								var tr = "<tr><td colspan='6'>没有找到记录，请调整搜索条件。</td></tr>";
								$("table tbody").append(tr);
							}
					},
					"json"
				);
			}
			
			function searchByState(num){
				$("#stateid").html(num);
				$(".statecolor").css("backgroundColor","beige");
				var name = "#state"+num+"_wzh";
				$(name).css("backgroundColor","gray");
				var date1 = $("#test1").val();
				var date2 = $("#test2").val();
				var typeid = $("#typeid").html();
				$.post(
					"BillServlet",
					"opr=search&stateid="+num+"&date1="+date1+"&date2="+date2+"&typeid="+typeid,
					function(rtnData){
						if (rtnData!="") {
								$("table tbody tr").remove();
								$.each(rtnData,function(index,item){
									var tr = "<tr>"+
													"<td><span class='itemid'>"+item.id+"</span>"+item.type.name+"</td>"+
													"<td>"+item.createDate+"</td>"+
													"<td>"+item.otheruser.username+"</td>"+
													"<td>"+item.money+"</td>"+
													"<td>"+item.state.name+"</td>"+
													"<td><a class='del' href='javascript:void(0)' onclick='del(this)'>删除</a></td>"+
												"</tr>";
									$("table tbody").append(tr);
								})
							}else {
								$("table tbody tr").remove();
								var tr = "<tr><td colspan='6'>没有找到记录，请调整搜索条件。</td></tr>";
								$("table tbody").append(tr);
							}
					},
					"json"
				);
			}
			
			function del(thiz){
				var id = $(thiz).parent().parent().find("span").html();
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
		<style>
			
			body{width: 98%;height: 100%;background-color: beige;}
			#condition_wzh,#info_wzh{width: 60%;margin-left: 20%;}
			#time_wzh{height: 40px;line-height: 40px;}
			a{text-decoration: none;color: black;display:inline-block;width: 48px;height: 25px;text-align: center;line-height: 25px;}
			#12month_wzh,#3month_wzh,#type9_wzh {width: 55px;}
			#type10_wzh,#state3_wzh{width: 65px;}
			#state4_wzh{width: 85px;}
			a:hover{background-color: gainsboro;}
			thead tr{background-color: red;}
			#info_wzh table{text-align: center;height: 50px;line-height: 50px;border-bottom: 1px solid black;}
			.del{background-color: beige;}
			#typeid,#stateid,.itemid{display: none;}
			
		</style>
	</head>
	<body>
		<div id="condition_wzh">
			<hr />
			
			<div id="time_wzh" style="margin-left: 10px;">时间：
				<input id="test1" type="text" name="date1" />&nbsp;-&nbsp;<input id="test2" type="text" name="date2">&nbsp;
				<a href="javascript:void(0)" id="today_wzh" onclick="searchByTime(1)">今天</a>&nbsp;&nbsp;|&nbsp;&nbsp;
				最近：<a id="1month_wzh" class="monthcolor" href="javascript:void(0)"  onclick="searchByTime(1)">1个月</a>&nbsp;&nbsp;&nbsp;
					<a id="3month_wzh" class="monthcolor" href="javascript:void(0)"  onclick="searchByTime(3)">3个月</a>&nbsp;&nbsp;&nbsp;
					<a id="12month_wzh" class="monthcolor" href="javascript:void(0)"  onclick="searchByTime(12)">1年</a>
			</div>
			<hr />
			<br />
			<div id="type_wzh" style="margin-left: 10px; height: 40px; line-height: 40px;">
				分类：<a id="type0_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(0)">全部</a>&nbsp;&nbsp;&nbsp;
					<a id="type1_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(1)">购物</a>&nbsp;&nbsp;&nbsp;
					<a id="type2_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(2)">线下</a>&nbsp;&nbsp;&nbsp;
					<a id="type3_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(3)">理财</a>&nbsp;&nbsp;&nbsp;
					<a id="type4_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(4)">转账</a>&nbsp;&nbsp;&nbsp;
					<a id="type5_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(5)">还款</a>&nbsp;&nbsp;&nbsp;
					<a id="type6_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(6)">缴费</a>&nbsp;&nbsp;&nbsp;
					<a id="type7_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(7)">充值</a>&nbsp;&nbsp;&nbsp;
					<a id="type8_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(8)">提现</a>&nbsp;&nbsp;&nbsp;
					<a id="type9_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(9)">还贷款</a>&nbsp;&nbsp;&nbsp;
					<a id="type10_wzh" class="typecolor" href="javascript:void(0)" onclick="searchByType(10)">手机充值</a>&nbsp;&nbsp;&nbsp;
					<span id="typeid">0</span>
			</div>
			<br />
			<div id="state_wzh" style="margin-left: 10px; height: 40px; line-height: 40px;">
				状态：<a id="state0_wzh" class="statecolor" href="javascript:void(0)" onclick="searchByState(0)">全部</a>&nbsp;&nbsp;&nbsp;
					<a id="state1_wzh" class="statecolor" href="javascript:void(0)" onclick="searchByState(1)">进行中</a>&nbsp;&nbsp;&nbsp;
					<a id="state2_wzh" class="statecolor" href="javascript:void(0)" onclick="searchByState(2)">未付款</a>&nbsp;&nbsp;&nbsp;
					<a id="state3_wzh" class="statecolor" href="javascript:void(0)" onclick="searchByState(3)">等待发货</a>&nbsp;&nbsp;&nbsp;
					<a id="state4_wzh" class="statecolor" href="javascript:void(0)" onclick="searchByState(4)">未确认收货</a>&nbsp;&nbsp;&nbsp;
					<a id="state5_wzh" class="statecolor" href="javascript:void(0)" onclick="searchByState(5)">退款</a>&nbsp;&nbsp;&nbsp;
					<a id="state6_wzh" class="statecolor" href="javascript:void(0)" onclick="searchByState(6)">成功</a>&nbsp;&nbsp;&nbsp;
					<a id="state7_wzh" class="statecolor" href="javascript:void(0)" onclick="searchByState(7)">失败</a>&nbsp;&nbsp;&nbsp;
					<span id="stateid">0</span>
			</div>
			<br />
		</div>
		<div id="info_wzh">
			<table width="100%">
				<thead>
					<tr>
						<td>分类</td>
						<td>创建时间</td>
						<td>对方名称</td>
						<td>金额</td>
						<td>状态</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bill" items="${bills}">
						<tr>
							<td>${bill.type.name }</td>
							<td>${bill.createDate }</td>
							<td>${bill.otheruser.username }</td>
							<td>${bill.money }</td>
							<td>${bill.state.name }</td>
							<td><a class="del" href="javascript:void(0)" onclick="del()">删除</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
		
		
	</body>
</html>
