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
 * Servlet implementation class Update_item
 */
@WebServlet("/Update_item")
public class Update_item extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_item() {
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
        String by = request.getParameter("by");
        String table = request.getParameter("table");
        String content = request.getParameter("content");
        String item = request.getParameter("item");
        String update_content = request.getParameter("update_content");
        
        coop.update_by_on(by, table, content, item, update_content);
   	 response.setCharacterEncoding("UTF-8");
   	 coop.close();
   	
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

