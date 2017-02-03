<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
   <head>
      <title>秒杀详情页</title>
      <%@include file="common/head.jsp" %>
   </head>
   <body>
	<div class="container">
		<div class="panel panel-default text-center">
			<div class="panel-heading">
				<h1>${seckill.name }</h1>
			</div>
			<div class="panel-body">
				<h2 class="text-danger">
					<!-- 显示time图标 -->				
					<span class="glyphicon glyphicon-time"></span>
					<span class="glyphicon" id="seckill-box"></span>
				</h2>
			</div>
		</div>
	</div>
	
	<!-- 登陆弹出层,出入电话 -->
	<div id="killPhoneModel" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title text-center">
						<span class="glyphicon glyphicon-phone"></span>秒杀电话:
					</h3>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-xs-8 col-xs-offset-2">
							<input type="text" name="killPhone" id="killPhoneKey" placeholder="请输入手机号码" class="form-control"/>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<span id="killPhoneMessage" class="glyphicon"></span>
					<button type="button" id="killPhoneBtn" class="btn btn-success">
					<span class="glyphicon glyphicon-phone"></span>Submit</button>
				</div>
			</div>
		</div>
	</div>
	
	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- 使用CDN 获取公共js http://www.bootcdn.cn -->
	<!-- jQuery cookie操作插件 -->
	<script src="http://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
	<!-- jQuery 倒计时插件 -->
	<script src="http://cdn.bootcss.com/jquery.countdown/2.1.0/jquery.countdown.min.js"></script>
	<!-- 交互逻辑 -->
	<script src="<%=basePath%>resource/script/seckill.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function(){
			//var aa = $.noConflict();
			//使用el表达式传入参数
			seckill.detail.init({
	            seckillId:${seckill.seckillId},
	            startTime:${seckill.startTime.time},//毫秒
	            endTime:${seckill.endTime.time}
	        });
		});
	</script>
   </body>
</html>