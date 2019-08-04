<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="basic_class.*" %>
<%@ page import="model.*" %>
<%
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	Common_operation coop = new Common_operation();
	ArrayList<ArrayList<String>> result = coop.get_by_from("*", "email", "user", email);
	Users tempuser = new Users();
	String en_password = tempuser.Encode(password);
	System.out.println(result);
	String get_password = result.get(0).get(2);
	if(en_password.equals(get_password)){
		session.setAttribute("username", result.get(0).get(1));
		session.setAttribute("user_id", result.get(0).get(0));
		out.println("<script>alert('login successful!');window.location.href='../view/index.jsp';</script>");
		;
	}else{
		out.println("<script>alert('login failed! Please try again!');window.location.href='../view/login.jsp';</script>");

	}
	
%>
