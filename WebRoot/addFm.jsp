<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addFm.jsp' starting page</title>
    
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
	<h3 align="center">员工部门管理系统</h3>
		<form action="fm/addFm.action" method="get">
			<table class="table table-bordered table-hover definewidth m10">
			    <tr>
					<td class="tableleft">编号</td>
					<td><input type="text" name="pid" />
					</td>
				</tr>
				<tr>
					<td class="tableleft">考勤系数</td>
					<td><input type="text" name="daymul" />
					</td>
				</tr>
				<tr>
					<td class="tableleft">绩效系数</td>
					<td><input type="text" name="coremul" />
					</td>
				</tr>
			
			<tr>
					<td class="tableleft">贡献系数</td>
					<td><input type="text" name="conmul" />
					</td>
				</tr>
			
			<tr>
					<td class="tableleft">基本工资</td>
					<td><input type="text" name="basic" />
					</td>
				</tr>
			
			
				
				<tr>
					<td class="tableleft"></td>
					<td>
						<button type="submit" class="btn btn-primary" type="button">保存</button>&nbsp;&nbsp;
					
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
