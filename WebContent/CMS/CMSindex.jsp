<%-- 
    Document   : backgroundindex
    Created on : 2018/12/2, 下午 04:22:53
    Author     : diluter
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/CMS/control.css" rel="stylesheet" type="text/css">
        <title>CMS</title>
    </head>
    <body>
        <div class="container">
            <%@include file="indexHeader.jspf"  %>
            <c:choose>
                <c:when test="${ pwd != null }">
                    <%@include file="indexNav.jspf"  %>
                    <%@include file="indexContent.jspf"  %>
                </c:when>
                <c:otherwise>   
                    <%@include file="Validation/Validation.jspf"  %>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>
