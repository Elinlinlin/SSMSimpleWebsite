<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.som.entity.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userlist.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  
    <script type="text/javascript">
    	function del(uid){
		if(confirm("确定删除吗？")){
			window.location.href = "user/deleteUserById.action?uid="+uid;
			alert("删除成功！");
		}
	}
	
		function edit(uid){
		window.location.href = "user/findUserById.action?uid="+uid;

	}
	
	</script>
    
  
<table class="table table-bordered table-hover definewidth m10">
		<thead>
			<tr>
				<th>编号</th>
				<th>名字</th>
				<th>密码</th>
				<th>角色</th>
				<th>管理操作</th>
			</tr>
		</thead>
		<%
			List<User> users = (List<User>) request.getAttribute("users");
			if (users == null || users.size() < 1) {
				out.print("没有数据！");
			} else {

				for (User u : users) {
		%>
		<tr>
			<td><%=u.getUid()%></td>
			<td><%=u.getUsername()%></td>
			<td><%=u.getPassword()%></td>
			<td><%=u.getRole()%></td>
		    
			<td><button type="button"  class="btn btn-success btn-sm" onclick="edit(<%=u.getUid()%>)">修改</button>
				<button type="button" class="btn btn-warning btn-sm" id="del" onclick="del(<%=u.getUid()%>)">删除</button>
			</td>
		</tr>
		<%
			}
			}
		%>
	</table>

  </body>
</html>
