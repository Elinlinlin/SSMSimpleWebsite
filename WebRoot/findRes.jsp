<%@page import="com.som.entity.Student"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.som.entity.Student"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>查新结果</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
<link rel="stylesheet" href="css/bootstrap-responsive.min.css"
	type="text/css"></link>
<link rel="stylesheet" href="css/style.css" type="text/css"></link>
<script type="text/javascript" src="js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<style type="text/css">
body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) { /* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}

.table th, .table td { 
text-align: center; 
height:20px;
</style>
<script>
	$(function() {

		$('#back').click(function() {

			window.location.href = "stu/findAllStus.action";
		});
	});
	
		function del(id){
		if(confirm("确定删除吗？")){
			window.location.href = "stu/deleteStuById.action?id="+id;
			alert("删除成功！");
		}
	}
	
	function edit(id){
		window.location.href = "stu/findStuById1.action?id="+id;

	}
</script>
</head>

<body>
    <h3 align="center">员工部门管理系统</h3>
	<h5 align="center">查询结果</h5>
	<table class="table table-bordered table-hover definewidth m10">
		<thead>
			<tr>
				<th>工号</th>
				<th>姓名</th>
				<th>部门</th>
				<th>权限</th>
				<th>职位</th>
				<th>考勤</th>
				<th>贡献</th>
				<th>绩效</th>
				<th>邮箱</th>
				<th>工资</th>
				<th>公式</th>
				<th>目标</th>
				<th>管理操作</th>
			</tr>
		</thead>
		<%
			List<Student> stus = (List<Student>) request.getAttribute("stus");
			if (stus == null || stus.size() < 1) {
				out.print("没有数据！");
			} else {

				for (Student s : stus) {
		%>
		<tr>
			<td><%=s.getId()%></td>
			<td><%=s.getName()%></td>
			<td><%=s.getOrigin()%></td>
			<td><%=s.getRole()%></td>
			<td><%=s.getPlace()%></td>
			<td><%=s.getDay()%></td>
			<td><%=s.getCon()%></td>
			<td><%=s.getCore()%></td>
			<td><%=s.getEmail()%></td>
			<td><%=s.getPay()%></td>
			<td><%=s.getGoal()%></td>
			<td><%=s.getPid()%></td>
			<td><button type="button"  class="btn btn-success btn-sm" onclick="edit(<%=s.getId()%>)">修改</button>
				<button type="button" class="btn btn-warning btn-sm" id="del" onclick="del(<%=s.getId()%>)">删除</button></td>
		</tr>
		<%
			}
			}
		%>
	</table>
	
	<div class="inline pull-right page">
		
	</div>
</body>
</html>
