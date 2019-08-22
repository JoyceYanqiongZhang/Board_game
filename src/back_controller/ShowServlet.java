package back_controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ShowServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<String,HttpSession> onLines= (Map<String,HttpSession>) getServletContext().getAttribute("onLines");
		//get the request page
		String request_page = request.getParameter("from");
		//System.out.println(getServletContext().getAttribute("onLines"));
		System.out.println("showsevlet" + onLines);
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		//go through onlines, wrap every session to a map(with name, creat time, last access time and ip in it). add the map to the list
		Iterator<Entry<String, HttpSession>> it = onLines.entrySet().iterator();
		while(it.hasNext()){
			Entry<String, HttpSession> en = it.next();
			Map<String,Object> m = new HashMap<String, Object>();
			m.put("id", en.getValue().getId());
			m.put("current_user", en.getValue().getAttribute("current_user"));
			String creationTime = sdf.format( new Date(en.getValue().getCreationTime()) );
			m.put("creationTime", creationTime);
			String lastAccessTime = sdf.format( new Date(en.getValue().getLastAccessedTime()) );
			m.put("lastAccessTime", lastAccessTime);
			m.put("ip", en.getValue().getAttribute("ip") ); //the ip is capsuled in CharsetFilter
			
			list.add(m);			
		}
		System.out.println(list);
		request.setAttribute("onLines",list);
		request.getRequestDispatcher("../view/" + request_page + ".jsp").forward(request, response);
	}

}

