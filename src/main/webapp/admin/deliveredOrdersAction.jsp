<%@page import="java.sql.Statement"%>
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
String id=request.getParameter("id");
String email=request.getParameter("email");
String status="Delivered";
try{
	Connection con=DAO.getCon();
	Statement st=con.createStatement();
	st.executeUpdate("update cart set status='"+status+"' where product_id='"+id+"' and email='"+email+"' and address is not NULL");
	response.sendRedirect("ordersReceived.jsp?msg=delivered");
}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("ordersReceived.jsp?msg=wrong");
}
%>
</body>
</html>