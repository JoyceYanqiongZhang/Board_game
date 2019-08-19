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
 * Servlet implementation class Check_room_started
 */
@WebServlet("/Check_room_started")
public class Check_room_started extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Check_room_started() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //response.getWriter().append("Served at: ").append(request.getContextPath());
    	System.out.println("started check invoked");
        String room_id = request.getParameter("room_id");
        Common_operation coop = new Common_operation();
        String is_change = request.getParameter("is_change");
        if(is_change.equals("Y")) {
        	coop.update_by_on("id", "room", room_id, "is_started", "1");
        }
        
        
        String is_started = coop.get_by_from("is_started", "id", "room",room_id).get(0).get(0);
        
        
   	 response.setCharacterEncoding("UTF-8");
   	
     PrintWriter out = response.getWriter();
     out.write(is_started);
        
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

