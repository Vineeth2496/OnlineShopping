package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Vector;

import javax.sql.rowset.JdbcRowSet;
import javax.sql.rowset.RowSetFactory;
import javax.sql.rowset.RowSetProvider;

public class DAO {
	
	public static Connection getCon() {
		Connection con=null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rcpit76", "root", "vine96");
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		
		return con;
	}
	
	public static int insert(Data d) {
		int res=0;
		Connection con=DAO.getCon();
		try {
			String query="insert into users values(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement pst=con.prepareStatement(query);
			pst.setString(1, d.getName());
			pst.setString(2, d.getEmail());
			pst.setLong(3, d.getMobileNumber());
			pst.setString(4, d.getSecurityQuestion());
			pst.setString(5, d.getAnswer());
			pst.setString(6, d.getPassword());
			pst.setString(7, d.getAddress());
			pst.setString(8, d.getCity());
			pst.setString(9, d.getState());
			pst.setString(10, d.getCountry());
			
			res=pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public static Vector validate() {
		Vector v=new Vector<>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			RowSetFactory rsf=RowSetProvider.newFactory();
			JdbcRowSet jrs=rsf.createJdbcRowSet();
			jrs.setUrl("jdbc:mysql://localhost:3306/rcpit76");
			jrs.setUsername("root");
			jrs.setPassword("vine96");
			jrs.setCommand("select email, password from users");
			jrs.execute();
			
			while(jrs.next()) {
				v.add(jrs.getString("email"));
				v.add(jrs.getString("password"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
				
		return v;
	}
	
	public static int forgot_Password(Data d) {
		int res=0;
		Connection con=DAO.getCon();
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			RowSetFactory rsf=RowSetProvider.newFactory();
			JdbcRowSet jrs=rsf.createJdbcRowSet();
			jrs.setUrl("jdbc:mysql://localhost:3306/rcpit76");
			jrs.setUsername("root");
			jrs.setPassword("vine96");
			jrs.setCommand("select * from users where email=? and mobileNumber=? and securityQuestion=? and answer=? ");
			jrs.setString(1, d.getEmail());
			jrs.setLong(2, d.getMobileNumber());
			jrs.setString(3, d.getSecurityQuestion());
			jrs.setString(4, d.getAnswer());
			jrs.execute();
			
			while(jrs.next()) {
				PreparedStatement pst=con.prepareStatement("update users set password=? where email=?");
				pst.setString(1, d.getPassword());
				pst.setString(2, d.getEmail());
				res=pst.executeUpdate();
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}
	
	
	
	public static int productId() {
		int id=1;
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");
			RowSetFactory rsf=RowSetProvider.newFactory();
			JdbcRowSet jrs=rsf.createJdbcRowSet();
			jrs.setUrl("jdbc:mysql://localhost:3306/rcpit76");
			jrs.setUsername("root");
			jrs.setPassword("vine96");
			jrs.setCommand("select max(id) from product");
			jrs.execute();
			
			while(jrs.next()) {
				id=jrs.getInt(1);
				id=id+1;
			}
		//return id;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return id;
	}
	
	public static int addProduct(Data d) {
		int res=0;
		Connection con=DAO.getCon();
		try {
			PreparedStatement pst=con.prepareStatement("insert into product values(?,?,?,?,?)");
			pst.setString(1, d.getId());
			pst.setString(2, d.getPname());
			pst.setString(3, d.getCategory());
			pst.setString(4, d.getPrice());
			pst.setString(5, d.getActive());
			
			res=pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public static Data fetchProduct() {
		Data d=new Data();
		//Vector v=new Vector<>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			RowSetFactory rsf=RowSetProvider.newFactory();
			JdbcRowSet jrs=rsf.createJdbcRowSet();
			jrs.setUrl("jdbc:mysql://localhost:3306/rcpit76");
			jrs.setUsername("root");
			jrs.setPassword("vine96");
			jrs.setCommand("select * from product");
			jrs.execute();
			
			while(jrs.next()) {
				d.setId(jrs.getString("id"));
				d.setPname(jrs.getString("name"));
				d.setCategory(jrs.getString("catagory"));
				d.setPrice(jrs.getString("price"));
				d.setActive(jrs.getString("active"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return d;
	}
	
	
	public static Vector editProduct(Data d) {
		
		Vector v=new Vector<>();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			RowSetFactory rsf=RowSetProvider.newFactory();
			JdbcRowSet jrs=rsf.createJdbcRowSet();
			jrs.setUrl("jdbc:mysql://localhost:3306/rcpit76");
			jrs.setUsername("root");
			jrs.setPassword("vine96");
			jrs.setCommand("select * from product");
			jrs.execute();
			
			while(jrs.next()) {
				d.setId(jrs.getString("id"));
				d.setName(jrs.getString("name"));
				d.setCategory(jrs.getString("catagory"));
				d.setPrice(jrs.getString("price"));
				d.setActive(jrs.getString("active"));
				v.add(d);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	return v;
		}
	
	public static int editUpdate(Data d) {
		int res=0;
		Connection con=DAO.getCon();
		try {
			String query="update product set name=?, catagory=?, price=?, active=? where id=?";
			PreparedStatement pst=con.prepareStatement(query);
			pst.setString(1, d.getName());
			pst.setString(2, d.getCategory());
			pst.setString(3, d.getPrice());
			pst.setString(4, d.getActive());
			pst.setString(5, d.getId());
			
			res=pst.executeUpdate();
			
			if(d.getActive().equals("No")) {
				String query2="delete from cart where product_id=? and address is NULL";
				PreparedStatement pst2=con.prepareStatement(query2);
				pst2.setString(1, d.getId());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	
}
