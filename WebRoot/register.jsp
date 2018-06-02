<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>员工部门管理系统注册</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
<script type="text/javascript" src="js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script type="text/javascript">
	function check(form){
		with(form){
		    if(uid.value == ""){
				alert("用户编号不能为空！");
				return false;
			}
			if(username.value == ""){
				alert("用户名不能为空！");
				return false;
			}
			if(password.value == ""){
				alert("密码不能为空");
				return false;
			}
			if(role.value == ""){
				alert("权限不能为空");
				return false;
			}
			if(password.value != rpassword.value){
				alert("两次密码不同，请重新确认");
				return false;
			}
			
			return true;
		}
	}
	
	
   </script> 
   
</head>

<body>
	<div class="container"> 
	<h3 align="center">员工部门管理系统</h3>
	<div align="center">
       <form class="well" name="login" action="user/register.action" method="post" onsubmit="return check(this)">
            <label>用户编号</label> <input type="text" name="uid" class="span3" placeholder="用户编号"><p>
			<label>用户名</label> <input type="text" name="username" class="span3" placeholder="用户名"><p>
			<label>密&nbsp;&nbsp;&nbsp;码</label>   <input type="password" name="password" class="span3" placeholder="密码"><p>
			<label>确认密码</label>   <input type="password" name="rpassword" class="span3" placeholder="密码"><p>
			<label>用户权限</label> <input type="text" name="role" class="span3" placeholder="用户权限"><p>
			<button type="submit" class="btn btn-success">注册</button>
	  </form>		
	  </div>
 </div>
</body>
</html>
