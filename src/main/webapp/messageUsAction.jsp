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
String subject=request.getParameter("subject");
String body=request.getParameter("body");
try{
	Connection con=DAO.getCon();
	PreparedStatement pst=con.prepareStatement("insert into message(email, subject, body) values(?,?,?)");
	pst.setString(1, email);
	pst.setString(2, subject);
	pst.setString(3, body);
	int ii=pst.executeUpdate();
	response.sendRedirect("messageUs.jsp?msg=valid");
}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("messageUs.jsp?msg=invalid");
}
%>
</body>
</html>