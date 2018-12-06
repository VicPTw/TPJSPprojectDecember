<%@page import="bean.TestBean"%>
<%@page import="dao.DaoManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
TestBean testBean = new TestBean();
// set Id
String mpId="header",sId="s02";
String pTitle = "646464646646", ssTitle = "Tenancy Management";
// call getRecordById method
testBean.setMainPage(DaoManager.getInstance().getMainPageDaoImp().getRecordById(mpId));
testBean.setPartner(DaoManager.getInstance().getPartnerDaoImp().getRecordById(pTitle));
testBean.setService(DaoManager.getInstance().getServiceDaoImp().getRecordById(sId));
testBean.setSubService(DaoManager.getInstance().getSubServiceDaoImp().getRecordById(ssTitle));
%>
	<h2>MainPage</h2>
	<table border="1" style="width:90%; margin:0 auto;">
		<tr>
			<th>MainTitle</th>
			<th>MainImg</th>
			<th>MainContent</th>
		</tr>
			<tr>
				<td><%=testBean.getMainPage().getMainTitle()%></td>
				<td><%=testBean.getMainPage().getMainImg()%></td>
				<td><%=testBean.getMainPage().getMainContent()%></td>
			</tr>
	</table>
	<h2>Partner</h2>
	<table border="1" style="width:90%; margin:0 auto;">
		<tr>
			<th>P_id</th>
			<th>P_Title</th>
			<th>P_Img</th>
			<th>P_Content</th>
			<th>P_Link</th>
		</tr>
			<tr>
				<td><%=testBean.getPartner().getpId()%></td>
				<td><%=testBean.getPartner().getpTitle()%></td>
				<td><%=testBean.getPartner().getpImg()%></td>
				<td><%=testBean.getPartner().getpContent()%></td>
				<td><%=testBean.getPartner().getpLink()%></td>
			</tr>
	</table>
	<h2>Service</h2>
	<table border="1" style="width:90%; margin:0 auto;">
		<tr>
			<th>S_id</th>
			<th>S_Title</th>
			<th>S_Content</th>
			<th>S_Img</th>
		</tr>
			<tr>
				<td><%=testBean.getService().getsId()%></td>
				<td><%=testBean.getService().getsTitle()%></td>
				<td><%=testBean.getService().getsContent()%></td>
				<td><%=testBean.getService().getsImg()%></td>
			</tr>
	</table>
		<h2>SubService</h2>
	<table border="1" style="width:90%; margin:0 auto;">
		<tr>
			<th>Sb_id</th>
			<th>Sb_Img</th>
			<th>Sb_Title</th>
			<th>Sb_Content</th>
			<th>S_id</th>
		</tr>
			<tr>
				<td><%=testBean.getSubService().getSbId()%></td>
				<td><%=testBean.getSubService().getSbImg()%></td>
				<td><%=testBean.getSubService().getSbTitle()%></td>
				<td><%=testBean.getSubService().getSbContent()%></td>
				<td><%=testBean.getSubService().getsId()%></td>
			</tr>
	</table>
</body>
</html>