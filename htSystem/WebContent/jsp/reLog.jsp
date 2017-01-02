<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Re Login</title>
    <!--[if lt IE 9]>
      <script src="<%=basePath %>plugins/bootstrap/js/html5shiv.min.js"></script>
      <script src="<%=basePath %>plugins/bootstrap/js/respond.min.js"></script>
    <![endif]-->
<link style="text/css" rel="stylesheet" href="<%=basePath %>plugins/bootstrap/css/bootstrap.min.css">
<style type="text/css">
	a {
		color: gray;
	}
</style>
</head>

<body>
	<div class="container">
	<h1 class="page-header">User Login</h1>
	
	<form action="loginServlet.do" class="form-horizontal" role="form" method="post">
		<div class="row">
			<div class="alert alert-danger alert-dismissable col-xs-5 col-xs-offset-2">
      			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      			<strong>Login Error!&nbsp;&nbsp;</strong>${loginError }
    		</div>
    	</div>
		<!-- 用户名和密码 -->
		<div class="form-group">
			<label for="userName" class="col-xs-2 control-label">UserName</label>
			<div class="col-xs-3">
				<input id="userName" type="text" class="form-control" name="username" placeholder="UserName">
			</div>
		</div>
		
		<div class="form-group">
			<label for="inputPassword01" class="col-xs-2 control-label">Password</label>
			<div class="col-xs-3">
				<input id="inputPassword01" type="password" class="form-control" name="password" placeholder="Password">
			</div>
		</div>
		<!-- 验证码 -->
		<div class="form-group">
			<label for="checkcode" class="col-xs-2 control-label">CheckCode</label>
			<div class="col-xs-3">
				<input id="checkcode" type="text" class="form-control" name="checkcode" placeholder="CheckCode">
			</div>
			<div class="col-xs-2">
				<img alt="美图了" src="randomcode.jpg" onclick="refreshImg(this)">
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-xs-offset-2 col-xs-3">
				<div class="checkbox">
					<label>
						<input type="checkbox">Remember me
					</label>
				</div>
			</div>
		</div>
		
		<div class="form-group">
			<div class="col-xs-offset-2 col-xs-3">
				<button type="submit" class="btn btn-success btn-block">Sign in</button>
				
			</div>
		</div>
		<div class="form-group">
			<div class="col-xs-offset-2 col-xs-1">
				<a href="#">忘记密码</a>
			</div>
			<div class="col-xs-offset-1 col-xs-2">
				<a href="#regModel" data-toggle="modal">免费注册</a>
			</div>
		</div>
		
		
		<!-- 定义模态框来注册用户 -->
		<div class="modal fade" id="regModel">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true" id="x">&times;</span><span class="sr-only">Close</span></button>
						<h4 class="modal-title">User Registe&nbsp;&nbsp;&nbsp;</h4>
					</div>
					
					<div class="modal-body">
						<form action="loginServlet.do" class="form-horizontal" role="form" method="post">
							<div class="form-group" id="regUsername01">
								<label for="userName02" class="col-xs-3 control-label">UserName</label>
								<div class="col-xs-5">
									<input id="userName02" type="text" class="form-control" name="username" placeholder="UserName">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword02" class="col-xs-3 control-label">Password</label>
								<div class="col-xs-5">
									<input id="inputPassword02" type="password" class="form-control" name="password" placeholder="Password">
								</div>
							</div>
							<div class="form-group">
								<label for="email01" class="col-xs-3 control-label">e-mail</label>
								<div class="col-xs-5">
									<input id="email01" type="email" class="form-control" name="email" placeholder="e-mail">
								</div>
							</div>
							<div class="form-group">
								<label for="sex" class="col-xs-3 control-label">sex</label>
								<div class="col-xs-5 dropdown">
									<button type="button" class="btn btn-default dropdown-toggle" id="dorpdownMenu1" data-toggle="dropdown" style="width:220px;color:gray;text-align: left;">select sex
										<span class="caret" style="margin-left: 10px;"></span>
									</button>
									<ul class="dropdown-menu dropdown-menu-left" role="menu" aria-labelledby="dorpdownMenu1">
										<li role="presentation"><a role="menuitem" tabindex="-1" href="#">男</a></li>
										<li role="presentation"><a role="menuitem" tabindex="-1" href="#">女</a></li>
									</ul>
									
								</div>
							</div>
							<div class="form-group">
								<label for="age" class="col-xs-3 control-label">age</label>
								<div class="col-xs-5">
									<input id="age" type="text" class="form-control" name="age" placeholder="age">
								</div>
							</div>
						</form>
					</div>
					
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">close</button>
						<button type="button" class="btn btn-primary" id="regSubmit" data-dismiss="modal">registe</button>
					</div>
					
				</div>
			</div>
		</div>
		
	</form>
	</div>
	
	
	<script type="text/javascript" src="<%=basePath %>/plugins/bootstrap/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>/plugins/bootstrap/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>/plugins/bootstrap/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		//基于Kaptcha验证码组件切换验证码
		function refreshImg(img){
			img.src = "randomcode.jpg?"+Math.floor(Math.random()*100);
		}
		
		//用户注册的模态框拖动
		$(document).on("show.bs.modal", ".modal", function(){
		    $(this).draggable({
//		        handle: ".modal-header"   //只能点击头部拖动
		    });
		    $(this).css("overflow", "hidden"); //防止出现滚动条，出现的话，你会把滚动条一起拖着走的
		});
		
		
		//验证用户名是否注册
		$("#userName02").blur(function(){
			$.ajax({
				url:"registeServlet.do",
				type:"post",
				data:{regUsername:$("#userName02").val()},//请求参数
				dataType:"json",
				success:function(data){
					var error = data.regError;
					$("#addRegError").remove();
					if(error=="is Logined!"){
						$("#regUsername01").append('<label id="addRegError" class="control-label" style="color:red;font-weight: normal;">'+error+'</label>');
					}
				},
				error:function(){
					alert("用户名验证失败！！");
					$("#addRegError").remove();
				}
			});
		});
		
		//提交用户注册前先替换sex框中下拉菜单的值
		$(".dropdown a").click(function(){
			var a = $(this).text();
			$("#dorpdownMenu1").text(a);
		});
		
		//提交用户注册请求
		$("#regSubmit").click(function(){
			//获取请求参数
			var regInfo = {
					regUsername:$("#userName02").val(),
					regPassword:$("#inputPassword02").val(),
					regEmail:$("#email01").val(),
					regSex:$("#dorpdownMenu1").text(),
					regAge:$("#age").val()
			};
			$.ajax({
				url:"registeServlet.do",
				type:"post",
				data:regInfo,//请求参数
				dataType:"",
				success:function(data){
					alert("恭喜您，客官，注册成功！！！");
					//$("#titleErro").remove();
					//$(".modal-title").append('<span id="titleErro" style="color:red;">'+data.titleErro+'</span>');
				},
				error:function(){
					alert("对不起啦，客官，注册失败！！！");
					//$("#titleErro").remove();
				}
			});
		});
		
	</script>
</body>
</html>