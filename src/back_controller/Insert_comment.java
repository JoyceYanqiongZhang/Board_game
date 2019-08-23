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
 * Servlet implementation class Insert_comment
 */
@WebServlet("/Insert_comment")
public class Insert_comment extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Insert_comment() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //response.getWriter().append("Served at: ").append(request.getContextPath());

    	Insert_operation inop = new Insert_operation();
    	
        String postby_id = request.getParameter("postby_id");
        String game_id = request.getParameter("game_id");
        String content = request.getParameter("content");
        
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//set the date format
        df.format(new Date());
        //System.out.println(Integer.parseInt(postby_id.trim())+ " | " +Integer.parseInt(game_id.trim())+ " | " +content+ " | " +"none"+ " | " );
        Comment comment = new Comment(Integer.parseInt(postby_id.trim()),Integer.parseInt(game_id.trim()),content,"none",df.format(new Date()));
        inop.insert_to_comment(comment);
        response.setCharacterEncoding("UTF-8");
   	 inop.close();
   	
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

