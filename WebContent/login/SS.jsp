<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5" import="java.sql.*, java.util.*, pass.*"%>


<%

	Check check = new Check();
	String password = check.getPassword();
        if (check.getPassword().isEmpty()) {
                out.println("!!! ");
            }
        
	if(password.equals(request.getParameter("pwd")))
	{
            response.sendRedirect("../background/backgroundindex.jsp");       
	}
	else{ 
               out.println("�K�X���~");
               out.println(request.getParameter("pwd"));
	}
%>
