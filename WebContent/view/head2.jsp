
</head>
<% String click_button = request.getParameter("c"); %>
<body class="page_body" onload = "load_refresh('<% out.print(click_button);%>')">
<div class="the_page">

<input type="hidden" id="user_id" name= "user_id"value="<% out.print(session.getAttribute("user_id")); %>">
<input type="hidden" id="user_name" name= "user_name"value="<% out.print(session.getAttribute("username")); %>">



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


<input type="hidden" id="hidden_user_id" name= "hidden_user_id" value="<% out.print(session.getAttribute("user_id")); %>">
<div class="vertical_100">
    <div class="head" id="head_page">
        
        <ul>
        	<li>
	        	<a href="index.jsp" class="logo">
	            <img src="http://localhost:8080/BoardGamePlatform/view/images/logob.png" alt="Here is Joyce's board game site" />
	        	</a>
        	</li>
            <li><a href="http://localhost:8080/BoardGamePlatform/view/index.jsp" class="active">Home<br /><span>Home</span></a></li>
        	<li class="nav_num4"><a href="http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num4">Game<br /><span>Game</span></a></li>
        	<li class="nav_num3"><a href="http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num3">Room<br /><span>Room</span></a></li>
        	<li class="nav_num5"><a href="http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num5">Players<br /><span>Players</span></a></li>
            <li class="nav_num2"><a href="http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num2">Leaderboard<br /><span>Leaderboard</span></a></li>
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
				%>"><p><a href="http://localhost:8080/BoardGamePlatform/view/login.jsp">Login</a> | <a href="http://localhost:8080/BoardGamePlatform/view/register.jsp">Sign up</a></p></span>
				
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
            <img src="http://localhost:8080/BoardGamePlatform/view/images/logob.png" alt="Here is Joyce's board game site" />
        </a>
        <ul>
        	<li>
	        	<a href="index.jsp" class="logo">
	            	<img src="http://localhost:8080/BoardGamePlatform/view/images/logob.png" alt="Here is Joyce's board game site" />
	        	</a>
        	</li>
            <li><a href="http://localhost:8080/BoardGamePlatform/view/index.jsp" class="active">Home<br /><span>Home</span></a></li>
        	<li class="nav_num4"><a href="http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num4">Game<br /><span>Game</span></a></li>
        	<li class="nav_num3"><a href="http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num3">Room<br /><span>Room</span></a></li>
        	<li class="nav_num5"><a href="http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num5">Players<br /><span>Players</span></a></li>
            <li class="nav_num2"><a href="http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num2">Leaderboard<br /><span>Leaderboard</span></a></li>
            <li class="nav_num6" <% if(current_user == null){out.print("Style='display:none'");}%>><a href="http://localhost:8080/BoardGamePlatform/view/profile.jsp">My Account<br /><span>My Account</span></a></li>
        </ul>
        
        
    </div>
    
</div>

   
