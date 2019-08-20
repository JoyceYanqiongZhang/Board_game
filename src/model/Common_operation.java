package model;
import java.sql.*;
import basic_class.*;
import java.util.*;


public class Common_operation {
	java.sql.Connection con;
	PreparedStatement st;
	
	public Common_operation() {
		con = new Connect_database().get_con();
		
	}
	
	public ArrayList<ArrayList<String>> get_by_from(String get, String by, String table, String content) {
		ArrayList<ArrayList<String>> result = new ArrayList<>();
		String sql="SELECT "+ get +" FROM "+ table + " WHERE " + by + "='" + content +"'";
		
		try {
			System.out.println(sql);
			st = con.prepareStatement(sql);
			ResultSet rs=st.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData() ; 
			int columnCount = rsmd.getColumnCount();
			while(rs.next()) {
				ArrayList<String> tempArray = new ArrayList<>();
				String temp;
				for(int i=1;i<=columnCount;i++) {
					temp = String.valueOf(rs.getObject(i));
					tempArray.add(temp);
				}
				result.add(tempArray);
			}
			//System.out.println(sql);

			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getStackTrace());
			e.printStackTrace();
			return null;
	}
}

	
	public ArrayList<ArrayList<String>> get_by_from_function(String get, String by, String table, String content) {
		ArrayList<ArrayList<String>> result = new ArrayList<>();
		String sql="SELECT "+ get +" FROM "+ table + " WHERE " + by + "=" + content;
		
		try {
			System.out.println(sql);
			st = con.prepareStatement(sql);
			ResultSet rs=st.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData() ; 
			int columnCount = rsmd.getColumnCount();
			while(rs.next()) {
				ArrayList<String> tempArray = new ArrayList<>();
				String temp;
				for(int i=1;i<=columnCount;i++) {
					temp = String.valueOf(rs.getObject(i));
					tempArray.add(temp);
				}
				result.add(tempArray);
			}
			//System.out.println(sql);

			return result;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getStackTrace());
			e.printStackTrace();
			return null;
	}
}

	
	public boolean delete_by_from(String by,String table, String content) {
		String sql="DELETE FROM `board_game`.`" + table + "`  WHERE " + by + " = '" + content +"'"; 
		
		boolean success = true;
		try {
			System.out.println(sql);
			st = con.prepareStatement(sql);
			st.execute();
			System.out.println(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			success = false;
			System.out.println(e.getStackTrace());
			e.printStackTrace();
		} finally {
			return success;
		}
	}
	
	public boolean update_by_on(String by,String table, String content, String item, String update_content) {
		String sql="UPDATE `board_game`.`" + table + "` SET " + item + " = '" + update_content + "'  WHERE " + by + " = '" + content +"'"; 
		
		boolean success = true;
		try {
			System.out.println(sql);
			st = con.prepareStatement(sql);
			st.execute();
			System.out.println(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			success = false;
			System.out.println(e.getStackTrace());
			e.printStackTrace();
		} finally {
			return success;
		}
	}
	
	public boolean update_by_on_function(String by,String table, String content, String item, String update_content) {
		String sql="UPDATE `board_game`.`" + table + "` SET " + item + " = " + update_content + "  WHERE " + by + " = '" + content +"'" ; 
		//System.out.println("123");

		boolean success = true;
		try {
			System.out.println(sql);
			st = con.prepareStatement(sql);
			st.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			success = false;
			System.out.println(e.getStackTrace());
			e.printStackTrace();
		} finally {
			return success;
		}
	}
	
	public void close() {
		try {
			st.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
