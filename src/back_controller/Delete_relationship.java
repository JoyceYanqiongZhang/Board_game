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
 * Servlet implementation class Delete_relationship
 */
@WebServlet("/Delete_relationship")
public class Delete_relationship extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Delete_relationship() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //response.getWriter().append("Served at: ").append(request.getContextPath());
        String table = request.getParameter("table");
        String name1 = request.getParameter("name1");
        String name2 = request.getParameter("name2");
        String int1 = request.getParameter("int1");
        String int2 = request.getParameter("int2");
        
        Common_operation coop = new Common_operation();
        //Relationship re = new Relationship(name1,name2,Integer.parseInt(int1.trim()),Integer.parseInt(int2.trim()));
		String re_id = coop.get_by_from_function("id", "(" + name1 + "," + name2 + ")", table, "('" + int1 +"','" + int2 + "')").get(0).get(0);
		coop.delete_by_from("id", table, re_id);
		
        
        
        
   	 response.setCharacterEncoding("UTF-8");
   	coop.close();
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

