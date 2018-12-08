<%@page import="dao.DaoManager,java.util.*"%>
<%@page import="bean.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Get All Records Test</title>
    </head>
    <body>
        <h1>Get All Records Test DONE</h1>
        <%
            // Create array list for beans
            List<MainPage> mpList = DaoManager.getInstance().getMainPageDaoImp().getAllRecords();
            List<Partner> pList = DaoManager.getInstance().getPartnerDaoImp().getAllRecords();
            List<Service> sList = DaoManager.getInstance().getServiceDaoImp().getAllRecords();
            List<SubService> ssList = DaoManager.getInstance().getSubServiceDaoImp().getAllRecords();
            request.setAttribute("mplist", mpList);
            request.setAttribute("plist", pList);
            request.setAttribute("slist", sList);
            request.setAttribute("sslist", ssList);
        %>

        <h2>Something Undone here : Tables for show those arrays</h2>
        <h2>MainPage</h2>
        <table border="1" style="width:90%; margin:0 auto;">
            <tr>
                <th>MainTitle</th>
                <th>MainImg</th>
                <th>MainContent</th>
            </tr>
            <c:forEach items="${mplist}" var="mp">
                <tr>
                    <td>${mp.getMainTitle()}</td>
                    <td>${mp.getMainImg()}</td>
                    <td>${mp.getMainContent()}</td>
                </tr>
            </c:forEach>
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
            <c:forEach items="${plist}" var="p">
                <tr>
                    <td>${p.getpId()}</td>
                    <td>${p.getpTitle()}</td>
                    <td>${p.getpImg()}</td>
                    <td>${p.getpContent()}</td>
                    <td>${p.getpLink()}</td>
                </tr>
            </c:forEach>
        </table>
        <h2>Service</h2>
        <table border="1" style="width:90%; margin:0 auto;">
            <tr>
                <th>S_id</th>
                <th>S_Title</th>
                <th>S_Content</th>
                <th>S_Img</th>
            </tr>
            <c:forEach items="${slist}" var="s">
                <tr>
                    <td>${s.getsId()}</td>
                    <td>${s.getsTitle()}</td>
                    <td>${s.getsContent()}</td>
                    <td>${s.getsImg()}</td>
                </tr>
            </c:forEach>
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
            <c:forEach items="${sslist}" var="ss">
                <tr>
                    <td>${ss.getSbId()}</td>
                    <td>${ss.getSbImg()}</td>
                    <td>${ss.getSbTitle()}</td>
                    <td>${ss.getSbContent()}</td>
                    <td>${ss.getsId()}</td>
                </tr>
            </c:forEach>
        </table>
        <%
            List<SubService> sssList = DaoManager.getInstance().getSubServiceDaoImp().getAllRecordsByRef("s01");
            request.setAttribute("ssslist", sssList);
        %>
                <h2>SubServiceOne</h2>
        <table border="1" style="width:90%; margin:0 auto;">
            <tr>
                <th>Sb_id</th>
                <th>Sb_Img</th>
                <th>Sb_Title</th>
                <th>Sb_Content</th>
                <th>S_id</th>
            </tr>
            <c:forEach items="${ssslist}" var="ss">
                <tr>
                    <td>${ss.getSbId()}</td>
                    <td>${ss.getSbImg()}</td>
                    <td>${ss.getSbTitle()}</td>
                    <td>${ss.getSbContent()}</td>
                    <td>${ss.getsId()}</td>
                </tr>
            </c:forEach>
        </table>
    </body>
</html>