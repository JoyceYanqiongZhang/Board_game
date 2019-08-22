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
	
	public ArrayList<ArrayList<String>> get_leaderboard(String show_time, String show_type){
			ArrayList<ArrayList<String>> result = new ArrayList<>();
			
			//define time restriction statement
			String time_define = "";
			if(show_time.equals("day")) {
				time_define = "DAY(g.date) = DAY(CURDATE()) AND MONTH(g.date) = MONTH(CURDATE()) AND WEEK(g.date) = WEEK(CURDATE()) AND YEAR(g.date) = YEAR(curdate()) ";
			}else if(show_time.equals("week")) {
				time_define = "MONTH(g.date) = MONTH(CURDATE()) AND WEEK(g.date) = WEEK(CURDATE()) AND YEAR(g.date) = YEAR(curdate()) ";
			}else if(show_time.equals("month")) {
				time_define = "MONTH(g.date) = MONTH(CURDATE()) AND YEAR(g.date) = YEAR(curdate()) ";
			}
			
			String sql="";
			if(show_type.equals("most_win")) {
				sql="SELECT COUNT(win_id),win_id FROM game_record AS g WHERE " + time_define+ " GROUP BY win_id ORDER BY COUNT(win_id) DESC;";
			}else if(show_type.equals("most_play")) {
				sql="SELECT COUNT(join1.player_id),join1.player_id FROM ( SELECT g.id AS gid ,g.room_id,g.win_id,g.date,r.id as rid,r.player_id FROM game_record AS g \n" + 
						"JOIN room_players as r ON g.room_id = r.room_id\n" + 
						"WHERE " + time_define + ") AS join1 GROUP BY join1.player_id ORDER BY COUNT(join1.player_id) DESC;";
			}else if(show_type.equals("most_rate")) {
				sql="SELECT join2.count_player_id,join2.player_id, join3.count_win_id,join3.count_win_id/join2.count_player_id AS win_rate FROM (SELECT COUNT(join1.player_id) AS count_player_id,join1.player_id FROM \n" + 
						"( SELECT g.id AS gid ,g.room_id,g.win_id,g.date,r.id as rid,r.player_id FROM game_record AS g \n" + 
						"JOIN room_players as r ON g.room_id = r.room_id\n" + 
						"WHERE " + time_define + ")\n" + 
						" AS join1 GROUP BY join1.player_id )\n" + 
						" AS join2\n" + 
						" JOIN (SELECT COUNT(win_id) AS count_win_id,win_id FROM game_record AS g WHERE " + time_define + " GROUP BY win_id ORDER BY COUNT(win_id) DESC) AS join3\n" + 
						"ON join2.player_id = join3.win_id  ORDER BY win_rate DESC;";
			}
			
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
