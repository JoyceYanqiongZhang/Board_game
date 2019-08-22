<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="basic_class.*" %>
<%@ page import="model.*" %>
<%@ page import="java.text.DecimalFormat" %>

<%String click_button = request.getParameter("c");
	Common_operation coop = new Common_operation();
	Users current_user = (Users)session.getAttribute("current_user");
	int i;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Board Game Platform</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="http://localhost:8080/BoardGamePlatform/view/css/css.css" rel="stylesheet" type="text/css" />
    <link href="http://localhost:8080/BoardGamePlatform/view/css/css_joyce.css" rel="stylesheet" type="text/css" />
    <link href="http://libs.baidu.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" />
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
<body onload="load('<% out.print(click_button);%>');">

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

<input type="hidden" id="hidden_user_id" name= "hidden_user_id" value="<% out.print(session.getAttribute("id")); %>">

    <div class="head">
        <a href="index.jsp" class="logo">
            <img src="./images/logob.png" alt="Here is Joyce's board game site" />
        </a>
        <ul>
            <li><a href="index.jsp" class="active">Home<br /><span>Home</span></a></li>
        	<li class="nav_num4" id="nav_num4"><a>Game<br /><span>Game</span></a></li>
        	<li class="nav_num3" id="nav_num3"><a>Room<br /><span>Room</span></a></li>
        	<li class="nav_num5" id="nav_num5"><a>Players<br /><span>Players</span></a></li>
            <li class="nav_num2" id="nav_num2"><a>Leaderboard<br /><span>Leaderboard</span></a></li>
            <li class="nav_num6" id="nav_num6" <% if(current_user == null){out.print("Style='display:none'");}%>><a href="http://localhost:8080/BoardGamePlatform/view/profile.jsp">My Account<br /><span>My Account</span></a></li>
        </ul>
        <div class="hotline">
            <span>Hi, <% if(session.getAttribute("username") != null)
            {out.print(session.getAttribute("username"));}
            else{out.print("Visitor");}
            %></span>
            <span style="display : <% if(session.getAttribute("username") != null){
					out.print("none");
				}else{
					out.print("block");
				}
				%>"><p><a href="login.jsp">Login</a> | <a href="register.jsp">Sign up</a></p></span>
				
				<span style="display : <% if(session.getAttribute("username") != null){
					out.print("block");
				}else{
					out.print("none");
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
            <img src="./images/logob.png" alt="Here is Joyce's board game site" />
        </a>
        <ul>
            <li><a href="index.jsp" class="active">Home<br /><span>Home</span></a></li>
        	<li class="nav_num4"><a>Game<br /><span>Game</span></a></li>
        	<li class="nav_num3"><a>Room<br /><span>Room</span></a></li>
        	<li class="nav_num5"><a>Players<br /><span>Players</span></a></li>
            <li class="nav_num2"><a>Leaderboard<br /><span>Leaderboard</span></a></li>
            <li class="nav_num6" <% if(current_user == null){out.print("Style='display:none'");}%>><a href="http://localhost:8080/BoardGamePlatform/view/profile.jsp">My Account<br /><span>My Account</span></a></li>
        </ul>
        <div class="hotline">
            <span>Hi, <% if(session.getAttribute("username") != null)
            {out.print(session.getAttribute("username"));}
            else{out.print("Visitor");}
            %></span>
            <span style="display : <% if(session.getAttribute("username") != null){
					out.print("none");
				}else{
					out.print("block");
				}
				%>"><p><a href="login.jsp">Login</a> | <a href="register.jsp">Sign up</a></p></span>
				
				<span style="display : <% if(session.getAttribute("username") != null){
					out.print("block");
				}else{
					out.print("none");
				}
				%>"><p><a href="logout.jsp">Logout</a></p></span>
        </div>
        <div class="xiangying_nav"></div>
        
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
    <div class="num_box">
        <div class="num" id="num_0">
            <div class="mask">
                <div id="slideBox" class="slideBox">
                    <div class="hd">
                        <ul><li></li><li></li><li></li></ul>
                    </div>
                    <div class="bd">
                        <ul>
                     
                            <li class="banner1">
                                <div class="fangan" id="a3">
                                    <hgroup>
                                        <h3><span>Online Board Game Center</span></h3>
                                        <h2><span>Start Your Game From Here</span></h2>
                                        <h6></h6>
                                        <h4><span>Solo Game -- Online Game</span></h4>
                                        <h5><a href="http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num4">View Games</a></h5>
                                    </hgroup>
                                </div>
                            </li>
                            <li>
                                <div>
                                    <div class="fengxian" id="a1">
                                        <div>
                                            <img src="./images/fengxian.png" alt="" />
                                            <hgroup>
                                                <h3>play games with online components</h3>
                                                <h2>Make Friends in Games</h2>
                                                <h5><a href="http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num5">View Friends</a></h5>
                                            </hgroup>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="banner3">
                                <div class="six" id="a2">
                                    <div>
                                        <img src="./images/six2.png" alt="" class="sixb" />
                                        <img src="./images/six1.png" alt="" class="sixa" />
                                        <hgroup>
                                            <h3>Win Your Place on The Leaderboard<br /></h3>
                                            <h2>Go Get It!</h2>
                                            <h5><a href="http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num2">Leaderboard</a></h5>
                                        </hgroup>
                                    </div>
                                </div>
                                <div class="another">

                                </div>
                            </li>

                        </ul>
                    </div>
                </div>
                <script src="js/jquery.SuperSlide.2.1.1.js"></script>
                <script type="text/javascript">
                    // 轮播
                    $(".slideBox").slide({
                        mainCell: ".bd ul", effect: "leftLoop", autoPlay: true,
                        startFun: function (i, c) {
                            del();
                            // switch(i){
                            //       case 0:
                            //           break;
                            //       case 1:
                            //           $("#a1").addClass('animation1');
                            //           break;
                            //       case 2:
                            //           $("#a2").addClass('animation2');
                            //           break;
                            //       case 3:
                            //           $(".banner1 #a3").addClass('animation3');
                            //           break;
                            //       default:break;
                            //     }
                            switch (i) {
                                case 0:
                                    $(".banner1 #a3").addClass('animation3');
                                    break;
                                case 1:
                                    $("#a1").addClass('animation1');
                                    break;
                                case 2:
                                    $(".banner3 #a2").addClass('animation2');
                                    $(".banner3 .another").addClass('animation2_1');
                                    break;
                                default: break;
                            }
                        }
                    });
                </script>
                <script src="./js/jquery.easing.min.js" type="text/javascript"></script>
                <script src="js/banner-1.js"></script>
            </div>
        </div>
        <div class="num" id="num_1">
            <div class="server">
                <ul class="server_ul">
                    <li>
                        <div class="server_cont">
                            
                        </div>
                        <div class="server_mask">
                            <div class="server_mask_div"></div>
                        </div>
                        <img src="./images/serv1.png" alt="" />
                    </li>
                    <li>
                        <div class="server_cont">
                            
                        </div>
                        <div class="server_mask">
                            <div class="server_mask_div"></div>
                        </div>
                        <img src="./images/serv2.png" alt="" />
                    </li>
                    <li>
                        <div class="server_cont">
                            
                        </div>
                        <div class="server_mask">
                            <div class="server_mask_div"></div>
                        </div>
                        <img src="./images/serv3.png" alt="" />
                    </li>
                    <li>
                        <div class="server_cont">
                            
                        </div>
                        <div class="server_mask">
                            <div class="server_mask_div"></div>
                        </div>
                        <img src="./images/serv4.png" alt="" />
                    </li>
                    <li>
                        <div class="server_cont">
                            
                        </div>
                        <div class="server_mask">
                            <div class="server_mask_div"></div>
                        </div>
                        <img src="./images/serv5.png" alt="" />
                    </li>
                </ul>
            </div>
        </div>
        <script>
            $('.server ul li').hover(function () {
                $(this).find('.server_mask').stop().animate({ height: '100%' }, 'slow')
            }, function () {
                $(this).find('.server_mask').stop().animate({ height: '0%' })
            })
        </script>
        <div class="num" id="num_2">
            
                    <%
	        	//get the leaderboard data
	        	String show_time = "week";
	        	String show_type = "most_win";
	        	if(request.getParameter("stime") != null){
	        		show_time = request.getParameter("stime");
	        	}
	        	if(request.getParameter("stype") != null){
	        		show_type = request.getParameter("stype");
	        	}
	        	
	        	ArrayList<ArrayList<String>> leaderboard_set = coop.get_leaderboard(show_time, show_type);
	        	System.out.print("leaderboard_set" + leaderboard_set.size());
	        	int id_index = 1;
	        	int stats_index = 0;
	        	if(show_type.equals("most_rate")) {
					id_index = 1;
	        		stats_index = 3;
				}
	        %>
	            <div class="outter1">
	            	<div class="center_60" id="leaderboard_div">
	            		<div class="inner_div">
		            	<table>
			            	<tr>
				            	<td><button class="btn" onclick="window.location.href='http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num2&stype=most_win'">Most Wins</button></td>
				            	<td><button class="btn" onclick="window.location.href='http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num2&stype=most_play'">Most Plays</button></td>
				            	<td><button class="btn" onclick="window.location.href='http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num2&stype=most_rate'">Win Rate</button></td>
				            </tr>
			            	<tr>
			            	</tr>
		            	</table>
		            	<div class="vertical_100" id="leaderboard_title">
		            	<% String title_time = show_time.toUpperCase();
		            	String title_type = "";
		            	DecimalFormat df = new DecimalFormat("0.00%");
		            	if(show_type.equals("most_win")){
		            		title_type = "MOST WINS";
		            	}else if(show_type.equals("most_play")){
		            		title_type = "MOST PLAYS";
		            	}else if(show_type.equals("most_rate")){
		            		title_type = "MOST WIN-PLAYED RATE";
		    
		            	}
		            	%>
		            	<h2><% out.print(title_time); %>LY LEADERBOARD of <% out.print(title_type); %> </h2>
		            	</div>
		            	<table>
		            	<tr>
		            	<td>Filter By:
		            		<select id="stime_select">
		            			<option value="day">Day</option>
		            			<option value="week">Week</option>
		            			<option value="month">Month</option>
		            		</select>
		            		<button class="btn" onclick="window.location.href='http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num2&stype=<% out.print(show_type);%>&stime='+document.getElementById('stime_select').value">Apply</button>
		            	</td>
		            	<td></td>
		            	</tr>
		            	</table>
		            	
		            	<table>
		        		<tr>
		        		<th>Rank</th>
		        		<th>Player name</th>
		        		<th>Stats</th>
		        		</tr>
		        		<%
		        		i=0;
		            	int j=1;
		            	String temp_user_name;

		            	while(i<leaderboard_set.size()){
		            		if(!leaderboard_set.get(i).get(id_index).equals("none")){
		    	        		temp_user_name = coop.get_by_from("username", "id", "user", leaderboard_set.get(i).get(id_index)).get(0).get(0);
		            			if(show_type.equals("most_rate")){
		    	        			out.print("<tr><td>" + j + "</td><td>" + temp_user_name + "</td><td>" + df.format(Float.parseFloat(leaderboard_set.get(i).get(stats_index).trim())) + "</td></tr>");
		            			}else{
		    	        			out.print("<tr><td>" + j + "</td><td>" + temp_user_name + "</td><td>" + leaderboard_set.get(i).get(stats_index) + "</td></tr>");
		            			}
		    	        		j++;
		            		}
		            		i++;
		            	}
		        		%>
		        		
		        		</table>
		        		</div>
	            	</div>
	            </div>
                <script language="javascript">
                    jQuery(".mr_frbox1").slide({ titCell: "", mainCell: ".mr_frUl1 ul", autoPage: true, effect: "leftLoop", autoPlay: true, vis: 1 });
                </script>
  
        </div>
       
        <div class="num" id="num_3">
            <div class="team width_1000">
                <div class="title team-title">
                    
                </div>
            </div>
            <div class="teachshow">
                <div id="teach" class="mr_frbox">
                    <img class="mr_frBtnL prev" src="./images/prev.png" />
                    <div class="mr_frUl">
                    <%
                    	if(current_user != null){
                    		out.print("<button class='btn' onclick=\"window.location.href=\'http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num4\'\">All Game List</button>  |  <button class='btn' onclick=\"window.location.href=\'http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num4&is_f=Y\'\">Favorite Game List</button>");
                    	}
                    %>
                        <ul>
                        	<% 
                        	String is_favorite = request.getParameter("is_f");
                        	ArrayList<ArrayList<String>> game_set = new ArrayList<ArrayList<String>>();
                        	if(is_favorite != null){
                        		if(is_favorite.equals("Y")){
                            		ArrayList<ArrayList<String>> favorite_set = coop.get_by_from("*", "player_id", "favorite", current_user.get_id());
                            		for(i=0;i<favorite_set.size();i++){
                                		game_set.add(coop.get_by_from("*", "id", "game", favorite_set.get(i).get(1)).get(0));                     			
                            		}
                            	}else{
                                	game_set = coop.get_by_from("*", "1", "game", "1");
                            	}
                        	}else{
                            	game_set = coop.get_by_from("*", "1", "game", "1");
                        	}
                        	
                        	for(i=0; i<game_set.size();i++){
                        		if(game_set.get(i).get(7).equals("public")){
                            		out.print("<li><a href='game_detail.jsp?g=" + game_set.get(i).get(0) + "'><img src='" + game_set.get(i).get(6) +"' /><img src='" + game_set.get(i).get(6) +"' /></a><div><h4>" + game_set.get(i).get(1) + "</h4></div></li>");
                        		}else if(game_set.get(i).get(7).equals("blocked")){
                        			
                        		}else if(current_user != null){
                        			if(game_set.get(i).get(7).equals("premium") && current_user.get_is_premium().equals("1")){
                                		out.print("<li><a href='game_detail.jsp?g=" + game_set.get(i).get(0) + "'><img src='" + game_set.get(i).get(6) +"' /><img src='" + game_set.get(i).get(6) +"' /></a><div><h4>" + game_set.get(i).get(1) + "</h4></div></li>");

                        			}
                        		}
                        	}
                        	
                        	%>
                       
                        </ul>
                    </div>
                    <img class="mr_frBtnR next" src="./images/next.png" />
                </div>
            </div>
        </div>
        <script language="javascript">
            jQuery(".mr_frbox").slide({ titCell: "", mainCell: ".mr_frUl ul", autoPage: true, effect: "leftLoop", autoPlay: true, vis: 4 });
        </script>
        <div class="num" id="num_4">
		<div class="vertical_100">
	        <div class="center_80">
	        	<div class="inner_div">
	        	
	        	<% ArrayList<ArrayList<String>> all_games = coop.get_by_from("*", "1", "game", "1"); %>
	        	
	        			<div class="form-row">
	        				<form id="create_room" action="http://localhost:8080/BoardGamePlatform/back_controller/Create_room.do" method="post">
		        				<div class="form-group col-md-5">	
		        					<div class="form-group col-md-6">
		        						<input type="hidden" name = "hidden_user_id" id="hidden_user_id" value="<% out.print(session.getAttribute("user_id"));%>"></input>
		        					
		        						<p>Choose Game : </p>
			        					<select class="form-control" name="new_room_game">
						        			<% for(i=0;i<all_games.size();i++){
						        					out.print("<option value='"+ all_games.get(i).get(0) +"'>"+ all_games.get(i).get(1) +"</option>");
						        				} 
						        			%>
			        					</select>
		        					</div>  
		        					<div class="form-group col-md-4">
		        					<p>&nbsp</p>
		        						<button type="submit" class="btn">Create a New Room</button>
		        					</div>      							
		       					</div>
	       					</form>
	       					<form id="search_room_form" action="http://localhost:8080/BoardGamePlatform/back_controller/Search_item.do" method="post">
		        				<div class="form-group col-md-5">
			        				<div class="form-group col-md-6">
			        					<input type="hidden" name="search_item" value="room" />
		        					<p>Search Room : </p>
		        					<input type="text" name="search_content" id="search_room" class="form-control" />
			        				</div>
			        				<div class="form-group col-md-4">
			        					<p>&nbsp</p>
			        					<button type="submit" class="btn">Search</button>
			        				</div>
		        					
		        					
		        				</div>	
	        				</form>        				
	        				<div class="form-group col-md-2">
	        					<p>Match a random Room : </p>
	        					<button class="btn" onclick="<% if(current_user == null){out.print("alert('Please login or sign up first!');window.location.href='http://localhost:8080/BoardGamePlatform/view/login.jsp'");}else{out.print("match_room()");} %>" >Quick Start</button>
	        					
	        				</div>
	        			</div>
	        			<br />
	        	</div>
	        </div>
	        </div>
            <div class="news">
            <div class="news-list">
            <%
            //get room info from database
            Common_operation coop1 = new Common_operation();
            ArrayList<ArrayList<String>> room_set = coop1.get_by_from("*", "is_public", "room", "1" );

            ArrayList<ArrayList<ArrayList<String>>> total_room_player_set = new ArrayList<ArrayList<ArrayList<String>>>();
            for(i=0;i<room_set.size();i++){
            	total_room_player_set.add(coop1.get_by_from("*", "room_id", "room_players", room_set.get(i).get(0) ));
            }
            for(i=0; i<room_set.size();i++){
            ArrayList<ArrayList<String>> thisgame = coop1.get_by_from("name,pic", "id", "game", room_set.get(i).get(1));
            int num_of_players = total_room_player_set.get(i).size();
            out.print("<a href='room_details.jsp?r=" + room_set.get(i).get(0) + "'><img src='" + thisgame.get(0).get(1) +"' alt='' /><div><span><h5>ROOM "+ room_set.get(i).get(0) +"</h5></span><h3>" +thisgame.get(0).get(0) + "</h3></div></a>");
            }
            
            coop1.close();

            %>
                </div>
                
            </div>
        </div>
        <div class="num" id="num_5">
        <div class="vertical_100">
        <div class="center_60_no">
        	<div class="inner_div">
        	<h3>Friend List &nbsp&nbsp&nbsp&nbsp&nbsp |&nbsp&nbsp&nbsp&nbsp&nbsp <button onclick="window.location.href='http://localhost:8080/BoardGamePlatform/back_controller/ShowServlet?from=players'" class="btn">View All Online Players</button></h3>
        	
        	</div>
        </div>
        <div class="center_60_no">
            <div class="cust" style="float:left">
                
                <div class="pic-cont">
                    
                    <div class="v_out v_out_p">
                        
                        <div class="v_show">
                            <div class="v_cont">
                                <ul>
                                    <li>
                                        <div>
                                        	<% 
                                        	//get friend set
                                        	ArrayList<String> friend_id_set = new ArrayList<String>();
                                        	ArrayList<ArrayList<String>> friendship_set1 = coop.get_by_from("*", "player1_id", "friendship", String.valueOf(session.getAttribute("user_id")) );
                                        	for(i=0;i<friendship_set1.size();i++){
                                        		friend_id_set.add(friendship_set1.get(i).get(1));
                                        	}
                                        	System.out.print(friendship_set1);
                                        	ArrayList<ArrayList<String>> friendship_set2 = coop.get_by_from("*", "player2_id", "friendship", String.valueOf(session.getAttribute("user_id")) );
                                        	for(i=0;i<friendship_set2.size();i++){
                                        		friend_id_set.add(friendship_set2.get(i).get(0));
                                        	}
                                        	System.out.print(friendship_set2);
                                        	System.out.print(friend_id_set);
                                        	ArrayList<ArrayList<String>> friend_set = new ArrayList<ArrayList<String>>();
                                        	for(i=0;i<friend_id_set.size();i++){
                                        		friend_set.add(coop.get_by_from("*", "id", "user", friend_id_set.get(i) ).get(0) );
                                        	}
                                        	
                                        	if(current_user == null){
                                        		out.print("<h3>Please Login or sign up to view your board game friends!</h3>");
                                        	}else if(friend_set == null){
                                        		out.print("<h3>You don't have any friends yet. Go and add some friend!</h3>");
                                        	}else{
                                        		for(i=0;i<friend_set.size();i++){
                                            		out.print("<a href='player_detail.jsp?u=" + friend_set.get(i).get(0) + "'><span><div class='vertical_100'><img src='"+ friend_set.get(i).get(8) +"' alt='' /></div><div class='vertical_100'><h3>" + friend_set.get(i).get(1) + "</h3></div></span></a>");
                                            	}
                                        	}
                                        	
                                        	//  href="http://localhost:8080/BoardGamePlatform/back_controller/ShowServlet"	
                                        	//out.print("<tr><td>" + friend_set.get(i).get(0) + "</td><td>" + friend_set.get(i).get(1) + "</td><td>" + friend_set.get(i).get(4) + "</td><td>" + friend_set.get(i).get(5) + "</td><td>" + friend_set.get(i).get(8) + "</td></tr>");
                                        	%>
                                           </div> 
                                      
                                    </li>
                                    
                                </ul>
                            </div>
                            
                            
                            
                            
                        </div>
                       
                    </div>
                </div>
            </div>
            </div>   
            </div>
        </div>

        
        <!-- 联系侧拉 -->
        <div class="xuanfu rel" <% if(current_user == null){
        	out.print("style='display:none'");
        	}else if(current_user.get_is_manager().equals("N")){
        		out.print("style='display:none'");
        	} %>>
            <div class="xf_top">
                <div class="xf_top_k rel" onclick="javascript:window.location.href='http://localhost:8080/BoardGamePlatform/view/manage_game.jsp'">
                    <img src="./images/xftb1.png" height="26" width="29" class="xftb db auto abs trans_fast" />
                    <div class="xf_top_k_nr abs">
                        <div class="xf_top_k1">
                            <div class="xf_topknrr abs xf_nr1">
                                <a href="http://localhost:8080/BoardGamePlatform/view/manage_game.jsp" target="_blank">Manage Games</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="xf_top_k rel" onclick="javascript:window.location.href='http://localhost:8080/BoardGamePlatform/view/manage_room.jsp'">
                    <img src="./images/xftb1.png" height="26" width="29" class="xftb db auto abs trans_fast" />
                    <div class="xf_top_k_nr abs">
                        <div class="xf_top_k1">
                            <div class="xf_topknrr abs xf_nr1">
                                <a href="http://localhost:8080/BoardGamePlatform/view/manage_room.jsp" target="_blank">Manage Rooms</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="xf_top_k rel" onclick="javascript:window.location.href='http://localhost:8080/BoardGamePlatform/view/manage_player.jsp'">
                    <img src="./images/xftb1.png" height="26" width="29" class="xftb db auto abs trans_fast" />
                    <div class="xf_top_k_nr abs">
                        <div class="xf_top_k1">
                            <div class="xf_topknrr abs xf_nr1">
                                <a href="http://localhost:8080/BoardGamePlatform/view/manage_player.jsp" target="_blank">Manage Players</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="xf_top_k rel" onclick="javascript:window.location.href='http://localhost:8080/BoardGamePlatform/view/manage_report.jsp'">
                    <img src="./images/xftb1.png" height="26" width="29" class="xftb db auto abs trans_fast" />
                    <div class="xf_top_k_nr abs">
                        <div class="xf_top_k1">
                            <div class="xf_topknrr abs xf_nr1">
                                <a href="http://localhost:8080/BoardGamePlatform/view/manage_report.jsp" target="_blank">Report Box</a>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                
                
                <div class="xf_top_k rel">
                    <img src="./images/xftb4.png" height="26" width="29" class="xftb db auto abs trans_fast" />
                    <div class="xf_top_k_nr abs">
                        <div class="xf_top_k1">
                            <div class="xf_topknrr abs xf_nr1">
                                <span class="fhtop">Back to Top</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="xf_bot abs">
                <div>
                    <div class="abs trans_fast"></div>
                </div>
            </div>
        </div>






    </div>
    <input type="hidden" value="0" class="ddw" />
    <input type="hidden" value="0" class="ddw2" />
    <script type="text/javascript" src="js/scroll.js"></script>
    <script type="text/javascript" src="js/jquery.mousewheel.js"></script>
    

</body>
</html>
<% coop.close();%>