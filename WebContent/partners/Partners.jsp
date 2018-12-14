<%@page import="bean.Partner"%>
<%@page import="dao.DaoManager"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>OUR PARTNERS &amp; MEMBERSHIPS</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width initial-scale=1">
        <script src="../js/jquery-1.10.2.js"></script>
        <script src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="../js/jquery.parallax-1.1.3.js"></script>
        <link rel="stylesheet" href="../style.css" />
        <link rel="stylesheet" href="partners.css" />
    </head>
    <body>
        <%
            List<Partner> pList = DaoManager.getInstance().getPartnerDaoImp().getAllRecords();
            request.setAttribute("plist", pList);
        %>
        <div class="container">
            <jsp:include page="../top.jsp" />
            <div class="partners">
                <c:forEach items="#{plist}" var="p">
                    <div class="partner" id="Partners">
                        <div class="pic">
                            <a href="${p.getpLink()}"> <img src="../${p.getpImg()}" alt="" /></a>
                        </div>
                        <div class="text2">
                            <h4>
                                <a href="${p.getpLink()}">${p.getpTitle()}</a>
                            </h4>
                            <p>${p.getpContent()}</p>
                        </div>
                    </div>
                </c:forEach>
                <a class="back" href="../index.jsp#Partners">Back</a>
            </div>
        </div>
        <script src="../MyJS.js"></script>
    </body>
</html>