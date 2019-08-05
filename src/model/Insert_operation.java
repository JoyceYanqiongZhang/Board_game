package model;
import java.sql.*;
import basic_class.*;



public class Insert_operation {
	java.sql.Connection con;
	
	public Insert_operation() {
		con = new Connect_database().get_con();
		
	}
		
	public boolean insert_to_user(Users user) {
		String sql="INSERT INTO `board_game`.`user` (`username`, `password`, `email`, `gender`, `location`, `date_of_birth`, `is_manager`, `pic`, `is_blocked`, `wins`, `played`, `recover_question`, `recover_answer`, `is_online`) VALUES ('"+ user.get_username()+ "','"+ user.get_password()+ "','" +user.get_email()+ "','" +user.get_gender()+ "','" +user.get_location()+ "'," +user.get_date_of_birth()+ ",'" +user.get_is_manager()+ "','" +user.get_pic()+ "','" +user.get_is_blocked()+ "','" +user.get_wins()+ "','" +user.get_played()+ "','" +user.get_recover_question()+ "','" +user.get_recover_answer()+ "','" + user.get_is_online() + "')";
		PreparedStatement st;
		boolean success = true;
		try {
			System.out.println(sql);
			st = con.prepareStatement(sql);
			st.execute();
			st.close();
			con.close();
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
	
	public boolean insert_to_game(Games game) {
		String sql="INSERT INTO `board_game`.`game` (`name`,`play_min`,`play_max`,`rules`,`description`,`pic`) VALUES ('"+ game.get_name()+ "','"+ game.get_player_min()+ "','" +game.get_player_max()+ "','" +game.get_rules()+ "','" +game.get_description()+ "'," +game.get_pic()+ "')";
		PreparedStatement st;
		boolean success = true;
		try {
			System.out.println(sql);
			st = con.prepareStatement(sql);
			st.execute();
			st.close();
			con.close();
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
	
	public boolean insert_to_room(Room room) {
		String sql="INSERT INTO `board_game`.`room` (`game_id`,`size`,`is_blocked`,`host_id`,`is_public`,`room_log`) VALUES ('"+ room.get_game_id()+ "','"+ room.get_size()+ "','" +room.get_is_blocked()+ "','" +room.get_host_id()+ "','" +room.get_is_public()+ "'," +room.get_room_log()+ "')";
		PreparedStatement st;
		boolean success = true;
		try {
			System.out.println(sql);
			st = con.prepareStatement(sql);
			st.execute();
			st.close();
			con.close();
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
	
	public boolean insert_to_comment(Comment comment) {
		String sql="INSERT INTO `board_game`.`comment` (`postby_id`,`game_id`,`content`,`replyto_id`,`time`) VALUES ('"+ comment.get_postby_id()+ "','"+ comment.get_game_id()+ "','" +comment.get_content()+ "','" +comment.get_replyto_id()+ "','" +comment.get_time()+ "')";
		PreparedStatement st;
		boolean success = true;
		try {
			System.out.println(sql);
			st = con.prepareStatement(sql);
			st.execute();
			st.close();
			con.close();
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
	
	public boolean insert_to_game_record(Game_record game_record) {
		String sql="INSERT INTO `board_game`.`game_record` (`game_id`,`win_id`,`date`) VALUES ('"+ game_record.get_game_id()+ "','"+ game_record.get_win_id()+ "','" +game_record.get_date()+ "')";
		PreparedStatement st;
		boolean success = true;
		try {
			System.out.println(sql);
			st = con.prepareStatement(sql);
			st.execute();
			st.close();
			con.close();
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
	
	public boolean insert_to_messege(Messege messege) {
		String sql="INSERT INTO `board_game`.`messege` (`postby_id`,`room_id`,`time`) VALUES ('"+ messege.get_postby_id()+ "','"+ messege.get_room_id()+ "','" +messege.get_time()+ "')";
		PreparedStatement st;
		boolean success = true;
		try {
			System.out.println(sql);
			st = con.prepareStatement(sql);
			st.execute();
			st.close();
			con.close();
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
	
	public boolean insert_to_report(Report report) {
		String sql="INSERT INTO `board_game`.`report` (`by_id`,`content`,`condition`) VALUES ('"+ report.get_by_id()+ "','"+ report.get_content()+ "','" +report.get_condition()+ "')";
		PreparedStatement st;
		boolean success = true;
		try {
			System.out.println(sql);
			st = con.prepareStatement(sql);
			st.execute();
			st.close();
			con.close();
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
	
	public boolean insert_relationship(String table, Relationship relationship) {
		String sql;
		if(table.equals("game_tag")){
			sql="INSERT INTO `board_game`.`" + table + "` (`" +relationship.get_name1() +"`,`" + relationship.get_name2() + "`) VALUES ('"+ relationship.get_id1() + "','"+ relationship.get_tag() + "')";
		}else {
			sql="INSERT INTO `board_game`.`" + table + "` (`" +relationship.get_name1() +"`,`" + relationship.get_name2() + "`) VALUES ('"+ relationship.get_id1() + "','"+ relationship.get_id2() + "')";

		}
		PreparedStatement st;
		boolean success = true;
		try {
			System.out.println(sql);
			st = con.prepareStatement(sql);
			st.execute();
			st.close();
			con.close();
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
	
	
}

