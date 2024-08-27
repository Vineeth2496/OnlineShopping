<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Model.DAO"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add to Cart Action</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
String product_id=request.getParameter("id");
int quantity=1;
int product_price=0;
int product_total=0;
int cart_total=0;

int z=0;
try{
	Connection con=DAO.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from product where id='"+ product_id+"'");
	
	while(rs.next()){
		product_price=rs.getInt(4);
		product_total=product_price;
	}
	
	
	ResultSet rs1=st.executeQuery("select * from cart where product_id='"+product_id+"' and email='"+email+"' and address is NULL");
	
	while(rs1.next()){
		cart_total=rs1.getInt(5);
		cart_total=cart_total+product_total;
		quantity=rs1.getInt(3);
		quantity=quantity+1;
		z=1;
	}
	
	if(z==1){
		st.executeUpdate("update cart set total='"+cart_total+"', quantity='"+quantity+"' where product_id="+product_id+" and email='"+email+"' and address is NULL");
		response.sendRedirect("home.jsp?msg=exist");
	}
	if(z==0){
		PreparedStatement pst=con.prepareStatement("insert into cart(email, product_id, quantity, price, total) values(?,?,?,?,?)");
		pst.setString(1, email);
		pst.setString(2, product_id); 
		pst.setInt(3, quantity);
		pst.setInt(4, product_price);
		pst.setInt(5, product_total);
		int res=pst.executeUpdate();
		response.sendRedirect("home.jsp?msg=added");
	}
}catch(Exception e){
	e.printStackTrace();
	response.sendRedirect("home.jsp?msg=invalid");
}
%>
</body>
</html>