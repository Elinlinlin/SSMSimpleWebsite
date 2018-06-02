<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editUser.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

 <script type="text/javascript" src="js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script>
	$(function() {

		$('#backid').click(function() {

			window.location.href = "user/findAllUser.action";
		});
	});

</script>

  </head>
  
<body>
	<div class="container">
	<h3 align="center">登陆账号管理系统</h3>
	
		<form action="user/updateUser.action" method="GET">
			<table class="table table-bordered table-hover definewidth m10">
				
				<tr>
					<td class="tableleft">编号</td>
					<td><input type="text" name="uid" value="${user.uid}" readonly="readonly"/></td>
				</tr>
					<tr>
					<td class="tableleft">名字</td>
					<td><input type="text" name="username" value="${user.username}" /></td>
				</tr>
				<tr>
					<td class="tableleft">密码</td>
					<td><input type="text" name="password" value="${user.password}" /></td>
				</tr>				
				<tr>
					<td class="tableleft">角色</td>
					<td><input type="text" name="role" value="${user.role}" /></td>
				</tr>
				<tr>
					<td class="tableleft"></td>
					<td>
						<button type="submit" class="btn btn-primary" type="button">保存</button>&nbsp;&nbsp;
					
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>