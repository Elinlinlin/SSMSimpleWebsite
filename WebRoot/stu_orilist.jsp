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
    String uid = request.getParameter("uid") ;     // 接收findOriStus参数  
      
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
<script>
	$(function() {

		$('#addnew').click(function() {

			window.location.href = "addStuOri.jsp";
		});
	});
	
	function del(id){
		if(confirm("确定删除吗？")){
		var uid ='<%=request.getAttribute("uid")%>';
			window.location.href = "stu/deleteStuById.action?id="+id+"&uid="+uid;
			alert("删除成功！");
		}
	}
	<!--
	function getUrlVars() {
    var vars = [],
        hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
     
    }
    var uid = getUrlVars()["uid"];//获得 get方式url参数中的uid值
	-->
	function cul(id){
	    var uid ='<%=request.getAttribute("uid")%>';
		if(confirm("计算工资")){
			window.location.href = "stu/culStuPayByIdOri.action?id="+id+"&uid="+uid;
			alert("计算成功！");
		}
	}
	
	function edit(id){
		window.location.href = "stu/findStuById2.action?id="+id;

	}

   function check1(form){
		with(form){
			if(id.value == ""){
				alert("学号不能为空！");
				return false;
			}
			return true;
		}
	}
	
	
   function check2(form){
		with(form){
			if(name.value == ""){
				alert("姓名不能为空！");
				return false;
			}
			return true;
		}
	}
	
</script>
</head>

<body>
	<h3 align="center">员工部门管理系统</h3>
	
	 
	<div class="container">
		<div style=float:left;width:30%>
			<form class="form-inline definewidth m20"
				action="stu/findStuById.action" method="post" onsubmit="return check1(this)">
				工号： <input type="text" name="id" id="id" class="abc input-default">
				<button type="submit" class="btn btn-primary">查询</button>
			</form>
		</div>
		<div style=float:left;width:30%>
			<form class="form-inline definewidth m20"
				action="stu/findStuByName.action" method="post" onsubmit="return check2(this)">
				姓名： <input type="text" name="name" id="name"
					class="abc input-default">
				<button type="submit" class="btn btn-primary">查询</button>
			</form>
		</div>

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
			<td><%=s.getCore()%></td>
			<td><%=s.getPay()%></td>
			<td><%=s.getPid()%></td>
			<td><%=s.getCon()%></td>
			<td><%=s.getDay()%></td>
			<td><%=s.getEmail()%></td>
			<td><%=s.getGoal()%></td>
			<td><button type="button"  class="btn btn-success btn-sm" onclick="edit(<%=s.getId()%>)">修改</button>
				<button type="button" class="btn btn-warning btn-sm" id="del" onclick="del(<%=s.getId()%>)">删除</button>
				<button type="button" class="btn btn-warning btn-sm" id="cul" onclick="cul(<%=s.getId()%>)">计算工资</button>
			</td>
		</tr>
		<%
			}
			}
		%>
	</table>
	
	
		<script type="text/javascript">
	function send(eid){
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
	
	
    <input type="button" onclick="send()" value="发送邮件" />
   
	
</body>
</html>
