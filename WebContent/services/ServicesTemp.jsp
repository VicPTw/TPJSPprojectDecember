<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="bean.SubService"%>
<%@page import="dao.DaoManager"%>
<%@page import="bean.Service,java.util.*"%>
<%
    Service s = DaoManager.getInstance().getServiceDaoImp().getRecordById(request.getParameter("sId"));
    request.setAttribute("s", s);
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title><%=s.getsTitle()%></title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width initial-scale=1">
        <script src="../js/jquery-1.10.2.js"></script>
        <script src="../js/bootstrap.js"></script>
        <script type="text/javascript" src="../js/jquery.parallax-1.1.3.js"></script>
        <link rel="stylesheet" href="../style.css" />
        <link rel="stylesheet" href="<c:url value='services.css'/>" />
    </head>
    <body>
        <div class="container">
            <jsp:include page="../top.jsp" />
            <div class="content">
                <h1><%=s.getsTitle()%></h1>
                <div class="box">

                    <c:forEach
                        items="${DaoManager.getInstance().getSubServiceDaoImp().getAllRecordsByRef(s.getsId())}"
                        var="ss">
                        <div class="subbox">
                            <div class="pic">
                                <img src="${ss.getSbImg()}" alt="" />
                            </div>
                            <div class="text">
                                <h3>${ss.getSbTitle()}</h3>
                                <p>${ss.getSbContent()}</p>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <a class="back" href="../index.jsp#Services">Back</a>
            </div>
        </div>
        <script src="../MyJS.js"></script>
    </body>
</html>