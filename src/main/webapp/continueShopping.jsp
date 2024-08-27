<%@page import="java.sql.PreparedStatement"%>
<%@page import="Model.DAO"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
String status="processing";
try{
	Connection con=DAO.getCon();
	PreparedStatement pst=con.prepareStatement("update cart set status=? where email=? and status='bill'");
	pst.setString(1, status);
	pst.setString(2, email);
	int ii=pst.executeUpdate();
	response.sendRedirect("home.jsp");
}catch(Exception  e){
	e.printStackTrace();
}

%>
</body>
</html>