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
String address=request.getParameter("address");
String city=request.getParameter("city");
String state=request.getParameter("state");
String country=request.getParameter("country");

try{
	Connection con=DAO.getCon();
	PreparedStatement pst=con.prepareStatement("update users set address=?, city=?,  state=?, country=? where email=?");
	pst.setString(1, address);
	pst.setString(2, city);
	pst.setString(3, state);
	pst.setString(4, country);
	pst.setString(5, email);
	int ii=pst.executeUpdate();
	response.sendRedirect("addChangeAddress.jsp?msg=valid");
}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("addChangeAddress.jsp?msg=invalid");
}

%>
</body>
</html>