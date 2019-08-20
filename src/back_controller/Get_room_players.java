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
 * Servlet implementation class Get_room_players
 */
@WebServlet("/Get_room_players")
public class Get_room_players extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Get_room_players() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //response.getWriter().append("Served at: ").append(request.getContextPath());
    	Common_operation coop = new Common_operation();
    	
        String room_id = request.getParameter("room_id");
        ArrayList<ArrayList<String>> room_player_re = coop.get_by_from("*", "room_id", "room_players", room_id);
        ArrayList<String> player_ids = new ArrayList<String>();
        for(int i=0;i<room_player_re.size();i++) {
        	player_ids.add(room_player_re.get(i).get(1));
        }
        JSONObject player_set = new JSONObject();        
        for(int i=0; i<player_ids.size(); i++) {
            
            try {
				player_set.put("player" + i, coop.get_by_from("*", "id", "user", player_ids.get(i)).get(0));
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

        }
        
        System.out.println(player_set.toString());
   	 response.setCharacterEncoding("UTF-8");
   	
   	 coop.close();
     PrintWriter out = response.getWriter();
     out.write(player_set.toString());
     out.println();
     out.flush();
        
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}

