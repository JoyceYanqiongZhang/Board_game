<%@ include file="head.jsp"%>
<%@ include file="head2.jsp"%>
<%
	String room_id = request.getParameter("r");
	Common_operation coop = new Common_operation();
	//Insert_operation inop = new Insert_operation();
	ArrayList<String> room_info = coop.get_by_from("*", "id", "room", room_id).get(0);
	ArrayList<ArrayList<String>> room_players = coop.get_by_from("*", "room_id", "room_players", room_id);
	ArrayList<String> room_players_ids = new ArrayList<String>();
	for(int i=0; i<room_players.size(); i++){
		room_players_ids.add(room_players.get(i).get(1));
	}
	String game_name = coop.get_by_from("name", "id", "game", room_info.get(1)).get(0).get(0);
	String is_started = "0";
%>

<input type="hidden" id="room_id" name="room_id" value="<% out.print(room_info.get(0));%>">
<div class="outter1">
	<div class="center_80">
		<div class="inner_div">
		<div class="line_60_div">
			<div class="vertical_100" id="room_info_head">
				<p>Room ID : <% out.print(room_info.get(0)); %></p>
				<p>Room Size : <% out.print(room_info.get(2)); %></p>
				<p>Game : <% out.print(game_name); %><button class="btn" onclick="window.location.href='game_detail.jsp?g=<% out.print(room_info.get(1)); %>'">View</button></p>
			</div>
			<div class="vertical_100">
				
					<div class="vertical_100" id="room_players_container">
				<%
					//for(int i=0; i<room_players_ids.size();i++){
						//ArrayList<ArrayList<String>> user_name_pic = coop.get_by_from("username,pic", "id", "user", room_players_ids.get(i));
						//out.print("<a href='player_detail.jsp?p=" + room_players_ids.get(i) + "'><div class='room_players_place'><img src='" + user_name_pic.get(0).get(1) + "'><p>" + user_name_pic.get(0).get(0) + "</p></div></a>");
					//}
					int vacancy = Integer.parseInt(room_info.get(2).trim());
					System.out.print(vacancy);
					for(int i=0; i< vacancy; i++){
						out.print("<a href=''><div class='room_players_place' id='vacncy" + i + "'><img src='images/add.png' id='vacancy_img" + i + "'><p id='vacancy_p" + i + "'>Invite Friend</p></div></a>");
					}
				%>
					
					</div>
					<div class="vertical_100" id="room_buttons_container">
						<div class="line_50_div">
							<%//System.out.print(current_user.get_id().equals(room_info.get(4)));
							//System.out.print(session.getAttribute("username"));
							if(current_user == null){
								out.print("<button onclick='let_visitor_login()' id='take_a_seat' class='btn' >Take a Seat</button>");
								}else if(!(current_user.get_id().equals(room_info.get(4)))){
									
									
									out.print("<button onclick='non_host_do()' id='take_a_seat' class='btn' >Take a Seat</button>");
								}else if(current_user.get_id().equals(room_info.get(4))){
									out.print("<button onclick='host_do()' class='btn'>Start the Game</button>");
		
								}
							
							%>
						
							
						</div>
						<div class="line_50_div">
							<button class="btn" onclick="leave_room()">Leave the Room</button>
						</div>
					</div>
				</div>
				</div>
				<div class="line_40_div" id="room_log_div" onload="load_room_log();">
  
			    	<div class="vertical_100_80">
			    		<h3>Room Log & Chat Box</h3>
						<p id="room_log_content"><% out.print(room_info.get(6)); %></p>
			    	</div>
			    	<div class="vertical_100_20">
				    	<div class="form-row">
				    		<div class="form-group col-md-7">
			    				<input class="form-control" type="text" id="message_input">	    		
				    		</div>
				    		<div class="form-group col-md-2">
				    			<button class="btn" onclick="<% if(current_user != null){ out.print("update_room_log('"+ current_user.get_username() + " : ' + document.getElementById('message_input').value + '<br>');document.getElementById('message_input').value='';");}else{out.print("alert('Please login or sign up first!');window.location.href='http://localhost:8080/BoardGamePlatform/view/login.jsp'");} %>">Send</button>
				    		</div>
				    	</div>
			    	</div>
				
				
				
			</div>	
			<div class="vertical_100">
			<p><br><br><br><br></p>
			</div>
		</div>
	</div>

<% System.out.print("test");
coop.close();//inop.close(); %>
<%@ include file="manager_bar.jsp"%>
<%@ include file="footer.jsp"%>