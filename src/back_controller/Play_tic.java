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
 * Servlet implementation class Play_tic
 */
@WebServlet("/Play_tic")
public class Play_tic extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Play_tic() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        //response.getWriter().append("Served at: ").append(request.getContextPath());
    	 
        String if_update = request.getParameter("if_update");
        System.out.println(if_update);
        String room_id = request.getParameter("room_id");
        Common_operation coop = new Common_operation();
        if(if_update.equals("Y")) {
	        String tiles[] = {"","","","","","","","","","","",""};
	        tiles[0] = request.getParameter("t0");
	        tiles[1] = request.getParameter("t1");
	        tiles[2] = request.getParameter("t2");
	        tiles[3] = request.getParameter("t3");
	        tiles[4] = request.getParameter("t4");
	        tiles[5] = request.getParameter("t5");
	        tiles[6] = request.getParameter("t6");
	        tiles[7] = request.getParameter("t7");
	        tiles[8] = request.getParameter("t8");
	        String datastr = tiles[0] + "," + tiles[1] + "," + tiles[2] + "," + tiles[3] + "," + tiles[4] + "," + tiles[5] + "," + tiles[6] + "," + tiles[7] + "," + tiles[8];
	        coop.update_by_on("id", "room", room_id, "room_play", datastr);
        }
        
   	 response.setCharacterEncoding("UTF-8");
   	 ;
   	 String send_back_str = coop.get_by_from("room_play", "id", "room", room_id).get(0).get(0);
   	 String send_back_str_array[] = send_back_str.split(",");
   	 JSONObject jobj = new JSONObject();
   	 for(int i=0; i<9; i++) {
   		 try {
			jobj.put("t"+i, send_back_str_array[i]);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
   	 }
     PrintWriter out = response.getWriter();
     out.write(jobj.toString());
        
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

