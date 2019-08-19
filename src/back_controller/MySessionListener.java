package back_controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class MySessionListener implements HttpSessionListener{
	@Override
	public void sessionCreated(HttpSessionEvent se) {
		Map<String, HttpSession> onLines =(Map<String, HttpSession>) se.getSession().getServletContext().getAttribute("onLines");
		if(onLines==null){//first one
			onLines = Collections.synchronizedMap( new HashMap<String, HttpSession>() ); 
			se.getSession().getServletContext().setAttribute("onLines",onLines);
		}
		onLines.put(se.getSession().getId(), se.getSession());
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		Map<String, HttpSession> onLines =(Map<String, HttpSession>) se.getSession().getServletContext().getAttribute("onLines");
		if(onLines.containsKey(se.getSession().getId())){
			onLines.remove( se.getSession().getId() );
		}
	}

}
