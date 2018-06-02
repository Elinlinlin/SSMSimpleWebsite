<%@page import="com.som.entity.Fm"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.som.entity.Fm"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'SetFm.jsp' starting page</title>
    
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
  function openpage(){
     window.location = "addFm.jsp";
  }
  
  	function del(pid){
		if(confirm("确定删除吗？")){
			window.location.href = "fm/deleteFmById.action?pid="+pid;
			alert("删除成功！");
		}
	}
	
		function edit(pid){
		window.location.href = "fm/findFmById.action?pid="+pid;

	}
	
	</script>
	
	
  
<table class="table table-bordered table-hover definewidth m10">
		<thead>
			<tr>
				<th>公式编号</th>
				<th>考勤系数</th>
				<th>绩效系数</th>
				<th>贡献系数</th>
				<th>基本工资</th>
				<th>管理操作</th>
			</tr>
		</thead>
		<%
			List<Fm> fm = (List<Fm>) request.getAttribute("fm");
			if (fm == null || fm.size() < 1) {
				out.print("没有数据！");
			} else {

				for (Fm m : fm) {
		%>
		<tr>
			<td><%=m.getPid()%></td>
			<td><%=m.getDaymul()%></td>
			<td><%=m.getCoremul()%></td>
			<td><%=m.getConmul()%></td>
			<td><%=m.getBasic()%></td>
		    
			<td><button type="button"  class="btn btn-success btn-sm" onclick="edit(<%=m.getPid()%>)">修改</button>
				<button type="button" class="btn btn-warning btn-sm" id="del" onclick="del(<%=m.getPid()%>)">删除</button>
			</td>
		</tr>
		<%
			}
			}
		%>
	</table>
	
	<input type="button" onclick="window.location.href='fm/findAllFm.action'" value="查询所有公式" />
	  <input type="button" onclick="openpage()" value="新增公式" />
    
  </body>
</html>
