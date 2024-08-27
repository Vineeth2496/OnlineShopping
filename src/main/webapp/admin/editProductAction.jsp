<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.DAO"%>
<%@page import="Model.Data"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Product Action</title>
</head>
<body>
<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String catagory=request.getParameter("catagory");
String price=request.getParameter("price");
String active=request.getParameter("active");

try{
	Connection con=DAO.getCon();
	PreparedStatement pst=con.prepareStatement("update product set name=?, catagory=?, price=?, active=? where id=?");
	pst.setString(1, name);
	pst.setString(2, catagory);
	pst.setString(3, price);
	pst.setString(4, active);
	pst.setString(5, id);
	
	int res=pst.executeUpdate();
	
	if(active.equals("No")){
		PreparedStatement pst2=con.prepareStatement("delete from cart where product_id=? and address is NULL");
		int res2=pst2.executeUpdate();
	}
	response.sendRedirect("allProductEditProduct.jsp?msg=done");
}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}

/*
Data d=new Data();
d.setId(id);
d.setPname(name);
d.setCategory(catagory);
d.setPrice(price);
d.setActive(active);

int res=DAO.editUpdate(d);

if(res>0){
	response.sendRedirect("allProductEditProduct?msg=done");
}else{
	response.sendRedirect("allProductEditProduct?msg=wrong");
}
*/
%>
</body>
</html>