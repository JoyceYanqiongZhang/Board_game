<%@ include file="head.jsp"%>
<%
	String room_id = request.getParameter("r");
	Common_operation coop = new Common_operation();
	Insert_operation inop = new Insert_operation();
	ArrayList<String> room_info = coop.get_by_from("*", "id", "room", room_id).get(0);
	ArrayList<ArrayList<String>> room_players = coop.get_by_from("*", "room_id", "room_players", room_id);
	ArrayList<String> room_players_ids = new ArrayList<String>();
	for(int i=0; i<room_players.size(); i++){
		room_players_ids.add(room_players.get(i).get(1));
	}
	String game_name = coop.get_by_from("name", "id", "game", room_info.get(1)).get(0).get(0);
	Users current_user = (Users)session.getAttribute("current_user");
	String is_started = "0";
%>
<input type="hidden" id="room_id" name="room_id" value="<% out.println(room_info.get(0));%>">
<div class="outter1">
	<div class="vertical_100" id="room_info_head">
		<p>Room ID : <% out.println(room_info.get(0)); %></p>
		<p>Room Size : <% out.println(room_info.get(2)); %></p>
		<p>Game : <% out.println(game_name); %><button onclick="window.location.href='game_detail.jsp?g=<% out.println(room_info.get(1)); %>'">View</button></p>
	</div>
	<div class="vertical_100">
		<div class="line_70_div">
			<div class="vertical_100" id="room_players_container">
		<%
			for(int i=0; i<room_players_ids.size();i++){
				ArrayList<ArrayList<String>> user_name_pic = coop.get_by_from("username,pic", "id", "user", room_players_ids.get(i));
				out.println("<a href='player_detail.jsp?p=" + room_players_ids.get(i) + "'><div class='room_players_place'><img src='" + user_name_pic.get(0).get(1) + "'><p>" + user_name_pic.get(0).get(0) + "</p></div></a>");
			}
			if(room_info.get(5).equals("1")){
				out.println("<a href=''><div class='room_players_place'><img src='images/add.png'><p>Invite Friend</p></div></a>");
			}
		%>
			
			</div>
			<div class="vertical_100" id="room_buttons_container">
				<div class="line_50_div">
					<%//System.out.println(current_user.get_id().equals(room_info.get(4)));
					//System.out.println(session.getAttribute("username"));
					if(current_user == null){
						out.println("<button onclick='let_visitor_login()' >Take a Seat</button>");
						}else if(!(current_user.get_id().equals(room_info.get(4)))){
							
							
							out.println("<button onclick='non_host_do()' >Take a Seat</button>");
						}else if(current_user.get_id().equals(room_info.get(4))){
							out.println("<button onclick='host_do()' >Start the Game</button>");

						}
					
					%>
				
					
				</div>
				<div class="line_50_div">
					<button onclick="">Leave the Room</button>
				</div>
			</div>
		</div>
		<div class="line_30_div" id="room_log_div">
		<h3>Room Log</h3>
		<p><% out.println(room_info.get(6)); %></p>
		</div>
	</div>
	
	
</div>

<%@ include file="footer.jsp"%>