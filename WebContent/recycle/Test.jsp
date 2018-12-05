<%@page import="java.sql.Connection"%>
<%@page import="dao.AdminDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@page import="dao.AdminDao,bean.Admin,java.util.*" %>
<%
Admin a = AdminDao.getRecordById("admin001");
%>
<h1>
ID: 
<%=a.getUserId()%>
</h1></br>
<h2>
pass: 
<%=a.getUserPass()%>
</h2>
</body>
</html>