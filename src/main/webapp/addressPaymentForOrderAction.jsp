<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.DAO"%>
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
String mobileNumber=request.getParameter("mobileNumber");
String paymentMethod=request.getParameter("paymentMethod");
String transactionId=request.getParameter("transactionId");

String status="bill";
try{
	Connection con=DAO.getCon();
	PreparedStatement pst=con.prepareStatement("update users set address=?, city=?, state=?, country=?, mobileNumber=? where email=?");
	pst.setString(1, address);
	pst.setString(2, city);
	pst.setString(3, state);
	pst.setString(4, country);
	pst.setString(5, mobileNumber);
	pst.setString(6, email);
	
	int ii=pst.executeUpdate();
	
	PreparedStatement pst1=con.prepareStatement("update cart set address=?, city=?, state=?, country=?, mobileNumber=?, orderDate=now(), deliveryDate=DATE_ADD(orderDate, INTERVAL 7 DAY), paymentMethod=?, transcationId=?, status=? where email=? and address is NULL");
	pst1.setString(1, address);
	pst1.setString(2, city);
	pst1.setString(3, state);
	pst1.setString(4, country);
	pst1.setString(5, mobileNumber);
	pst1.setString(6, paymentMethod);
	pst1.setString(7, transactionId);
	pst1.setString(8, status);
	pst1.setString(9, email);
	
	int ii1=pst1.executeUpdate();
	response.sendRedirect("bill.jsp");
}catch(Exception e){
	e.printStackTrace();
}

%>
</body>
</html>