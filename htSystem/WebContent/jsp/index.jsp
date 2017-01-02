<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>htSys_后台系统</title>
    <!--[if lt IE 9]>
      <script src="<%=basePath %>plugins/bootstrap/js/html5shiv.min.js"></script>
      <script src="<%=basePath %>plugins/bootstrap/js/respond.min.js"></script>
    <![endif]-->
<link style="text/css" rel="stylesheet" href="<%=basePath %>plugins/bootstrap/css/bootstrap.min.css">
<link style="text/css" rel="stylesheet" href="<%=basePath %>plugins/bootstrap/css/bootstrap-table.min.css">
<style type="text/css">
	.glyphicon {
		float: right;
		padding-top: 3px;
	}
	.row {
		margin-bottom: 15px;
	}
	#pic_box {
		border: 1px dashed #888;
		padding: 8px;
	}
	.pic-right {
	}
	#picRefresh:hover {
		background-color: #999;
	}
</style>
</head>

<body data-spy="scroll" data-target="#sidebarMenu">

	<div class="container">
		<a class="btn pull-left btn-link btn-lg" href="#" role="button" style="padding-left: 0;color: black;"><span class="glyphicon glyphicon-user"></span><b>${username }</b></a>
		<a class="btn btn-link pull-right" href="#exitModal" role="button" data-toggle="modal">Exit</a><br>
		<h2 class="page-header">htSys后台信息系统</h2>
		
		<div class="row">
			<div class="col-xs-2" id="sidebarMenu">
				<ul  class="nav nav-pills nav-stacked" data-spy="affix" data-offset-top=90">
					<li class="active">
						<a href="#section-1" >User Manager<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
					</li>
					<li>
						<a href="#section-2">Data Grid<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
					</li>
					<li>
						<a href="#section-3">Picture Up/Down&nbsp;&nbsp;<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
					</li>
					<li>
						<a href="#section-4">Others...<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></a>
					</li>
				</ul>
			</div>
			
			<div class="col-xs-10">
	            
	            <!-- 用户管理报表 -->
	            <h2 id="section-1">User Manager</h2>
	            <hr>
	            <div class="row">
			      	<div id="toolbar" class="col-xs-12">
						<a href="#addUserModel" class="btn btn-success disabled" data-toggle="modal">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>Add
						</a>
						<a class="btn btn-primary disabled" id="editUser01">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>Edit
						</a>
						<a href="#deleteUser" type="button" class="btn btn-danger disabled" data-toggle="modal">
							<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>Delete
						</a>
						<button id="freshUserTable" class="btn btn-info active" type="button">
							<span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>Load Table
						</button>
				  	</div>
			      </div>
	            <table id="userTable" class="table table-bordered table-hover"></table>
	            <br>
	            <br>
	            <br>
	            <br>

	            
	            
	            <h2 id="section-2">Data Grid</h2>
	            <hr>
	            <div class="row">
	            	<div class="col-xs-5">
	            		<button class="btn btn-success" type="button" data-toggle="modal" data-target="#">Add</button>
	            		<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#">Update</button>
	            		<button class="btn btn-danger" type="button" data-toggle="modal" data-target="#">Delete</button>
	            		<button id="freshUserTable" class="btn btn-info active" type="button" data-toggle="modal" data-target="#">Load Table</button>
	            	</div>
	            	<div class="input-group col-xs-3 pull-right">
	            		<input id="search" class="form-control" placeholder="Search" type="text">
	            		<span class="input-group-addon">
	            			<span class="glyphicon glyphicon-search" style="color: rgb(255, 140, 60);"></span>
	            		</span>
	            	</div>
	            </div>
	            <table class="table table-bordered table-hover" data-height="581" data-sort-name="name" data-sort-order="desc" data-toggle="table" data-pagination="true">
	            	<thead>
	            		<tr>
	            			<th data-field="" data-field="state" data-checkbox="true"></th>
	            			<th data-field="uid" data-sortable="true">ID</th>
	            			<th data-field="uname" data-sortable="true">UserName</th>
	            			<th data-field="password" data-sortable="true">Password</th>
	            			<th data-field="email" data-sortable="true">E-mail</th>
	            			<th data-field="sex" data-sortable="true">Sex</th>
	            			<th data-field="age" data-sortable="true">Age</th>
	            			<th data-field="createTime" data-sortable="true">CreateTime</th>
	            			<th data-field="updateTime" data-sortable="true">UpdateTime</th>
	            		</tr>
	            	</thead>
	            </table>
	            <br>
	            <br>
	            <br>
	            <br>
	            
	            
	            
	            
	            
	            
	            <h2 id="section-3">Batch Picture Up/Down</h2>
            	<div class="row">
            		<div class="col-xs-3"><h4>picpture brown</h4></div>
            		<div class="input-group col-xs-3 pull-right">
            			<input type="text" class="form-control" id="search" placeholder="Search picture">
            			<span class="input-group-addon">
            				<span class="glyphicon glyphicon-search" style="color: rgb(255, 140, 60);"></span>
            			</span>
            			<span class="input-group-addon" id="picRefresh">
            				<span class="glyphicon glyphicon-refresh"></span>
            			</span>
            		</div>
            	</div>
            	
            	<div id="pic_box">
            	<div class="row">
            		<div class="col-xs-3">
            			<div class="thumbnail">
            				<img class="img-rounded" alt="please refresh">
            				<div class="caption">
				                <p style="text-align: center"></p>
				                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                	<a class="btn btn-default pic-right picOneDelete" role="button">
			                		<span class="glyphicon glyphicon-trash"></span>
			                	</a>
			                	<a class="btn btn-default pic-right picOneDown" role="button">
			                		<span class="glyphicon glyphicon-download-alt"></span>
			                	</a>
           					</div>
            			</div>
            		</div>
            		
            		
            		<div class="col-xs-3">
            			<div class="thumbnail" href="#">
            				<img class="img-rounded" alt="please refresh">
            				<div class="caption">
				                <p style="text-align: center"></p>
				                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                	<a class="btn btn-default pic-right picOneDelete" role="button">
			                		<span class="glyphicon glyphicon-trash"></span>
			                	</a> 
			                	<a class="btn btn-default pic-right picOneDown" role="button">
			                		<span class="glyphicon glyphicon-download-alt"></span>
			                	</a>
           					</div>
            			</div>
            		</div>
            		<div class="col-xs-3">
            			<div class="thumbnail" href="#">
            				<img class="img-rounded" alt="please refresh">
            				<div class="caption">
				                <p style="text-align: center"></p>
				                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                	<a class="btn btn-default pic-right picOneDelete" role="button">
			                		<span class="glyphicon glyphicon-trash"></span>
			                	</a> 
			                	<a class="btn btn-default pic-right picOneDown" role="button">
			                		<span class="glyphicon glyphicon-download-alt"></span>
			                	</a>
           					</div>
            			</div>
            		</div>
            		<div class="col-xs-3">
            			<div class="thumbnail" href="#">
            				<img class="img-rounded" alt="please refresh">
            				<div class="caption">
				                <p style="text-align: center"></p>
				                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                	<a class="btn btn-default pic-right picOneDelete" role="button">
			                		<span class="glyphicon glyphicon-trash"></span>
			                	</a> 
			                	<a class="btn btn-default pic-right picOneDown" role="button">
			                		<span class="glyphicon glyphicon-download-alt"></span>
			                	</a>
           					</div>
            			</div>
            		</div>
            		<div class="col-xs-3">
            			<div class="thumbnail" href="#">
            				<img class="img-rounded" alt="please refresh">
            				<div class="caption">
				                <p style="text-align: center"></p>
				                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                	<a class="btn btn-default pic-right picOneDelete" role="button">
			                		<span class="glyphicon glyphicon-trash"></span>
			                	</a> 
			                	<a class="btn btn-default pic-right picOneDown" role="button">
			                		<span class="glyphicon glyphicon-download-alt"></span>
			                	</a>
           					</div>
            			</div>
            		</div>
            		<div class="col-xs-3">
            			<div class="thumbnail" href="#">
            				<img class="img-rounded" alt="please refresh">
            				<div class="caption">
				                <p style="text-align: center"></p>
				                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                	<a class="btn btn-default pic-right picOneDelete" role="button">
			                		<span class="glyphicon glyphicon-trash"></span>
			                	</a> 
			                	<a class="btn btn-default pic-right picOneDown" role="button">
			                		<span class="glyphicon glyphicon-download-alt"></span>
			                	</a>
           					</div>
            			</div>
            		</div>
            		<div class="col-xs-3">
            			<div class="thumbnail" href="#">
            				<img class="img-rounded" alt="please refresh">
            				<div class="caption">
				                <p style="text-align: center"></p>
				                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                	<a class="btn btn-default pic-right picOneDelete" role="button">
			                		<span class="glyphicon glyphicon-trash"></span>
			                	</a> 
			                	<a class="btn btn-default pic-right picOneDown" role="button">
			                		<span class="glyphicon glyphicon-download-alt"></span>
			                	</a>
           					</div>
            			</div>
            		</div>
            		<div class="col-xs-3">
            			<div class="thumbnail" href="#">
            				<img class="img-rounded" alt="please refresh">
            				<div class="caption">
				                <p style="text-align: center"></p>
				                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                	<a class="btn btn-default pic-right picOneDelete" role="button">
			                		<span class="glyphicon glyphicon-trash"></span>
			                	</a> 
			                	<a class="btn btn-default pic-right picOneDown" role="button">
			                		<span class="glyphicon glyphicon-download-alt"></span>
			                	</a>
           					</div>
            			</div>
            		</div>
            	</div>
            	
            	<div class="row">
	            	<form action="<%=basePath %>picUpload.do" method="post" enctype="multipart/form-data">
	            		<div class="form-group">
	            			<div class="col-xs-3">
	            				<input type="file" id="myfile01" class="file" name="fileName01" placeholder="请添加图片">
	            			</div>
	            			<button type="submit" class="btn btn-success pull-left" id="uploadPic">上传</button>
	            		</div>
	            	</form>
	            	<div class="col-xs-8 col-offset-xs-8">
           				<button class="btn btn-danger pull-right" style="margin: 0 10px;"><span class="glyphicon glyphicon-trash"></span>批量删除</button>
           				<button class="btn btn-primary pull-right"><span class="glyphicon glyphicon-folder-open"></span>批量下载</button>
	            	</div>
	            </div>
	            </div>
	            
	            
	            
        	</div>
		</div>
		
		
		
	</div>
	
	
	
	<!-- 删除单张图片的模态框 -->
	<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="deleteOneModal" aria-hidden="true" id="deleteOneModal">
	    <div class="modal-dialog">
	    	<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title">图片删除</h4>
				</div>
				<div class="modal-body text-danger">
					确认删除当前图片吗?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-danger" id="deleteOnePic" data-dismiss="modal">删除</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 退出登录的模态框 -->
	<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exitModal" aria-hidden="true" id="exitModal">
	    <div class="modal-dialog">
	    	<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title">退出登录</h4>
				</div>
				<div class="modal-body text-danger">
					确认退出登录吗?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal">关闭</button>
					<a href="<%=basePath %>login.jsp" role="button" class="btn btn-danger">退出</a>
				</div>
			</div>
		</div>
	</div>
	<!-- 删除用户的模态框 -->
	<div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="deleteModal" aria-hidden="true" id="deleteUser">
	    <div class="modal-dialog">
	    	<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title">删除用户</h4>
				</div>
				<div class="modal-body text-danger">
					确认删除当前选中用户吗?
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="btn_delete" data-dismiss="modal">Delete</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 用户新增的模态框 -->
	<div class="modal fade" id="addUserModel">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true" id="x">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title">User Add&nbsp;&nbsp;&nbsp;</h4>
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
							<div class="col-xs-5 dropdown" id="dropdown01">
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
								<input id="age01" type="text" class="form-control" name="age" placeholder="age">
							</div>
						</div>
					</form>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">close</button>
					<button type="button" class="btn btn-primary" id="addUser" data-dismiss="modal">Add</button>
				</div>
					
			</div>
		</div>
	</div>
	<!-- 用户edit的模态框 -->
	<div class="modal fade" id="editUserModel">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true" id="x">&times;</span><span class="sr-only">Close</span></button>
					<h4 class="modal-title">User Update&nbsp;&nbsp;&nbsp;</h4>
				</div>
				
				<div class="modal-body">
					<form action="" class="form-horizontal" role="form" method="post">
						<div class="form-group" id="regUsername02">
							<label for="userName03" class="col-xs-3 control-label">UserName</label>
							<div class="col-xs-5">
								<input id="userName03" type="text" class="form-control" name="username" placeholder="UserName">
							</div>
						</div>
						<div class="form-group">
							<label for="inputPassword03" class="col-xs-3 control-label">Password</label>
							<div class="col-xs-5">
								<input id="inputPassword03" type="text" class="form-control" name="password" placeholder="Password">
							</div>
						</div>
						<div class="form-group">
							<label for="email02" class="col-xs-3 control-label">e-mail</label>
							<div class="col-xs-5">
								<input id="email02" type="email" class="form-control" name="email" placeholder="e-mail">
							</div>
						</div>
						<div class="form-group">
							<label for="sex" class="col-xs-3 control-label">sex</label>
							<div class="col-xs-5 dropdown" id="dropdown02">
								<button type="button" class="btn btn-default dropdown-toggle" id="dorpdownMenu2" data-toggle="dropdown" style="width:220px;color:gray;text-align: left;">select sex
									<span class="caret" style="margin-left: 10px;"></span>
								</button>
								<ul class="dropdown-menu dropdown-menu-left" role="menu" aria-labelledby="dorpdownMenu2">
									<li role="presentation"><a role="menuitem" tabindex="-1" href="#">男</a></li>
									<li role="presentation"><a role="menuitem" tabindex="-1" href="#">女</a></li>
								</ul>
								
							</div>
						</div>
						<div class="form-group">
							<label for="age" class="col-xs-3 control-label">age</label>
							<div class="col-xs-5">
								<input id="age02" type="text" class="form-control" name="age" placeholder="age">
							</div>
						</div>
					</form>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">close</button>
					<button type="button" class="btn btn-primary" id="editUser02" data-dismiss="modal">Update</button>
				</div>
					
			</div>
		</div>
	</div>
	
	
	<script type="text/javascript" src="<%=basePath %>plugins/bootstrap/js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>plugins/bootstrap/js/jquery-ui.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>plugins/bootstrap/js/bootstrap-table.js"></script>
	<script type="text/javascript" src="<%=basePath %>plugins/bootstrap/js/tableExport.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>plugins/bootstrap/js/bootstrap-table-export.js"></script>
	<script type="text/javascript" src="<%=basePath %>plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=basePath %>plugins/bootstrap/js/json2.js"></script>
	
	<script type="text/javascript">
	
		/*配置用户管理报表*/
		function initUserTable(){
			$("#userTable").bootstrapTable("destroy");//先销毁表格
			
			//初始化表格，动态从服务器加载数据
			$("#userTable").bootstrapTable({
				method: "get",
				url: '<%=basePath %>userReport.do',
				height: "581",
				striped: false,//不显示斑马线
				clickToSelect: true,//点击行即可选中单选/复选框
				dataType: "json",
				//contentType: "application/x-www-form-urlencoded",
				pagination: true,//启动分页
				pageSize: 10,//每页显示的记录数
				pageNumber: 1,//当前第几页
				pageList: [5,10,15,20,25,30,50,100,150],//记录数可选列表
				search: true,//是否启用查询,是客户端client才有效
				searchOnEnterKey: true,//按回车触发搜索方法，否则自动触发搜索方法
				showColumns: true,//显示下拉框勾选要显示的列
				showExport: true,//是否显示导出
				exportDataType: "basic",
				showRefresh: true,//显示刷新按钮
				silent: true,//刷新事件必须设置
				strictSearch: true,//全匹配搜索，否则为模糊搜索
				showToggle: true,//显示 切换试图（table/card）按钮
				toolbar: '#toolbar', 
				sidePagination: "server",//服务器端请求
				
				columns: [{
					field: 'state',
					checkbox: true
				},{
					field: 'uid',
					title: 'ID',
					sortable: "true"
				},{
					field: 'uname',
					title: 'UserName'
				},{
					field: 'password',
					title: 'Password'
				},{
					field: 'email',
					title: 'E-mail'
				},{
					field: 'sex',
					title: 'Sex'
				},{
					field: 'age',
					title: 'Age'
				},{
					field: 'createTime',
					title: 'CreateTime'
				},{
					field: 'updateTime',
					title: 'UpdateTime'
				}],
				
				//设置为undefined可以获取pageNumber，pageSize，searchText，sortName，sortOrder  
	            //设置为limit可以获取limit, offset, search, sort, order  
				queryParamsType: "undefined", 
				
				queryParams: function queryParams(params){
					//请求的分页参数
					var param = {
							pageNumber: params.pageNumber,
							pageSize: params.pageSize
					};
					return param;
				},
				onLoadSuccess: function(){//加载成功时执行
				},
				onLoadError: function(){//加载失败时执行
					alert("加载数据失败", {time : 1500, icon : 2});
				}
			});
		}
		$(function(){//初始化表格
			
			$("#freshUserTable").click(function(){
				initUserTable();
				$("#toolbar a").removeClass("disabled");
			});
		
		});
		
		
		
		/*新增用户请求*/
		//验证用户名是否注册
		$("#userName02").blur(function(){
			$.ajax({
				url:"<%=basePath %>registeServlet.do",
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
		//新增用户前先替换sex框中下拉菜单的值
		$("#dropdown01 a").click(function(){
			var a = $(this).text();
			$("#dorpdownMenu1").text(a);
		});
		//新增用户ajax请求
		$("#addUser").click(function(){
			//获取请求参数
			var regInfo = {
					regUsername:$("#userName02").val(),
					regPassword:$("#inputPassword02").val(),
					regEmail:$("#email01").val(),
					regSex:$("#dorpdownMenu1").text(),
					regAge:$("#age01").val()
			};
			$.ajax({
				url:"<%=basePath %>registeServlet.do",
				type:"post",
				data:regInfo,//请求参数
				dataType:"",
				success:function(data){
					alert("新增用户名:  "+$("#userName02").val()+"  成功！！！");
				},
				error:function(){
					alert("对不起啦，客官，新增用户失败！！！");
				}
			});
		});
	
		
		
		
		
		
		/*更新用户数据的eidt按钮的操作*/
		var $table = $('#userTable'),//获取userTable
   			$button = $('#btn_delete');//获取删除按钮
		$("#editUser01").click(function(){
			//获取用户点击的记录数
		    var idLen = JSON.stringify($table.bootstrapTable('getSelections').length);
			if(idLen>1){
				alert("客官，只能编辑一条数据！");
			}else if(idLen==0){
				alert("请选择要更新的数据");
			}else{
				//调用edit的模态框
				$("#editUserModel").modal("toggle");
				
				//先将表格中的数据填进模态框
				$("#userName03").val($table.bootstrapTable('getSelections')[0].uname);
				$("#inputPassword03").val($table.bootstrapTable('getSelections')[0].password);
				$("#email02").val($table.bootstrapTable('getSelections')[0].email);
				$("#dorpdownMenu2").text($table.bootstrapTable('getSelections')[0].sex);
				$("#age02").val($table.bootstrapTable('getSelections')[0].age);
				
				//更新用户名前先替换sex框中下拉菜单的值
				$("#dropdown02 a").click(function(){
					var a = $(this).text();
					$("#dorpdownMenu2").text(a);
				});
				//更新用户数据ajax请求
				$("#editUser02").click(function(){
					//获取请求参数
					var regInfo = {
							userId:$table.bootstrapTable('getSelections')[0].uid,
							regUsername:$("#userName03").val(),
							regPassword:$("#inputPassword03").val(),
							regEmail:$("#email02").val(),
							regSex:$("#dorpdownMenu2").text(),
							regAge:$("#age02").val()
					};
					$.ajax({
						url:"<%=basePath %>userEdit.do",
						type:"post",
						data:regInfo,//请求参数
						dataType:"",
						success:function(){
							alert("更新成功！！！");
						},
						error:function(){
							alert("更新用户信息失败！！！");
						}
					});
				});
			}
		});
   			
   			
   		
		
		
		
		/*删除user一条或多条记录*/
	   	$button.click(function() {
	   		/*按官方文档做法，但$.map()无效。。。。无语，不知什么原因
	       var ids = $.map($table.bootstrapTable('getSelections'), function (row) {
	           return row.id;
	       });
	       $table.bootstrapTable('remove', {
	           field: 'uid',
	           values: ids
	       });*/
	       //alert(JSON.stringify($table.bootstrapTable('getSelections')[0].uid));//获取用户点击数的id
	       
	       //获取用户点击的记录数
	       var idLength = JSON.stringify($table.bootstrapTable('getSelections').length);
	       
	       var deleteParam = new Array();//初始化一个请求参数的数组
	       for(var i=0;i<idLength;i++){
	    	//将用户点击的每条记录的id取出来存入数组
	       	deleteParam[i] = $table.bootstrapTable('getSelections')[i].uid;
	       }
	       
	       $.ajax({
	       	url:'<%=basePath %>userDelete.do',
			type:"post",
			data:{deleteParam: deleteParam.join("-")},//请求参数，用'-'分割，转换成字符串
			dataType:"",
			success:function(){
				alert("成功删除了： "+idLength+" 条数据！");
			},
			error:function(){
				alert("删除失败！！！");
			}
	       });
		});
	   	
		
		
		/*图片操作*/
		$(function(){
			/*随机刷新图片*/
			$("#picRefresh").click(function(){
				$.ajax({
					url:"<%=basePath %>picLoaclService.do",
					type:"post",
					data:"",
					dataType:"json",
					success:function(picData){
						for(var i=0;i<picData.length;i++){
							$(".img-rounded").eq(i).attr({
								//添加缩略图资源的请求地址
								src: "<%=basePath %>images/"+picData[i]
							});
							$(".caption p").eq(i).text(picData[i]);//更新图片的名字
						}
					},
					error:function(){alert("图片加载失败!");}
				});
			});
			
			/*单张图片删除按钮*/
			var deletPicSrc = "";
			$(".picOneDelete").click(function(){
				//获取点击图片删除按钮对应图片的的src属性的值
				deletPicSrc = $(this).parent().prev().attr("src");
				if(deletPicSrc==null){
					alert("请先刷新加载图片！");
				}else{
					$("#deleteOneModal").modal("toggle");
				}
				
			});
			$("#deleteOnePic").click(function(){//确认删除
				
				var start = deletPicSrc.lastIndexOf("/")+1;
				var pName = deletPicSrc.substring(start, deletPicSrc.length);//截取图片src的图片名
				
				var pidStart = pName.lastIndexOf("-")+1;
				var pidEnd = pName.indexOf(".");
				var pId = pName.substring(pidStart, pidEnd);//截取图片src的id
				
				$.ajax({
					url:"<%=basePath %>picOneDelete.do",
					type:"post",
					data:{pId:pId},
					dataType:"",
					success:function(){alert("删除成功！");},
					error:function(){alert("删除失败！！");}
				});
				
			});
			
			/*单张图片下载按钮*/
			$(".picOneDown").click(function(){
				
				var downPicSrc = $(this).parent().prev().attr("src");
				
				if(downPicSrc==null){
					alert("请先刷新加载图片！");
				}else{
					var start = downPicSrc.lastIndexOf("/")+1;
					var pName = downPicSrc.substring(start, downPicSrc.length);//截取图片src的图片名
					//通过a标签的锚获取下载图片
					$(this).attr({
						href: "<%=basePath %>picOneDown.do?pName="+pName
					});
				}				
			});			
		});
		
		
		
			
		//所有bootstrap的模态框拖动
		$(document).on("show.bs.modal", ".modal", function(){
		    $(this).draggable({
	//		   handle: ".modal-header"   //只能点击头部拖动
		    });
		    $(this).css("overflow", "hidden"); //防止出现滚动条，出现的话，会把滚动条一起拖着走
		});
		
		
		//上传图片按钮的隐藏和显示
		$(function(){
			//值为空时隐藏
			if($("#myfile01").val()==""){
				$("#uploadPic").hide();
			}
			//file框中的onchange事件显示上传按钮
			$("#myfile01").change(function(){
				$("#uploadPic").show();
			});
		});
		
		
	</script>
	
	
</body>
</html>