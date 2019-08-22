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
 * Servlet implementation class Match_room
 */
@WebServlet("/Match_room")
public class Match_room extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Match_room() {
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
    	String user_id = request.getParameter("user_id");
    	ArrayList<ArrayList<String>> room_set = coop.get_by_from("*", "is_public", "room", "1" );

        ArrayList<ArrayList<String>> available_room_set = new ArrayList<ArrayList<String>>();
        for(int i=0;i<room_set.size();i++){
        	
        	String num_of_players = coop.get_by_from("COUNT(*)", "room_id", "room_players", room_set.get(i).get(0)).get(0).get(0);
        	//room not full
        	if(Integer.parseInt(num_of_players.trim()) < Integer.parseInt(room_set.get(i).get(2).trim())) {
        		//user is not the host
        		if(!user_id.equals(room_set.get(i).get(4))) {
        			available_room_set.add(room_set.get(i));
        		}
        	}
        }
        
        //get a random int
        String to_url = "";
        if(available_room_set!= null) {
        	int set_size = available_room_set.size();
            int random_int = (int)(Math.random()*set_size);
            String room_id = available_room_set.get(random_int).get(0);
            to_url ="http://localhost:8080/BoardGamePlatform/view/room_details.jsp?r="+room_id+"&c=take_a_seat";
        }
        //response.sendRedirect("http://localhost:8080/BoardGamePlatform/view/room_details.jsp?r="+room_id);
        
        response.setCharacterEncoding("UTF-8");
    	
       
   	
   	 coop.close();
     PrintWriter out = response.getWriter();
     out.write(to_url);
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

