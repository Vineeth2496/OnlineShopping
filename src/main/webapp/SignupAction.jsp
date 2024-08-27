<%@page import="Model.DAO"%>
<%@page import="Model.Data"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp Action</title>
</head>
<body>
<%
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String phno=request.getParameter("phno");
	Long mobileNumber=Long.parseLong(phno);
	String securityQuestion=request.getParameter("securityQuestion");
	String answer=request.getParameter("answer");
	String password=request.getParameter("password");
	String address=request.getParameter("address");
	String city=request.getParameter("city");
	String state=request.getParameter("state");
	String country=request.getParameter("country");

	
	Data d=new Data();
	d.setName(name);
	d.setEmail(email);
	d.setMobileNumber(mobileNumber);
	d.setSecurityQuestion(securityQuestion);
	d.setAnswer(answer);
	d.setPassword(password);
	d.setAddress(address);
	d.setCity(city);
	d.setState(state);
	d.setCountry(country);
	
	int res=DAO.insert(d);
	
	if(res>0){
		response.sendRedirect("signup.jsp?msg=valid");
	}
	else{
		response.sendRedirect("signup.jsp?msg=invalid");
	}
	
%>
</body>
</html>