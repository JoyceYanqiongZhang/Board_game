package back_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
 * Servlet implementation class Create_room
 */
@WebServlet("/Create_room")
public class Create_room extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Create_room() {
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
    	Insert_operation inop = new Insert_operation();
    	
        String new_room_game = request.getParameter("new_room_game");
        String user_id = request.getParameter("hidden_user_id");
        String user_name = coop.get_by_from("username", "id", "user", user_id).get(0).get(0);
        
        ArrayList<String> thisgame = coop.get_by_from("*", "id", "game", new_room_game).get(0);
        Room room = new Room(Integer.parseInt(new_room_game.trim()), Integer.parseInt(thisgame.get(3).trim()), Integer.parseInt(user_id.trim()));
        String room_id = inop.insert_to_room(room);
        
        //create the relationship beteewn the creator and the room
        Relationship re = new Relationship("room_id","player_id",Integer.parseInt(room_id.trim()),Integer.parseInt(user_id.trim()));
        inop.insert_relationship("room_players", re);
        
        //update room log
        //get current time
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//set the date format
        df.format(new Date());
        coop.update_by_on("id", "room", room_id, "room_log", df.format(new Date()) + "  " + user_name + " created the room as the room host<br>");
        
        //System.out.println(room_id);
        response.sendRedirect("http://localhost:8080/BoardGamePlatform/view/room_details.jsp?r="+room_id);
        
        
        
   	 response.setCharacterEncoding("UTF-8");
   	
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

