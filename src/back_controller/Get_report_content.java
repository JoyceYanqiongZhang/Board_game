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
 * Servlet implementation class Get_report_content
 */
@WebServlet("/Get_report_content")
public class Get_report_content extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Get_report_content() {
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
    	
        String report_id = request.getParameter("report_id");
        String content = coop.get_by_from("content", "id", "report", report_id).get(0).get(0);
        //System.out.println(room_log);
   	 response.setCharacterEncoding("UTF-8");
   	
   	 coop.close();
     PrintWriter out = response.getWriter();
     out.write(content);
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

