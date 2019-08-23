<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="basic_class.*" %>
<%@ page import="model.*" %>

    <%
    	String username = request.getParameter("username");
        	String password = request.getParameter("password");
        	String email = request.getParameter("email");
        	String question = request.getParameter("question");
        	String answer = request.getParameter("answer");  
        	Users user = new Users(username, password, email, question, answer,"normal user");
        	
        	Common_operation coop = new Common_operation();
        	ArrayList<ArrayList<String>> check_email = coop.get_by_from("*", "email", "user", email);
        	if(check_email != null){
        		out.println("<script>alert('This email has already been registered! Please log in!');window.location.href='../view/login.jsp';</script>");

        	}else{
        		//System.out.println(user.get_is_manager());
            	Insert_operation usop = new Insert_operation();
            	boolean success = usop.insert_to_user(user);
            	if(success){
            		
            		ArrayList<ArrayList<String>> result = coop.get_by_from("*", "email", "user", email);
            		session.setAttribute("username", username);
            		session.setAttribute("user_id", result.get(0).get(0));
            		
            		out.println("<script>alert('register successful!');window.location.href='../view/index.jsp';</script>");
            		;
            		
            		
            	}else{
            		out.println("<script>alert('register failed! Please try again!');window.location.href='../view/register.jsp';</script>");

            	}
            	usop.close();
        	}
        	coop.close();
        	
    %>