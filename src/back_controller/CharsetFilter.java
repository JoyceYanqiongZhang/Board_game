package back_controller;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class CharsetFilter implements Filter{
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		//get user ip and save it to the session
		HttpServletRequest req = (HttpServletRequest) request;
		if(req.getSession().getAttribute("ip")==null){
			req.getSession().setAttribute("ip", req.getRemoteAddr() );
		}
		
		chain.doFilter(request, response);
		
	}

	@Override
	public void destroy() {
	}
   
}
