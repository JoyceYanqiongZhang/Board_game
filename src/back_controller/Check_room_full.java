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
 * Servlet implementation class Check_room_full
 */
@WebServlet("/Check_room_full")
public class Check_room_full extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Check_room_full() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //response.getWriter().append("Served at: ").append(request.getContextPath());
    	//System.out.print("checking is full");
        String room_id = request.getParameter("room_id");
        Common_operation coop = new Common_operation();
        String is_full;
        
        //check if the room is full
        String room_size = coop.get_by_from("size", "id", "room",room_id).get(0).get(0);
        int room_size_int = Integer.parseInt(room_size.trim());
        int num_of_player = coop.get_by_from("*", "room_id", "room_players", room_id).size();
        if(room_size_int == num_of_player || room_size_int < num_of_player) {
        	is_full = "Y";
        }else {
        	is_full = "N";
        }
        System.out.println(room_size_int);
        System.out.println(num_of_player);

        
        
   	 response.setCharacterEncoding("UTF-8");
   	
     PrintWriter out = response.getWriter();
     out.write(is_full);
        
        out.println();
        out.flush();
        coop.close();
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        doGet(request, response);
    }

}

