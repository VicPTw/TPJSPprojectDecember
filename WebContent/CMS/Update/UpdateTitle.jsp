<%-- 
    Document   : Title
    Created on : 2018/12/2, 下午 02:19:32
    Author     : diluter
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="../jquery-3.3.1.min.js"></script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../control.css" rel="stylesheet" type="text/css">
        <title>Ttile</title>
    </head>
    <body>
        <div class="container">
            <%@include file="../SecondHeader.jspf"  %>
            <c:choose>
                <c:when test="${ pwd != null }">
                    <%@include file="UpdateNav.jspf"  %>
                    <%@include file="UpdateTitle.jspf"  %>
                </c:when>
                <c:otherwise>
                    <%@include file="../Validation/Validation.jspf"  %>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>
