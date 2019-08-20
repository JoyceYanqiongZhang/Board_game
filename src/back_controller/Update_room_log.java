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
 * Servlet implementation class Update_room_log
 */
@WebServlet("/Update_room_log")
public class Update_room_log extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_room_log() {
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
    	System.out.println("servlet update working");
        String room_id = request.getParameter("room_id");
        String add_room_log = request.getParameter("add_room_log");
        coop.update_by_on("id", "room", room_id, "room_log", "CONCAT(room_log,"+ add_room_log +")");
      
   	 response.setCharacterEncoding("UTF-8");
   	
     //PrintWriter out = response.getWriter();
     //out.write(room_log);
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
