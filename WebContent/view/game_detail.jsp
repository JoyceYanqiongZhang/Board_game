<%@ include file="head.jsp"%>

<% String game_id = request.getParameter("g"); 
	Common_operation coop = new Common_operation();
	ArrayList<String> game_detail = coop.get_by_from("*", "id", "game", game_id).get(0);
%>
<div class="outter1">
	<div class="vertical_100">
		<div class="line_40_div">
			<% out.print("<img src='" + game_detail.get(6) + "'>"); %> 
		</div>			
		<div class="line_60_div" id="game_info">
			<table>
				<tr>
					<th>Game Name : </th>
					<td><% out.println(game_detail.get(1)); %></td>
				</tr>
				<tr>
					<th>Minimal Players : </th>
					<td><% out.println(game_detail.get(2)); %></td>
				</tr>
				<tr>
					<th>Max Players : </th>
					<td><% out.println(game_detail.get(3)); %></td>
				</tr>
				<tr>
					<th>Rules : </th>
					<td><% out.println(game_detail.get(4)); %></td>
				</tr>
				<tr>
					<th>Description : </th>
					<td><% out.println(game_detail.get(5)); %></td>
				</tr>
								
			</table>
		</div>	
	</div>
	<div class="vertical_100" >
		<div class="line_50_div">
			<button onclick="window.location.href='play_robot.jsp'">Play With Robot</button>
		</div>
		<div class="line_50_div">
			<button>Play With Online Players</button>
		</div>
		<div class="line_50_div">
			<button>Add to Favorite</button>
		</div>
	
	</div>

</div>
<%coop.close(); %>
<%@ include file="footer.jsp"%>