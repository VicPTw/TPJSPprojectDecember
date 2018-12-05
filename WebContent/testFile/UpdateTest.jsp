<%@page import="dao.DaoManager"%>
<%@page import="bean.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Test</title>
</head>
<body>
<h1>Update Test DONE</h1>
<%
TestBean testBean = new TestBean();
// insert initial value
testBean.setInitValue();
int j1 = DaoManager.getInstance().getMainPageDaoImp().save(testBean.getMainPage());
int j2 = DaoManager.getInstance().getPartnerDaoImp().save(testBean.getPartner());
int j3 = DaoManager.getInstance().getServiceDaoImp().save(testBean.getService());
int j4 = DaoManager.getInstance().getSubServiceDaoImp().save(testBean.getSubService());
%>
<h2>
<b>**Recent object value**</b><br>
MainPage:<%=testBean.getMainPage().toString()%><br>
Partner:<%=testBean.getPartner().toString()%><br>
Service:<%=testBean.getService().toString() %><br>
SubService:<%=testBean.getSubService().toString() %>
</h2>
<p>
<b>**Insert success or not**</b><br>
MainPage Success: <%=j1%><br>
Partner Success: <%=j2%><br>
Service Success: <%=j3%><br>
SubService Success: <%=j4%>
</p>
<%
// insert update value
testBean.setUpdateValue();
int i1 = DaoManager.getInstance().getMainPageDaoImp().update(testBean.getMainPage());
int i2 = DaoManager.getInstance().getPartnerDaoImp().update(testBean.getPartner());
int i3 = DaoManager.getInstance().getServiceDaoImp().update(testBean.getService());
int i4 = DaoManager.getInstance().getSubServiceDaoImp().update(testBean.getSubService());
%>
<h2>
<b>**New object value**</b><br>
MainPage:<%=testBean.getMainPage().toString()%><br>
Partner:<%=testBean.getPartner().toString()%><br>
Service:<%=testBean.getService().toString() %><br>
SubService:<%=testBean.getSubService().toString() %>
</h2>
<p>
<b>**Update Success or not**</b><br>
MainPage Success: <%=i1%><br>
Partner Success: <%=i2%><br>
Service Success: <%=i3%><br>
SubService Success: <%=i4%>
</p>

<%
// SQL delete !! 先清除子資料才可刪除主資料 => SubService V.S. Service
int k1 = DaoManager.getInstance().getMainPageDaoImp().delete(testBean.getMainPage());
int k2 = DaoManager.getInstance().getPartnerDaoImp().delete(testBean.getPartner());
int k3 = DaoManager.getInstance().getSubServiceDaoImp().delete(testBean.getSubService());
int k4 = DaoManager.getInstance().getServiceDaoImp().delete(testBean.getService());

%>
<p>
<b>**Delete success or not**</b><br>
MainPage Success: <%=k1%><br>
Partner Success: <%=k2%><br>
SubService Success: <%=k3%><br>
Service Success: <%=k4%>
</p>
</body>
</html>