<%@page import="Model.DAO"%>
<%@page import="Model.Data"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Product Action</title>
</head>
<body>

<%
	String id=request.getParameter("id");
	String pname=request.getParameter("name");
	String category=request.getParameter("category");
	String price=request.getParameter("price");
	String active=request.getParameter("active");

	Data d=new Data();
	d.setId(id);
	d.setPname(pname);
	d.setCategory(category);
	d.setPrice(price);
	d.setActive(active);
	
	int res=DAO.addProduct(d);
	if(res>0){
		response.sendRedirect("addNewProduct.jsp?msg=done");
	}else{
		response.sendRedirect("addNewProduct.jsp?msg=wrong");
	}
	
%>
</body>
</html>