<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="application/msexcel; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%> <!--常用函数标签库-->

<!-- 
    以上这行设定本网页为excel格式的网页 -->
<%
   response.setHeader("Content-disposition","attachment; filename=info.xls");
   //以上这行设定传送到前端浏览器时的档名为test1.xls
   //就是靠这一行，让前端浏览器以为接收到一个excel档 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
    <meta http-equiv="Content-Type" content="application/msexcel;charset=utf-8"><!-- 防止中文乱码 -->
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
     <table border="1" width="100%">
    <tr>
      <td>工号</td><td>姓名</td><td>部门</td><td>权限</td><td>职位</td><td>工资</td><td>绩效</td><td>考勤</td><td>贡献</td><td>公式</td><td>邮箱</td><td>目标</td>
    </tr>
    <c:forEach items="${stus}" var="s">
    <tr>
      <td><c:out value="${s.id}"/></td> <td><c:out value="${s.name}"/></td> <td><c:out value="${s.origin}"/></td> <td><c:out value="${s.role}"/></td> <td><c:out value="${s.place}"/></td> <td><c:out value="${s.pay}"/></td> <td><c:out value="${s.core}"/></td> <td><c:out value="${s.day}"/></td> <td><c:out value="${s.con}"/></td> <td><c:out value="${s.pid}"/></td> <td><c:out value="${s.email}"/></td> <td><c:out value="${s.goal}"/></td>                      
    </tr>
   </c:forEach>
  </table>
  </body>
</html>
