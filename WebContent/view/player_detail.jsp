<%@ include file="head.jsp"%>
<%@ include file="head2.jsp"%>
<% 
	Common_operation coop = new Common_operation();
	String show_user_id = request.getParameter("u");
	ArrayList<String> show_user = coop.get_by_from("*", "id", "user", show_user_id).get(0);
	String is_friend="";
	if(current_user != null){
		
		if(coop.get_by_from_function("*", "(player1_id,player2_id)", "friendship","('" + show_user_id + "','" + current_user.get_id() + "')" ).size() != 0){
			is_friend = "2";
		}else if(coop.get_by_from_function("*", "(player1_id,player2_id)", "friendship","('" + current_user.get_id() + "','" + show_user_id + "')" ).size() != 0){
			is_friend ="1";
		}else{
			is_friend = "0";
		}
	}
	
	%>
<div class="outter1">
	<div class="center_60">
		<div class="inner_div">
			<div class="vertical_100">
			
					
				<div class="line_30_div" id="game_img_div">
					<img alt="" src="<% out.print(show_user.get(8)); %>">
				</div>
				<div class="line_70_div" id="player_info">
					<table>
						<tr>
								<th>Player Name : </th>
								<td><% out.print(show_user.get(1)); %></td>
							</tr>
							<tr>
								<th>Gender : </th>
								<td><% out.print(show_user.get(4)); %></td>
							</tr>
							<tr>
								<th>Location : </th>
								<td><% out.print(show_user.get(5)); %></td>
							</tr>
							<tr>
								<th>Date of Birth : </th>
								<td><% out.print(show_user.get(6)); %></td>
							</tr>
					</table>
				</div>
			</div>
			<div class="vertical_100">
			<br><br><br>
			<%
				if(current_user != null){
					//System.out.print(is_friend);
					if(is_friend.equals("0")){
						out.print("<button class='btn' onclick=\"add_friend(\'"+ show_user_id +"\')\">Add Friend</button>");
						
					}else{
						out.print("<button class='btn' onclick=\"delete_friend(\'" + is_friend + "\',\'"+ show_user_id +"\')\">Delete Friend</button>");
					}
				}	
			
			%>
			<br><br><br><br>
			</div>
		</div>
	</div>

</div>
<% coop.close(); %>
<%@ include file="manager_bar.jsp"%>
<%@ include file="footer.jsp"%>