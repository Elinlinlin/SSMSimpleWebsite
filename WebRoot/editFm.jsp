<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'editFm.jsp' starting page</title>
    
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

			window.location.href = "fm/findAllFm.action";
		});
	});

</script>

  </head>
  
<body>
	<div class="container">
	<h3 align="center">工资公式管理系统</h3>
	
		<form action="fm/updateFm.action" method="GET">
			<table class="table table-bordered table-hover definewidth m10">
				<tr>
					<td class="tableleft">公式编号</td>
					<td><input type="text" name="pid" value="${fm.pid}" readonly="readonly"/></td>
				</tr>
				<tr>
					<td class="tableleft">考勤系数</td>
					<td><input type="text" name="daymul" value="${fm.daymul}" /></td>
				</tr>
					<tr>
					<td class="tableleft">绩效系数</td>
					<td><input type="text" name="coremul" value="${fm.coremul}" /></td>
				</tr>	<tr>
					<td class="tableleft">贡献系数</td>
					<td><input type="text" name="conmul" value="${fm.conmul}" /></td>
				</tr>	<tr>
					<td class="tableleft">基本工资</td>
					<td><input type="text" name="basic" value="${fm.basic}" /></td>
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
