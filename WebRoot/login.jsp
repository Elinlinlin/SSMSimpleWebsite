<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   <script type="text/javascript">
	function check(form){
		with(form){
			if(uid.value == ""){
				alert("用户名不能为空！");
				return false;
			}
			if(password.value == ""){
				alert("密码不能为空");
				return false;
			}
			
			return true;
		}
	}
	
	
   </script> 
   
   

   
<head>
<base href="<%=basePath%>">

<title>系统登录</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css"></link>
<script type="text/javascript" src="js/jquery-2.1.1.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

</head>

<body>
<h3 align="center">员工部门管理系统</h3>
	<div class="container"> 
	<div align="center">
       <form class="well" name="login" action="user/checkLogin.action" method="post" onsubmit="return check(this)">
			<label>用户名</label> <input type="text" name="uid" class="span3" placeholder="用户编号"> <p/>
			<label>密&nbsp;&nbsp;&nbsp;码</label>   <input type="password" name="password" class="span3" placeholder="密码"><p/>
			<button type="submit" id="btn_login" class="btn btn-success">登陆</button>&nbsp;&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-primary" onclick="window.location.href='register.jsp'">注册</button>
	  </form>	
	 </div>	
 </div>
</body>
</html>
