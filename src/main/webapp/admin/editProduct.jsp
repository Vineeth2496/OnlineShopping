<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.xdevapi.Result"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Vector"%>
<%@page import="Model.DAO"%>
<%@page import="Model.Data"%>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
<style>
.back
{
  color: white;
  margin-left: 2.5%
}
</style>
</head>
<body>
 <h2><a class="back" href="allProductEditProduct.jsp"><i class='fas fa-arrow-circle-left'> Back</i></a></h2>
<%
String id=request.getParameter("id");
/*
Data d=new Data();
d.setId(id);

Vector v=DAO.editProduct(d);
Iterator ii=v.iterator();
//Data d1=(Data)ii.next();
*/
try{
	Connection con=DAO.getCon();
	PreparedStatement pst=con.prepareStatement("select * from product where id=?");
	pst.setString(1, id);
	ResultSet rs=pst.executeQuery();
	while(rs.next())
	{
%>

<form action="editProductAction.jsp" method="post">
<input type="hidden" name="id" value="<%out.println(id);%>">
<div class="left-div">
 <h3>Enter Name</h3>
	<input class="input-style" type="text" name="name"  value="<%=rs.getString(2)%>" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input class="input-style" type="text" name="catagory" value="<%=rs.getString(3)%>" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style" type="number" name="price"  value="<%=rs.getString(4)%>" required>
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
<select class="input-style" name="active">
   	<option value="Yes">Yes</option>
   	<option value="No">No</option>
   </select>
 <hr>
</div>
 <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
 </form>
<%
}
}catch(Exception e){
	e.printStackTrace();
}
%>


</body>
<br><br><br>
</body>
</html>