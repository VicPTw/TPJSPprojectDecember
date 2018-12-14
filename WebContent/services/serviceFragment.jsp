
<%@page import="bean.SubService"%>
<%@page import="dao.DaoManager"%>
<%@page import="bean.Service,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	List<Service> sList = DaoManager.getInstance().getServiceDaoImp().getAllRecords();
	request.setAttribute("sList", sList);
%>
<div class="services" id="Services">
	<h4>OUR SERVICES</h4>
	<p>&nbsp;</p>
	<c:forEach items="${sList}" var="s">
		<div class="box">
			<div class="pic">
				<img src="${s.getsImg()}" alt="" />
			</div>
			<div class="text">
				<p>&nbsp;</p>
				<h4>${s.getsTitle()}</h4>
				<ul>
					<c:forEach
						items="${DaoManager.getInstance().getSubServiceDaoImp().getAllRecordsByRef(s.getsId())}"
						var="ss">
						<li>${ss.getSbTitle()}</li>
					</c:forEach>
				</ul>
				<form action="services/ServicesTemp.jsp">
					<button type="submit" name="sId" value="${s.getsId()}"
					class="s-btn">Read More >></button>
				</form>
<!-- 
			<a href="services/ServicesTemp.jsp">Read More >></a>
 -->
			</div>
		</div>
	</c:forEach>
</div>