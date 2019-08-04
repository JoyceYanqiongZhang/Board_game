package model;
import java.sql.*;

public class Connect_database {
	String driver="com.mysql.jdbc.Driver";
	String url="jdbc:mysql://127.0.0.1:3306/board_game";
	String userName="root";
	String userPassword="zyq123456";
	java.sql.Connection con;
	java.sql.Statement stmt;
	String name;
	String password;
	Statement stml=null;
	
	
	
	public Connect_database() {
		try{
			Class.forName(driver);
			con=DriverManager.getConnection(url,userName,userPassword);
			stmt=con.createStatement();
		}catch(Exception e){
			System.out.println("database connection failed"+e.toString());
		}
	}
	
	public java.sql.Connection get_con() {
		return con;
	}
	
	public void close() {
		try {
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
