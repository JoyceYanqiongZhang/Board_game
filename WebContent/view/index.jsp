<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="basic_class.*" %>
<%@ page import="model.*" %>

<%String click_button = request.getParameter("c");
	Common_operation coop = new Common_operation();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Board Game Platform</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.8.2.min.js"></script>
    <script src="js/switch.js"></script>
    <script src="js/js.js"></script>
    <script src="general_script.js"></script>
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

<input type="hidden" id="hidden_user_id" name= "hidden_user_id" value="<% out.println(session.getAttribute("id")); %>">

    <div class="head">
        <a href="index.jsp" class="logo">
            <img src="./images/logob.png" alt="Here is Joyce's board game site" />
        </a>
        <ul>
            <li><a href="index.jsp" class="active">Home<br /><span>Home</span></a></li>
        	<li class="nav_num4" id="nav_num4"><a>Game<br /><span>Game</span></a></li>
        	<li class="nav_num3" id="nav_num3"><a>Room<br /><span>Room</span></a></li>
        	<li class="nav_num5" id="nav_num5"><a  href="http://localhost:8080/BoardGamePlatform/back_controller/ShowServlet">Players<br /><span>Players</span></a></li>
            <li class="nav_num2" id="nav_num2"><a>Leaderboard<br /><span>Leaderboard</span></a></li>
            <li class="nav_num6" id="nav_num6"><a>My Account<br /><span>My Account</span></a></li>
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
				%>"><p><a href="login.jsp">Login</a> | <a href="register.jsp">Sign up</a></p></span>
				
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
            <img src="./images/logob.png" alt="Here is Joyce's board game site" />
        </a>
        <ul>
            <li><a href="index.jsp" class="active">Home<br /><span>Home</span></a></li>
        	<li class="nav_num4"><a>Game<br /><span>Game</span></a></li>
        	<li class="nav_num3"><a>Room<br /><span>Room</span></a></li>
        	<li class="nav_num5"><a href="http://localhost:8080/BoardGamePlatform/back_controller/ShowServlet">Players<br /><span>Players</span></a></li>
            <li class="nav_num2"><a>Leaderboard<br /><span>Leaderboard</span></a></li>
            <li class="nav_num6"><a>My Account<br /><span>My Account</span></a></li>
        </ul>
        <div class="hotline">
            <img src="./images/telw.png" alt="" />
            <span>010-57732658</span>
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
                                        <h5><a href="list-case.html">View Games</a></h5>
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
                                                <h5><a href="list-case.html">View Players</a></h5>
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
                                            <h5><a href="list-case.html">Leaderboard</a></h5>
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
            <div class="case">
                <div class="case-top width_1000">
                    <div class="case-top-left">
                        <p class="case-top-left-top">Our Works</p>
                        <p class="case-top-left-bottom">有追求，有坚持</p>
                    </div>
                    <div class="case-top-right">
                        <span></span><sup>+</sup>
                    </div>
                </div>
                <div class="case_ul_wrap">
                    <ul class="case_ul">
                        <li>
                            <a href="">
                                <div class="show">
                                    <img src="./images/icons.png" alt="" />
                                </div>
                                <img src="./images/case01.jpg" alt="" />
                                <div class="auto">
                                    <h4>鄂尔多斯双丰羊毛</h4>
                                    <span>上市公司、官方网站、欧美风格</span>
                                    <div class="auto_mask"></div>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <ul class="case_ul">
                        <li>
                            <a href="">
                                <div class="show">
                                    <img src="./images/icons.png" alt="" />
                                </div>
                                <img src="./images/case02.jpg" alt="" />
                                <div class="auto">
                                    <h4>鄂尔多斯双丰羊毛</h4>
                                    <span>上市公司、官方网站、欧美风格</span>
                                    <div class="auto_mask"></div>
                                </div>
                            </a>
                        </li>
                    </ul>
                    <ul class="case_ul">
                        <li>
                            <a href="">
                                <div class="show">
                                    <img src="./images/icons.png" alt="" />
                                </div>
                                <img src="./images/case03.jpg" alt="" />
                                <div class="auto">
                                    <h4>鄂尔多斯双丰羊毛</h4>
                                    <span>上市公司、官方网站、欧美风格</span>
                                    <div class="auto_mask"></div>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>

                <div class="teachshow xiangying_anli">
                    <div id="teach" class="mr_frbox1">
                        <img class="mr_frBtnL prev" src="./images/prev.png" />
                        <div class="mr_frUl1">
                            <ul>
                                <li>
                                    <a href="">
                                        <div class="show">
                                            <img src="./images/icons.png" alt="" />
                                        </div>
                                        <img src="./images/case03.jpg" alt="" />
                                        <div class="auto">
                                            <h4>鄂尔多斯双丰羊毛</h4>
                                            <span>上市公司、官方网站、欧美风格</span>
                                            <div class="auto_mask"></div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <div class="show">
                                            <img src="./images/icons.png" alt="" />
                                        </div>
                                        <img src="./images/case01.jpg" alt="" />
                                        <div class="auto">
                                            <h4>鄂尔多斯双丰羊毛</h4>
                                            <span>上市公司、官方网站、欧美风格</span>
                                            <div class="auto_mask"></div>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <div class="show">
                                            <img src="./images/icons.png" alt="" />
                                        </div>
                                        <img src="./images/case02.jpg" alt="" />
                                        <div class="auto">
                                            <h4>鄂尔多斯双丰羊毛</h4>
                                            <span>上市公司、官方网站、欧美风格</span>
                                            <div class="auto_mask"></div>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <img class="mr_frBtnR next" src="./images/next.png" />
                    </div>
                </div>
                <script language="javascript">
                    jQuery(".mr_frbox1").slide({ titCell: "", mainCell: ".mr_frUl1 ul", autoPage: true, effect: "leftLoop", autoPlay: true, vis: 1 });
                </script>





                <div class="case-bottm"><a href="list-case.html" style="display:block;width:100%;height:100%;"></a></div>
            </div>
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
                        <ul>
                        	<% 
                        	ArrayList<ArrayList<String>> game_set = coop.get_by_from("*", "1", "game", "1");
                        	for(int i=0; i<game_set.size();i++){
                        		out.println("<li><a href='game_detail.jsp?g=" + game_set.get(i).get(0) + "'><img src='" + game_set.get(i).get(6) +"' /><img src='" + game_set.get(i).get(6) +"' /></a><div><h4>" + game_set.get(i).get(1) + "</h4></div></li>");
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
	        	<form id="create_room" action="http://localhost:8080/BoardGamePlatform/back_controller/Create_room.do" method="post">
	        	<% ArrayList<ArrayList<String>> all_games = coop.get_by_from("*", "1", "game", "1"); %>
	        			<input type="hidden" name = "hidden_user_id" id="hidden_user_id" value="<% out.println(session.getAttribute("user_id"));%>"></input>
	        			<select name="new_room_game">
	        			<% for(int i=0;i<all_games.size();i++){
	        					out.println("<option value='"+ all_games.get(i).get(0) +"'>"+ all_games.get(i).get(1) +"</option>");
	        				} 
	        			%>
	        			</select>
	        		   <button type="submit">Create a New Room</button>
	        	
	        	</form>
	        </div>
            <div class="news">
            <div class="news-list">
            <%
            //get room info from database
            Common_operation coop1 = new Common_operation();
            ArrayList<ArrayList<String>> room_set = coop1.get_by_from("*", "is_public", "room", "1" );

            ArrayList<ArrayList<ArrayList<String>>> total_room_player_set = new ArrayList<ArrayList<ArrayList<String>>>();
            for(int i=0;i<room_set.size();i++){
            	total_room_player_set.add(coop1.get_by_from("*", "room_id", "room_players", room_set.get(i).get(0) ));
            }
            for(int i=0; i<room_set.size();i++){
            ArrayList<ArrayList<String>> thisgame = coop1.get_by_from("name,pic", "id", "game", room_set.get(i).get(1));
            int num_of_players = total_room_player_set.get(i).size();
            out.println("<a href='room_details.jsp?r=" + room_set.get(i).get(0) + "'><img src='" + thisgame.get(0).get(1) +"' alt='' /><div><span><sub>Enter</sub></span><p>" +thisgame.get(0).get(0) + "</p></div></a>");
            }
            
            coop1.close();

            %>
 
                </div>
                <div class="case-bottm"><a href="list-news.html" style="display:block;width:100%;height:100%;"></a></div>
            </div>
        </div>
        <div class="num" id="num_5">
            <div class="cust">
                <div class="title cust-title width_1000">
                    <img src="./images/cust.png" alt="" />
                </div>
                <div class="pic-cont">
                    <!-- <div id="teach" class="mr_frbox ml_frbox">
                      <img class="mr_frBtnL prev" src="./images/prev.png">
                      <div class="mr_frUl">
                        <ul>
                          <li>
                            <img src="./images/cust1.jpg" alt="" />
                            <img src="./images/cust2.jpg" alt="" />
                            <img src="./images/cust3.jpg" alt="" />
                          </li>
                          <li>
                            <img src="./images/cust4.jpg" alt="" />
                            <img src="./images/cust5.jpg" alt="" />
                            <img src="./images/cust6.jpg" alt="" />
                          </li>
                          <li>
                            <img src="./images/cust7.jpg" alt="" />
                            <img src="./images/cust8.jpg" alt="" />
                            <img src="./images/cust9.jpg" alt="" />
                          </li>
                          <li>
                            <img src="./images/cust10.jpg" alt="" />
                            <img src="./images/cust11.jpg" alt="" />
                            <img src="./images/cust12.jpg" alt="" />
                          </li>
                          <li>
                            <img src="./images/cust13.jpg" alt="" />
                            <img src="./images/cust14.jpg" alt="" />
                            <img src="./images/cust15.jpg" alt="" />
                          </li>
                        </ul>
                        </div>
                        <img class="mr_frBtnR next" src="./images/next.png">
                    </div> -->
                    <div class="v_out v_out_p">
                        <div class="prev"><a href="javascript:void(0)"></a></div>
                        <div class="v_show">
                            <div class="v_cont">
                                <ul>
                                    <li>
                                        <div>
                                            <span>
                                                <img src="./images/logo.jpg" alt="" />
                                            </span>
                                            <span>
                                                <img src="./images/logo2.jpg" alt="" />
                                            </span>
                                            <span>
                                                <img src="./images/logo3.jpg" alt="" />
                                            </span>
                                            <span>
                                                <img src="./images/logo4.jpg" alt="" />
                                            </span>
                                            <span>
                                                <img src="./images/logo5.jpg" alt="" />
                                            </span>
                                        </div>
                                        <div>
                                            <span>
                                                <img src="./images/logo6.jpg" alt="" />
                                            </span>
                                            <span>
                                                <img src="./images/logo7.jpg" alt="" />
                                            </span>
                                            <span>
                                                <img src="./images/logo8.jpg" alt="" />
                                            </span>
                                            <span>
                                                <img src="./images/logo9.jpg" alt="" />
                                            </span>
                                            <span>
                                                <img src="./images/logo10.jpg" alt="" />
                                            </span>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <span>
                                                <img src="./images/logo11.jpg" alt="" />
                                            </span>
                                            <span>
                                                <img src="./images/logo12.jpg" alt="" />
                                            </span>
                                            <span>
                                                <img src="./images/logo13.jpg" alt="" />
                                            </span>
                                            <span>
                                                <img src="./images/logo14.jpg" alt="" />
                                            </span>
                                            <span>
                                                <img src="./images/logo15.jpg" alt="" />
                                            </span>
                                        </div>
                                        <div>
                                            <span>
                                                <img src="./images/logo16.jpg" alt="" />
                                            </span>
                                            <span>
                                                <img src="./images/logo17.jpg" alt="" />
                                            </span>
                                            <span>
                                                <img src="./images/logo18.jpg" alt="" />
                                            </span>
                                            <span>
                                                <img src="./images/logo19.jpg" alt="" />
                                            </span>
                                            <span>
                                                <img src="./images/logo20.jpg" alt="" />
                                            </span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <script type="text/javascript" src="js/gundong.js"></script>
                            <script language="javascript">
                                jQuery(".ml_frbox").slide({ titCell: "", mainCell: ".mr_frUl ul", autoPage: true, effect: "leftLoop", autoPlay: true, vis: 5 });
                                // $('.pic-cont ul li span').hover(function(){
                                //   $(this).children().first().hide().siblings().show();
                                // },function(){
                                //   $(this).children().first().show().siblings().hide();
                                // })
                            </script>
                            <div class="v_cont1">
                                <ul>
                                    <li>
                                        <div>
                                            <span>
                                                <img src="./images/logo.jpg" alt="" />
                                            </span>
                                        </div>
                                        <div>
                                            <span>
                                                <img src="./images/logo2.jpg" alt="" />
                                            </span>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <span>
                                                <img src="./images/logo3.jpg" alt="" />
                                            </span>
                                        </div>
                                        <div>
                                            <span>
                                                <img src="./images/logo4.jpg" alt="" />
                                            </span>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <span>
                                                <img src="./images/logo5.jpg" alt="" />
                                            </span>
                                        </div>
                                        <div>
                                            <span>
                                                <img src="./images/logo6.jpg" alt="" />
                                            </span>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <span>
                                                <img src="./images/logo7.jpg" alt="" />
                                            </span>
                                        </div>
                                        <div>
                                            <span>
                                                <img src="./images/logo8.jpg" alt="" />
                                            </span>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <span>
                                                <img src="./images/logo9.jpg" alt="" />
                                            </span>
                                        </div>
                                        <div>
                                            <span>
                                                <img src="./images/logo10.jpg" alt="" />
                                            </span>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <span>
                                                <img src="./images/logo11.jpg" alt="" />
                                            </span>
                                        </div>
                                        <div>
                                            <span>
                                                <img src="./images/logo12.jpg" alt="" />
                                            </span>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <span>
                                                <img src="./images/logo13.jpg" alt="" />
                                            </span>
                                        </div>
                                        <div>
                                            <span>
                                                <img src="./images/logo14.jpg" alt="" />
                                            </span>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <span>
                                                <img src="./images/logo15.jpg" alt="" />
                                            </span>
                                        </div>
                                        <div>
                                            <span>
                                                <img src="./images/logo16.jpg" alt="" />
                                            </span>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <span>
                                                <img src="./images/logo17.jpg" alt="" />
                                            </span>
                                        </div>
                                        <div>
                                            <span>
                                                <img src="./images/logo18.jpg" alt="" />
                                            </span>
                                        </div>
                                    </li>
                                    <li>
                                        <div>
                                            <span>
                                                <img src="./images/logo19.jpg" alt="" />
                                            </span>
                                        </div>
                                        <div>
                                            <span>
                                                <img src="./images/logo20.jpg" alt="" />
                                            </span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                            <script type="text/javascript" src="js/gundong1.js"></script>
                            <script language="javascript">
                                jQuery(".ml_frbox").slide({ titCell: "", mainCell: ".mr_frUl ul", autoPage: true, effect: "leftLoop", autoPlay: true, vis: 5 });
                            </script>
                        </div>
                        <div class="next"><a href="javascript:void(0)"></a> </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="num" id="num_6">
            <div class="cont">
                <div class="cont-cont width_1000">
                    <div class="title cust-title">
                        <img src="./images/cont.png" alt="" />
                    </div>
                    <div class="cont-left">
                        <div class="connect">
                            <img src="./images/connect.png" alt="" />
                            <div>
                                电话<br />
                                010-57732658 / 010-57105318
                            </div>
                        </div>
                        <div class="address">
                            <img src="./images/address.png" alt="" />
                            <div>
                                地址<br />
                                北京市朝阳区长楹天街星座5栋2005
                            </div>
                        </div>
                        <div class="email">
                            <img src="./images/email.png" alt="" />
                            <div>
                                邮箱<br />
                                support@edge-cloud.cn
                            </div>
                        </div>
                        <div class="email">
                            <img src="./images/email.png" alt="" />
                            <div>
                                邮箱<br />
                                support@edge-cloud.cn
                            </div>
                        </div>
                    </div>
                    <img src="./images/map.png" alt="" class="cont-right" />
                </div>
            </div>
        </div>
        <!-- 联系侧拉 -->
        <div class="xuanfu rel">
            <div class="xf_top">
                <div class="xf_top_k rel" onclick="javascript:window.open('http://wpa.qq.com/msgrd?v=3&uin=690801653&site=qq&menu=yes','_blank')">
                    <img src="./images/xftb1.png" height="26" width="29" class="xftb db auto abs trans_fast" />
                    <div class="xf_top_k_nr abs">
                        <div class="xf_top_k1">
                            <div class="xf_topknrr abs xf_nr1">
                                <a href="http://wpa.qq.com/msgrd?v=3&uin=690801653&site=qq&menu=yes" target="_blank">在线咨询</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="xf_top_k rel">
                    <img src="./images/xftb2.png" height="26" width="29" class="xftb db auto abs trans_fast" />
                    <div class="xf_top_k_nr abs">
                        <div class="xf_top_k1">
                            <div class="xf_topknrr abs xf_nr2">
                                0311-80899002<br />0311-80899003
                            </div>
                        </div>
                    </div>
                </div>
                <div class="xf_top_k rel">
                    <img src="./images/xftb3.png" height="26" width="29" class="xftb db auto abs trans_fast" />
                    <div class="xf_top_k_nr abs">
                        <div class="xf_top_k1 xf_nr3">

                            <div class="xf_topknrr abs xf_nr3">
                                <img src="./images/ewm.png" height="96" width="96" class="abs xf_ewm" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="xf_top_k rel">
                    <img src="./images/xftb4.png" height="26" width="29" class="xftb db auto abs trans_fast" />
                    <div class="xf_top_k_nr abs">
                        <div class="xf_top_k1">
                            <div class="xf_topknrr abs xf_nr1">
                                <span class="fhtop">返回顶部</span>
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