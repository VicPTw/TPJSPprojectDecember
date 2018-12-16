
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/CMS/control.css" rel="stylesheet" type="text/css">
        <title>Successful</title>
    </head>
    <body>
        <div class="container">
            <%@include file="../SecondHeader.jspf"  %>
            <c:choose>
                <c:when test="${ pwd != null }">
                    <%@include file="../indexNav.jspf"  %>
                    <%@include file="Successful.jspf" %>
                </c:when>
                <c:otherwise>
                    <%@include file="../Validation/Validation.jspf"  %>
                </c:otherwise>
            </c:choose>
        </div>
    </body>
</html>