<%@ include file="head.jsp"%>
<%@ include file="head2.jsp"%>

<% String game_id = request.getParameter("g"); 
	Common_operation coop = new Common_operation();
	ArrayList<String> game_detail = coop.get_by_from("*", "id", "game", game_id).get(0);
	boolean is_favorite = false;
	if(current_user != null){
		ArrayList<ArrayList<String>> favorite_set = coop.get_by_from_function("*", "(player_id,game_id)", "favorite", "('" + current_user.get_id() + "','" + game_id + "')");
		if(favorite_set.size() != 0){
			is_favorite = true;
		}
	}
	
	//get the comments
	ArrayList<ArrayList<String>> comment_set = coop.get_by_from("*", "game_id", "comment", game_id);
%>
<div class="outter1">
	<div class="vertical_100">
		<div class="center_60">
			<div class="inner_div">
				<div class="line_40_div" id="game_img_div">
					<% out.print("<img src='" + game_detail.get(6) + "'>"); %> 
				</div>			
				<div class="line_60_div" id="game_info">
					<table class="normal_table">
						<tr>
							<th>Game Name : </th>
							<td><% out.print(game_detail.get(1)); %></td>
						</tr>
						<tr>
							<th>Minimal Players : </th>
							<td><% out.print(game_detail.get(2)); %></td>
						</tr>
						<tr>
							<th>Max Players : </th>
							<td><% out.print(game_detail.get(3)); %></td>
						</tr>
						<tr>
							<th>Rules : </th>
							<td><% out.print(game_detail.get(4)); %></td>
						</tr>
						<tr>
							<th>Description : </th>
							<td><% out.print(game_detail.get(5)); %></td>
						</tr>
										
					</table>
					<br><br>
				</div>	
			
			<div class="vertical_100" >
				<div class="form-row">
					<div class="form-group col-md-4">
						<button class="btn" onclick="<% if(current_user == null){out.print("alert('Please login or sign up first!');window.location.href='http://localhost:8080/BoardGamePlatform/view/login.jsp'");}else{out.print("window.location.href='play_robot.jsp'");}%>">Play With Robot</button>
					</div>
					<div class="form-group col-md-4">
						<button class="btn" onclick="alert('Join a room to play a game now!');window.location.href='http://localhost:8080/BoardGamePlatform/view/index.jsp?c=nav_num3'">Play With Online Players</button>
					</div>
					<div class="form-group col-md-4">
					<% String button_string = ""; %>
						<button class="btn" onclick="<% if(current_user == null){out.print("alert('Please login or sign up first!');window.location.href='http://localhost:8080/BoardGamePlatform/view/login.jsp'");button_string = "Add to Favorite";}else if(!is_favorite){out.print("add_favorite('" + game_id + "')");button_string="Add to Favorite";}else{out.print("delete_favorite('" + game_id + "')");button_string = "Remove from favorite";}%>"><% out.print(button_string); %></button>
					</div>
				</div>
				<br><br><br><br>
				
			</div>
			<div class="vertical_100" id="post_comment_div">
				<div class="vertical_100">
					<h4>Comments : </h4>
					<hr>
					
				</div>

				<div class="vertical_100">
					<textarea rows="3" cols="" class="form-control"></textarea>
					<br>
				</div>
				<div class="vertical_100">
					<button class="btn" onclick="<% if(current_user == null){out.print("alert('Please login or sign up first!');window.location.href='http://localhost:8080/BoardGamePlatform/view/login.jsp'");button_string = "Add to Favorite";}else{out.print("post_comment()");}%>">Post</button>
				</div>
				
			</div>
			<div class="vertical_100" id="show_comment_div">
			
			
			</div>
			
			</div>			
		</div>
	</div>
</div>
<%coop.close(); %>
<%@ include file="manager_bar.jsp"%>
<%@ include file="footer.jsp"%>