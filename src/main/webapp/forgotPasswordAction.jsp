<%@page import="Model.DAO"%>
<%@page import="Model.Data"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot Password Action</title>
</head>
<body>
<%
String email=request.getParameter("email");
String phno=request.getParameter("phno");
Long mobileNumber=Long.parseLong(phno);
String securityQuestion=request.getParameter("securityQuestion");
String answer=request.getParameter("answer");
String newPassword=request.getParameter("newPassword");

Data d=new Data();
d.setEmail(email);
d.setMobileNumber(mobileNumber);
d.setSecurityQuestion(securityQuestion);
d.setAnswer(answer);
d.setPassword(newPassword);

int res=DAO.forgot_Password(d);
if(res>0){
	response.sendRedirect("forgotPassword.jsp?msg=done");
}
else{
	response.sendRedirect("forgotPassword.jsp?msg=invalid");
}


%>
</body>
</html>