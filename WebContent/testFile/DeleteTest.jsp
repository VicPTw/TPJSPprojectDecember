<%@page import="dao.DaoManager"%>
<%@page import="bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Test</title>
</head>
<body>
<h1>Delete Test DONE</h1>
<%
TestBean testBean = new TestBean();
// set initial value
testBean.setInitValue();
%>
<h2>
<b>**Recent object value**</b><br>
MainPage:<%=testBean.getMainPage().toString()%><br>
Partner:<%=testBean.getPartner().toString()%><br>
Service:<%=testBean.getService().toString() %><br>
SubService:<%=testBean.getSubService().toString() %>
</h2>
<%
// SQL delete !! 先清除子資料才可刪除主資料 => SubService V.S. Service
int i1 = DaoManager.getInstance().getMainPageDaoImp().delete(testBean.getMainPage());
int i2 = DaoManager.getInstance().getPartnerDaoImp().delete(testBean.getPartner());
int i3 = DaoManager.getInstance().getSubServiceDaoImp().delete(testBean.getSubService());
int i4 = DaoManager.getInstance().getServiceDaoImp().delete(testBean.getService());

%>
<p>
<b>**Success or not**</b><br>
MainPage Success: <%=i1%><br>
Partner Success: <%=i2%><br>
SubService Success: <%=i3%><br>
Service Success: <%=i4%>
</p>
</body>
</html>