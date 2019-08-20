<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="basic_class.*" %>
<%@ page import="model.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Board Game Platform</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="http://localhost:8080/BoardGamePlatform/view/css/css.css" rel="stylesheet" type="text/css" />
    <link href="http://localhost:8080/BoardGamePlatform/view/css/css_joyce.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="http://localhost:8080/BoardGamePlatform/view/js/jquery-1.8.2.min.js"></script>
    <script src="http://localhost:8080/BoardGamePlatform/view/js/switch.js"></script>
    <script src="http://localhost:8080/BoardGamePlatform/view/js/js.js"></script>
    <script src="http://localhost:8080/BoardGamePlatform/view/general_script.js"></script>
    
    <style>
        html {
            overflow: hidden;
        }
    </style>
</head>
<body onload = "load_refresh()">
<div class="the_page">

<input type="hidden" id="user_id" name= "user_id"value="<% out.println(session.getAttribute("user_id")); %>">
<input type="hidden" id="user_name" name= "user_name"value="<% out.println(session.getAttribute("username")); %>">



<script type="text/javascript">
//online checking

//code from: https://blog.csdn.net/chengqiuming/article/details/78600118 
//author: cakincqm
//source: CSDN
//add offline listener
window.addEventListener("offline" , function()
{
	alert("You are Offline now!");
	offline_update();
} , true);


</script>

<input type="hidden" id="hidden_user_id" name= "hidden_user_id" value="<% out.println(session.getAttribute("id")); %>">
<div class="vertical_100">
    <div class="head">
        
        <ul>
        	<li>
	        	<a href="index.jsp" class="logo">
	            <img src="http://localhost:8080/BoardGamePlatform/view/images/logob.png" alt="Here is Joyce's board game site" />
	        	</a>
        	</li>
            <li><a href="http://localhost:8080/BoardGamePlatform/view/index.jsp" class="active">Home<br /><span>Home</span></a></li>
        	<li class="nav_num4"><a>Game<br /><span>Game</span></a></li>
        	<li class="nav_num3"><a href="http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num3">Room<br /><span>Room</span></a></li>
        	<li class="nav_num5"><a  href="http://localhost:8080/BoardGamePlatform/back_controller/ShowServlet">Players<br /><span>Players</span></a></li>
            <li class="nav_num2"><a>Leaderboard<br /><span>Leaderboard</span></a></li>
            <li class="nav_num6"><a>My Account<br /><span>My Account</span></a></li>
        </ul>
        <div class="hotline">
            <span>Hi, <% if(session.getAttribute("username") != null)
            {out.println(session.getAttribute("username"));}
            else{out.println("Visitor");}
            %></span>
            <span style="display : <% if(session.getAttribute("username") != null){
					out.println("none");
				}else{
					out.println("block");
				}
				%>"><p><a href="http://localhost:8080/BoardGamePlatform/view/login.jsp">Login</a> | <a href="http://localhost:8080/BoardGamePlatform/view/register.jsp">Sign up</a></p></span>
				
				<span style="display : <% if(session.getAttribute("username") != null){
					out.println("block");
				}else{
					out.println("none");
				}
				%>"><p><a href="logout.jsp">Logout</a></p></span>
        </div>
        <div class="xiangying_nav"></div>
    </div>
    <script>
        $('.head ul li a').hover(function () {
            $(this).stop().animate({ 'margin-top': '-30px' }, 200)
        }, function () {
            $(this).stop().animate({ 'margin-top': '0px' }, 200)
        })
    </script>
    <div class=" header">
        <a href="index.jsp" class="logo">
            <img src="http://localhost:8080/BoardGamePlatform/view/images/logob.png" alt="Here is Joyce's board game site" />
        </a>
        <ul>
        	<li>
	        	<a href="index.jsp" class="logo">
	            	<img src="http://localhost:8080/BoardGamePlatform/view/images/logob.png" alt="Here is Joyce's board game site" />
	        	</a>
        	</li>
            <li><a href="http://localhost:8080/BoardGamePlatform/view/index.jsp" class="active">Home<br /><span>Home</span></a></li>
        	<li class="nav_num4"><a>Game<br /><span>Game</span></a></li>
        	<li class="nav_num3"><a href="http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num3">Room<br /><span>Room</span></a></li>
        	<li class="nav_num5"><a href="http://localhost:8080/BoardGamePlatform/back_controller/ShowServlet">Players<br /><span>Players</span></a></li>
            <li class="nav_num2"><a>Leaderboard<br /><span>Leaderboard</span></a></li>
            <li class="nav_num6"><a>My Account<br /><span>My Account</span></a></li>
        </ul>
        <div class="hotline">
            <img src="http://localhost:8080/BoardGamePlatform/view/images/telw.png" alt="" />
            <span>010-57732658</span>
        </div>
        <div class="xiangying_nav"></div>
    </div>
    
</div>

    <script>
        $(function () {
            $('.xiangying_nav').toggle(
                function () {
                    $('.head ul,.header ul').css('right', '0')
                },
                function () {
                    $('.head ul,.header ul').css('right', '-67px')
                }
              )
        })
        $('.header ul li a').hover(function () {
            $(this).stop().animate({ 'margin-top': '-30px' }, 200)
        }, function () {
            $(this).stop().animate({ 'margin-top': '0px' }, 200)
        })
    </script>
