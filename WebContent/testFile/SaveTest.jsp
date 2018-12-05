<%@page import="dao.DaoManager"%>
<%@page import="bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Save Test</title>
</head>
<body>
<h1>Save Test DONE</h1>
<%
TestBean testBean = new TestBean();
// set initial value
testBean.setInitValue();
%>
<h2>
<b>**Recent object value**</b>
MainPage:<%=testBean.getMainPage().toString()%><br>
Partner:<%=testBean.getPartner().toString()%><br>
Service:<%=testBean.getService().toString() %><br>
SubService:<%=testBean.getSubService().toString() %>
</h2>
<%
// SQL insert
int i1 = DaoManager.getInstance().getMainPageDaoImp().save(testBean.getMainPage());
int i2 = DaoManager.getInstance().getPartnerDaoImp().save(testBean.getPartner());
int i3 = DaoManager.getInstance().getServiceDaoImp().save(testBean.getService());
int i4 = DaoManager.getInstance().getSubServiceDaoImp().save(testBean.getSubService());
%>
<p>
<b>**Success or not**</b>
MainPage Success: <%=i1%><br>
Partner Success: <%=i2%><br>
Service Success: <%=i3%><br>
SubService Success: <%=i4%>
</p>
</body>
</html>