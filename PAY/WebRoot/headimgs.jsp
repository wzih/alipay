<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta charset="utf-8" />
		<title></title>
		<script src="js/jquery-1.12.4.js" type="text/javascript" charset="utf-8"></script>
		<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
		<script src="layui/layui.all.js" type="text/javascript" charset="utf-8"></script>
		<link rel="stylesheet" type="text/css" href="layui/css/layui.css"/>
		<script type="text/javascript">
			$(function(){
				layui.use('upload', function(){
					
						var $ = layui.jquery
  						,upload = layui.upload;
  
							 //普通图片上传
							  var uploadInst = upload.render({
							    elem: '#test1'
							    ,url: 'UserServlet?opr=changeheadimg'
							    ,data: {
								  user:function(){
									    return $('#id').text();
									  }
								}
							    ,auto:false//是否选完文件后自动上传
							    ,bindAction:'#btn'//指向一个按钮触发上传
							    ,size:100 //设置文件最大可允许上传的大小，单位 KB
							    
							    ,choose:function(obj){//选择文件后的回调函数
							      //预读本地文件示例，不支持ie8
							      obj.preview(function(index, file, result){
							        $('#demo1').attr('src', result); //图片链接（base64）
							        
							        //console.log(index); //得到文件索引
     								//console.log(file); //得到文件对象
      								//console.log(result); //得到文件base64编码，比如图片
							        obj.resetFile(index, file, '1.jpg'); //重命名文件名，layui 2.3.0 开始新增
							      });
							    }
							    ,done: function(res){
							    	
							      //如果上传失败
							      if(res.code > 0){
							        return layer.msg('上传失败');
							      }
							      //上传成功
							      var index = parent.layer.getFrameIndex(window.name);//获取窗口索引
							      parent.layer.msg('更改成功！')
							      parent.layer.close(index);
							      
							    }
							    ,error: function(res){
							    
							    console.log("请求上传接口出现异常"+res);
							      //演示失败状态，并实现重传
							      var demoText = $('#demoText');
							      demoText.html('<span style="color: #FF5722;">上传失败</span> <a  style="background-color: #4476A7;"  class="layui-btn layui-btn-xs demo-reload">重试</a>');
							      demoText.find('.demo-reload').on('click', function(){
							        uploadInst.upload();
							      });
							    }
							  });
								
								
					
				});
			})
		</script>
	</head>
	<body>
		<p id="id" style="display:none" >${user.username}</p>
		<div class="layui-upload" style="margin-left: 20px;">
		  <div class="layui-upload-list">
		    <img class="layui-upload-img" width="150" height="150" id="demo1">
		    <p id="demoText" ></p>
		  </div>
		  <button class="layui-btn" id="test1" style="background-color: #4476A7;" type="button">选择头像</button>
		  <button class="layui-btn" id="btn" style="background-color: #4476A7;" type="button">上传</button>
		</div>
		
	</body>
</html>
