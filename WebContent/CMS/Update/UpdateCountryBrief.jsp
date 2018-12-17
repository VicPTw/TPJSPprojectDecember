<%-- 
    Document   : CountryBrief
    Created on : 2018/12/2, 下午 03:52:01
    Author     : diluter
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script src="../jquery-3.3.1.min.js"></script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CountryBrief</title>
        <link href="../control.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="container">
            <%@include file="../SecondHeader.jspf" %>
            <c:choose>
                <c:when test="${ pwd != null }">
                    <%@include file="UpdateNav.jspf"  %>
                    <%@include file="UpdateCountryBrief.jspf"  %>
                </c:when>
                <c:otherwise>
                    <%@include file="../Validation/Validation.jspf"  %>
                </c:otherwise>
            </c:choose>

        </div>

    </body>
</html>
