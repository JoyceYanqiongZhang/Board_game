<%@ include file="head.jsp"%>
<%@ include file="head2.jsp"%>
<% 
	Common_operation coop = new Common_operation();	
	ArrayList<ArrayList<String>> room_set = coop.get_by_from("*", "1", "room", "1");
	int i=0;
%>

<div class="outter1">
	<div class="center_80">
	<div class="inner_div">
		<div class="table_div">
			<table class="table table-dark">
				<tr>
					<th>Room ID</th>
					<th>Game</th>
					<th>Size</th>
					<th>Number of Players</th>
					<th>Host ID</th>
					<th>Host</th>
					<th>Condition</th>
					<th>Availability Condition</th>
					<th>View details</th>
					<th>Operation</th>
				</tr>
				
				
				<%
					if(room_set != null){
						for(i=0; i<room_set.size();i++){
							String game_name = coop.get_by_from("name", "id", "game", room_set.get(i).get(1)).get(0).get(0);
							String num_of_players = coop.get_by_from("COUNT(*)", "room_id", "room_players", room_set.get(i).get(0)).get(0).get(0);
							String host_name = coop.get_by_from("username", "id", "user", room_set.get(i).get(4)).get(0).get(0);
							String condition = "";
							if(room_set.get(i).get(8).equals("1")){
								condition = "playing";
							}else{
								condition = "waiting";
							}
							String availability = "";
							String change_to = "";
							String button_text ="";
							if(room_set.get(i).get(3).equals("1")){
								availability = "blocked";
								change_to = "0";
								button_text = "Cancle_block";
							}else{
								availability = "public";
								change_to = "1";
								button_text = "Block";
							}
				
							out.print("<tr><td>"+ room_set.get(i).get(0) +"</td><td>" + game_name + "</td><td>" + room_set.get(i).get(2) + "</td><td>" + num_of_players + "</td><td>" + room_set.get(i).get(4) + "</td><td>" + host_name + "</td><td>" + condition + "</td><td>" + availability + "</td><td><button class='btn' onclick=\"window.location.href=\'http://localhost:8080/BoardGamePlatform/view/room_details.jsp?r=" + room_set.get(i).get(0) + "\'\">View</button></td><td><button class='btn' onclick=\"change_room_block(\'" + room_set.get(i).get(0) + "\',\'" + change_to + "\' )\">" + button_text + "</button></td></tr>");
						}
					}
					
				%>
			</table>
		</div>
		</div>
	</div>	
</div>
<% coop.close(); %>
<%@ include file="manager_bar.jsp"%>
<%@ include file="footer.jsp"%>
