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
<title>手风琴滑动菜单</title>
    <!--[if lt IE 9]>
      <script src="<%=basePath %>plugins/bootstrap/js/html5shiv.min.js"></script>
      <script src="<%=basePath %>plugins/bootstrap/js/respond.min.js"></script>
    <![endif]-->
<link style="text/css" rel="stylesheet" href="<%=basePath %>plugins/bootstrap/css/bootstrap.min.css">
<style type="text/css">
    body {
        font-family: "微软雅黑,Arial,sans-serif"
    }
    a {
        color: black;
    }
</style>
</head>

<body>

    <!-- 导航栏 -->
    <nav class="navbar navbar-default navbar-inverse" role="navigation">
        <div class="container-fluid">
            <!-- 响应式设置 -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example-navbar-collapse">
                    <span class="sr-only">切换导航</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">
                    <img src="img/logo_200.png" height="100%" />
                </a>
            </div>
            <div class="collapse navbar-collapse" id="example-navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a class="icon-bar" href="#">系统首页</a>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a>欢迎您,admin</a>
                    </li>
                    <li><a href="#">安全退出</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container-fluid">
        <!-- 导航栏下的菜单栏 -->
        <div class="row">

            <!-- 左侧边栏 -->
            <div class="col-sm-2">
                
                <!--手风琴侧边栏-->
                <div class="panel-group" id="accordion">
                    <a href="#" class="list-group-item active"><strong>内容审核</strong></a>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <a href="#aa1" data-toggle="collapse" data-parent="#accordion">
                                <h4 class="panel-title">
                                    <strong>朋友圈<span class="glyphicon glyphicon-chevron-down pull-right"></span></strong>
                                </h4>
                            </a>
                        </div>
                        <div class="panel-collapse collapse in" id="aa1">
                            <a href="#a01" data-toggle="tab" id="aa001" onclick="initActiveTable();">
                                <div class="panel-body">
                                    动态审核<span class="glyphicon glyphicon-menu-right pull-right"></span>
                                </div>
                            </a>
                            <a href="#a02" data-toggle="tab">
                                <div class="panel-body">
                                    others...<span class="glyphicon glyphicon-menu-right pull-right"></span>
                                </div>
                            </a>
                        </div>
                    </div>
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title"><a href="#aa2" data-toggle="collapse" data-parent="#accordion">标题二</a></h4>
                        </div>
                        <div class="panel-collapse collapse" id="aa2">
                            <div class="panel-body">标题二对应的内容</div>
                            <div class="panel-body">标题二对应的内容</div>
                        </div>
                    </div>
                </div>
                
            </div>

            <!-- 
                右侧主体内容边栏
             -->
            <div class="col-sm-10">
                
                <!-- 主体内容，使用tab标签嵌入 -->
                <div class="tab-content">

                    <div class="tab-pane fade" id="a01">   

                        

                        <!-- 列表展示，主体内容，相当于以前的ifram -->
                        <div class="table-responsive">
                            <table id="activeTable" class="table table-hover">
                            <!-- 
                            	<thead>
                            		<tr>
                            			<th data-field="state" checkbox: true></th>
                            			<th data-field="uid">ID</th>
                            			<th data-field="uname">uname</th>
                            			<th data-field="password">password</th>
                            			<th data-field="email">email</th>
                            			<th data-field="sex">sex</th>
                            			<th data-field="age">age</th>
                            			<th data-field="createTime">createTime</th>
                            			<th data-field="updateTime">updateTime</th>
                            		</tr>
                            	</thead>
                            	 -->
                            </table>
                        </div>

                    </div>
                    

                    <div class="tab-pane fade" id="a02">
                        <div class="table-responsive">
                            <table class="table table-striped ">
                                <thead>
                                    <tr>
                                        <th>编号</th>
                                        <th>图标</th>
                                        <th>名称</th>
                                        <th>价格</th>
                                        <th>邮费</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>15</td>
                                        <td>
                                            <img src="img/test.jpg" class="img-thumbnail" style="height: 30px;" />
                                        </td>
                                        <td>超人气无花果</td>
                                        <td>18.00￥</td>
                                        <td>18.00￥</td>
                                        <td>上架</td>
                                        <td>
                                            <div class="btn-group">
                                                <a href="" class="btn btn-default">修改</a>
                                                <a href="" class="btn btn-default">下架</a>
                                                <a href="" class="btn btn-danger">删除</a>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

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

    <script type="text/javascript">

        /*配置用户管理报表*/
        function initActiveTable(){
            $("#activeTable").bootstrapTable("destroy");//先销毁表格
            
            //初始化表格，动态从服务器加载数据
            $("#activeTable").bootstrapTable({
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
                showHeader: true,
                
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

        
/*
        //侧边栏调用表格
        $("#aa01").click(function(){
            alert("a");
            initActiveTable();
        })*/

    </script>
	
</body>
</html>