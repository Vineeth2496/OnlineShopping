<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="Model.DAO"%>

<%
try{
	Connection con=DAO.getCon();
	String createQurey="create table users(name varchar(30), email varchar(35) primary key, mobileNumber bigint, securityQuestion varchar(100), answer varchar(100), password varchar(10), address varchar(100), city varchar(100), state varchar(100), country varchar(100))";
	String Qurey2="create table product(id int, name varchar(200), catagory varchar(100), price int, active varchar(10))";
	//String Qurey3="create table cart(email varchar(100), product_id int, quantity int, price int, total int, address varchar(500), city varchar(50), state varchar(100), country varchar(100), mobileNumber Long, orderDate varchar(100), deliveryDate varchar(100), paymentMethod varchar(100), transcationId varchar(100), status varchar(10))";
	String q4="create table message(id int AUTO_INCREMENT, email varchar(100), subject varchar(200), body varchar(1000), PRIMARY KEY(id))";
	
	//PreparedStatement pst1=con.prepareStatement(createQurey);
	//PreparedStatement pst2=con.prepareStatement(Qurey2);
	//PreparedStatement pst3=con.prepareStatement(Qurey3);
	PreparedStatement pst4=con.prepareStatement(q4);
	boolean table=pst4.execute(); 
	
	out.println("Table is created: "+table);
	System.out.println("Table is created: "+table);
	con.close();
}catch(Exception e){
	e.printStackTrace();
}
%>