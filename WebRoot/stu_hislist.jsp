<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.som.entity.Student"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%  
          request.setCharacterEncoding("utf-8") ; // 按中文接收  
    String uid = request.getParameter("uid") ;     // 接收findhisStus参数  
      
%> 


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>员工部门管理系统</title>
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

}
</style>

</head>

<body>
	<h3 align="center">员工部门管理系统-一级别员工页面</h3>
	<table class="table table-bordered table-hover definewidth m10">
		<thead>
			<tr>
				<th>工号</th>
				<th>姓名</th>
				<th>部门</th>
				<th>权限</th>
				<th>职位</th>
				<th>绩效</th>
				<th>工资</th>
				<th>公式</th>
				<th>贡献</th>
				<th>考勤</th>
				<th>邮件</th>
				<th>目标</th>
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
		    <td><%=s.getCore()%></td>
		    <td><%=s.getPay()%></td>
			<td><%=s.getPid()%></td>
			<td><%=s.getCon()%></td>
			<td><%=s.getDay()%></td>
			<td><%=s.getEmail()%></td>
			<td><%=s.getGoal()%></td>
		</tr>
		<%
			}
			}
		%>
	</table>
	
		<script type="text/javascript">
	function cul(eid){
	    eid = document.getElementById("eid").value;
	    etitle =   document.getElementById("etitle").value;
	    eword =   document.getElementById("eword").value;
	    var uid ='<%=request.getAttribute("uid")%>';
		if(confirm("发送邮件")){
			window.location.href = "stu/sendEmailById.action?id="+eid+"&uid="+uid+"&etitle="+etitle+"&eword="+eword;
			alert("发送成功！");
		}
	}
	</script>
	

	<input type="text" id="eid" value="发送至"/>
	<input type="text" id="etitle" value="标题"/>
	<input type="text" id="eword" value="内容"/>
	
	
    <input type="button" onclick="cul()" value="点我" />
</body>
</html>
