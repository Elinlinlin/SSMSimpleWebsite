<%@ page language="java" import="java.util.*" pageEncoding="utf-8"
	contentType="text/html; charset=utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>修改员工</title>
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
<script>
	$(function() {

		$('#backid').click(function() {

			window.location.href = "stu/findAllStus.action?uid="+uid;
		});
	});
	
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
</head>

<body>
	<div class="container">
	<h3 align="center">员工部门管理系统</h3>
	
		<form action="stu/updateStu.action" method="GET">
		<input type="text" name="uid" id="uid"  value="您的工号"/>
			<table class="table table-bordered table-hover definewidth m10">
				<tr>
					<td class="tableleft">工号</td>
					<td><input type="text" name="id" value="${stu.id}" readonly="readonly"/></td>
				</tr>
				<tr>
					<td class="tableleft">姓名</td>
					<td><input type="text" name="name" value="${stu.name}" /></td>
				</tr>
				<tr>
					<td class="tableleft">部门</td>
					<td><select name="origin" value="${stu.origin }">
							<option value="a部门">a部门</option>
							<option value="b部门">b部门</option>
							<option value="c部门">c部门</option>
							<option value="d部门">d部门</option>
							<option value="e部门">e部门</option>
							<option value="f部门">f部门</option>
							<option value="g部门">g部门</option>
							<option value="h部门">h部门</option>
							<option value="i部门">i部门</option>
							<option value="j部门">j部门</option>
							<option value="k部门">k部门</option>
					</select>
					</td>
				</tr>
				<tr>
					<td class="tableleft">权限</td>
					<td><input type="text" name="role" value="${stu.role}" /></td>
				</tr>
				<tr>
					<td class="tableleft">职位</td>
					<td><input type="text" name="place" value="${stu.place}" /></td>
				</tr>
				<tr>
					<td class="tableleft">绩效</td>
					<td><input type="text" name="core" value="${stu.core}" /></td>
				</tr>
				<tr>
					<td class="tableleft">贡献</td>
					<td><input type="text" name="con" value="${stu.con}" /></td>
				</tr>
				<tr>
					<td class="tableleft">考勤</td>
					<td><input type="text" name="day" value="${stu.day}" /></td>
				</tr>
				
				<tr>
					<td class="tableleft">邮件</td>
					<td><input type="text" name="email" value="${stu.email}" /></td>
				</tr>
				<tr>
					<td class="tableleft">目标</td>
					<td><input type="text" name="goal" value="${stu.goal}" /></td>
				</tr>
				<tr>
					<td class="tableleft">公式</td>
					<td><input type="text" name="pid" value="${stu.pid}" /></td>
				</tr>
				<tr>
					<td class="tableleft"></td>
					<td>
						<button type="submit" class="btn btn-primary" type="button" onclick="return check(this)">保存</button>&nbsp;&nbsp;
				
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
