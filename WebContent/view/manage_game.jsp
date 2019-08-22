<%@ include file="head.jsp"%>
<%@ include file="head2.jsp"%>
<% 
	Common_operation coop = new Common_operation();	
	ArrayList<ArrayList<String>> game_set = coop.get_by_from("*", "1", "game", "1");
	int i=0;
%>

<div class="outter1">
	<div class="center_80">
		<div class="inner_div">
		<div class="table_div">
			<table class="table table-dark">
				<tr>
					<th>Game ID</th>
					<th>Name</th>
					<th>Availability</th>
					<th>Change Availability To</th>
					<th>View Details</th>
				</tr>
				
				
				<%
					if(game_set != null){
						for(i=0; i<game_set.size();i++){
							String availability = game_set.get(i).get(7);
							
							out.print("<tr><td>"+ game_set.get(i).get(0) +"</td><td>" + game_set.get(i).get(1) + "</td><td>" + game_set.get(i).get(7) + "</td><td><select id='change_availability'><option value='public'>public</option><option value='premium'>premium</option><option value='blocked'>blocked</option></select><button class='btn' onclick=\"change_availability(\'" + game_set.get(i).get(0) + "\', document.getElementById(\'change_availability\').value)\">Change</button></td><td><button class='btn' onclick=\"window.location.href=\'http://localhost:8080/BoardGamePlatform/view/game_detail.jsp?g=" + game_set.get(i).get(0) + "\'\">View</button></td></tr>");
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
