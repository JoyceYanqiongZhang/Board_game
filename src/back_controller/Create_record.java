package back_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.RepaintManager;

import org.json.JSONException;
import org.json.JSONObject;

import basic_class.*;
import model.*;

/**
 * Servlet implementation class Create_record
 */
@WebServlet("/Create_record")
public class Create_record extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Create_record() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //response.getWriter().append("Served at: ").append(request.getContextPath());
        String is_robot = request.getParameter("is_robot");
        String room_id = request.getParameter("room_id");
        String win_id = request.getParameter("win_id");
        String current_user_id = request.getParameter("current_user_id");
        Common_operation coop = new Common_operation();
        Insert_operation inop = new Insert_operation();
        
      
        
        if(is_robot.equals("N")) {
	        
        	//create a new game record
 	       
            Game_record gr = new Game_record(Integer.parseInt(room_id.trim()),win_id);
            inop.insert_to_game_record(gr);
            
	        //winner's  win +1
	        if(!win_id.equals("none")) {
		        ArrayList<ArrayList<String>> winner_play_win = coop.get_by_from("played,wins", "id", "user", win_id);
		        //int winner_play_plus = Integer.parseInt(winner_play_win.get(0).get(0)) +1;
		        int winner_win_plus = Integer.parseInt(winner_play_win.get(0).get(1).trim()) +1;
		        //coop.update_by_on("id", "user", win_id, "played", String.valueOf(winner_play_plus));
		        coop.update_by_on("id", "user", win_id, "wins", String.valueOf(winner_win_plus));
	        }
	        //loser's play +1
	        ArrayList<ArrayList<String>> room_players = coop.get_by_from("*", "room_id", "room_players", room_id);
	    	ArrayList<String> room_players_ids = new ArrayList<String>();
	    	for(int i=0; i<room_players.size(); i++){
	    		room_players_ids.add(room_players.get(i).get(1));
	    	}
	    	for(int i =0;i<room_players_ids.size();i++) {
		    		ArrayList<String> thisplayer = coop.get_by_from("*", "id", "user", room_players_ids.get(i)).get(0);
		    		int loser_play_plus = Integer.parseInt(thisplayer.get(11).trim()) +1;
			        coop.update_by_on("id", "user", thisplayer.get(0) , "played", String.valueOf(loser_play_plus));
		        
	    	}
        }else if(is_robot.equals("Y")) {
        	//player's played +1
	        ArrayList<String> thisplayer_play_win = coop.get_by_from("played,wins", "id", "user", current_user_id).get(0);
	        int thisplayer_play_plus = Integer.parseInt(thisplayer_play_win.get(0).trim()) +1;
	        coop.update_by_on("id", "user", current_user_id, "played", String.valueOf(thisplayer_play_plus));

        	//if the player wins
        	if(!win_id.equals("robot")) {
        		int thisplayer_win_plus = Integer.parseInt(thisplayer_play_win.get(1).trim()) +1;
    	        coop.update_by_on("id", "user", current_user_id, "wins", String.valueOf(thisplayer_win_plus));
        	}
        }
		
        
        
        
   	 response.setCharacterEncoding("UTF-8");
   	 coop.close();
   	 inop.close();
   	
     //PrintWriter out = response.getWriter();
     //out.write();
        
        //out.println();
        //out.flush();
        
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}

