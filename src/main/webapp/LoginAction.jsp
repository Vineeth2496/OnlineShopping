<%@page import="java.util.Vector"%>
<%@page import="Model.DAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Action</title>
</head>
<body>
<%
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	
	if("admin@gmail.com".equals(email) && "admin".equals(password)){
		session.setAttribute("email", email);
		response.sendRedirect("admin/adminHome.jsp");
	}
	else{
		try{
		Vector v=DAO.validate();
		if(v.contains(email) && v.contains(password)){
			session.setAttribute("email", email);
			response.sendRedirect("home.jsp");
		}
		else{
			response.sendRedirect("login.jsp?msg=notexist");
		}
		}catch(Exception e){
			response.sendRedirect("login.jsp?msg=invalid");
			e.printStackTrace();
		}
	}
%>
</body>
</html>