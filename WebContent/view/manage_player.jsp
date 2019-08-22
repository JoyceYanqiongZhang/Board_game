<%@ page import="java.text.DecimalFormat" %>
<%@ include file="head.jsp"%>
<%@ include file="head2.jsp"%>
<% 
	Common_operation coop = new Common_operation();	
	ArrayList<ArrayList<String>> player_set = coop.get_by_from("*", "1", "user", "1");
	int i=0;
%>

<div class="outter1">
<div class="center_90">		
	<div class="inner_div">
	<div class="vertical_100">
		<button class="btn" onclick="window.location.href='http://localhost:8080/BoardGamePlatform/view/manage_player.jsp'">Show All User Info</button>
		<button class="btn" onclick="window.location.href='http://localhost:8080/BoardGamePlatform/back_controller/ShowServlet?from=manage_online_user'">Show Online User Info</button>
	</div>

		<div class="table_div">
			<table class="table table-dark">
				<tr>
					<th>User ID</th>
					<th>User Name</th>
					<th>Is Admin</th>
					<th>Account Condition</th>
					<th>Premium Condition</th>
					<th>Total Wins</th>
					<th>Total Plays</th>
					<th>Win-Played Rate</th>
					<th>View Details</th>
					<th>Operation</th>
					
				</tr>
				
				
				<%
					if(player_set != null){
						for(i=0; i<player_set.size();i++){
							float wins = Float.parseFloat(player_set.get(i).get(10).trim());
							float played = Float.parseFloat(player_set.get(i).get(11).trim());
							float rate =0;
							if(played == 0){
							}else{
								rate = wins/played;
							}
							DecimalFormat df = new DecimalFormat("0.00%");
							df.format(rate);
							
							String is_blocked = player_set.get(i).get(9);
							String is_premium = player_set.get(i).get(14);
							String block_button_text = "";
							String premium_button_text = "";
							String block_change_to = "";
							String premium_change_to = "";
							if(is_blocked.equals("in use")){
								block_button_text = "Block";
								block_change_to = "blocked";
							}else if(is_blocked.equals("blocked")){
								block_button_text = "Cancle Block";
								block_change_to = "in use";
							}
							if(is_premium.equals("normal user")){
								premium_button_text = "Upgrade";
								premium_change_to = "premium user";
							}else if(is_premium.equals("premium user")){
								premium_button_text = "Cancle Premium";
								premium_change_to = "normal user";
							}
							
							out.print("<tr><td>"+ player_set.get(i).get(0) +"</td><td>" + player_set.get(i).get(1) + "</td><td>" + player_set.get(i).get(7) + "</td><td>" + player_set.get(i).get(9) + "</td><td>" + player_set.get(i).get(14) + "</td><td>" + player_set.get(i).get(10) + "</td><td>" + player_set.get(i).get(11) + "</td><td>" + df.format(rate) + "</td><td><button class='btn' onclick=\"window.location.href=\'http://localhost:8080/BoardGamePlatform/view/player_detail.jsp?u=" + player_set.get(i).get(0) + "\'\">View</button></td><td><button class='btn' onclick=\"change_user(\'is_blocked\',\'" + player_set.get(i).get(0) + "\',\'" + block_change_to + "\')\">" + block_button_text + "</button><button class='btn' onclick=\"change_user(\'is_premium\',\'" + player_set.get(i).get(0) + "\',\'" + premium_change_to + "\')\">" + premium_button_text + "</button></td></tr>");
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
