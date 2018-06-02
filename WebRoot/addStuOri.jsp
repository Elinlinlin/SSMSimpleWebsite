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

<title>添加员工</title>
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

			window.location.href = "stu/findOriStus.action";
		});
	});

</script>
</head>

<body>
	<div class="container">
	<h3 align="center">员工部门管理系统</h3>
		<form action="stu/addStuOri.action" method="post">
			<table class="table table-bordered table-hover definewidth m10">
			    <tr>
					<td class="tableleft">工号</td>
					<td><input type="text" name="id" />
					</td>
				</tr>
				<tr>
					<td class="tableleft">姓名</td>
					<td><input type="text" name="name" />
					</td>
				</tr>
				<tr>
					<td class="tableleft">部门</td>
					<td><select name=origin>
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
					</select></td>
				</tr>
				<tr>
					<td class="tableleft">权限</td>
					<td><input type="text" name="role" />
					</td>
				</tr>
				<tr>
					<td class="tableleft">职位</td>
					<td><input type="text" name="place" />
					</td>
				</tr>
				<tr>
					<td class="tableleft">公式</td>
					<td><input type="text" name="pid" />
					</td>
				</tr>
				
				<tr>
					<td class="tableleft">邮件</td>
					<td><input type="text" name="email" />
					</td>
				</tr>
				<tr>
					<td class="tableleft">目标</td>
					<td><input type="text" name="goal" />
					</td>
				</tr>
				<tr>
					<td class="tableleft"></td>
					<td>
						<button type="submit" class="btn btn-primary" type="button">保存</button>&nbsp;&nbsp;
						<button type="button" class="btn btn-success" name="backid" id="backid">返回列表</button></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
