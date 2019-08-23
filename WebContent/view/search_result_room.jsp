<%@ include file="head.jsp"%>
<%@ include file="head2.jsp"%>

<% 
	Common_operation coop = new Common_operation();
	String num_of_items = request.getParameter("num_of_items");
	String table = request.getParameter("table");
	String index1 = request.getParameter("index1");
	String index2 = request.getParameter("index2");
	String content = request.getParameter("content");
	ArrayList<ArrayList<String>> result_set = new ArrayList<ArrayList<String>>();
	if(num_of_items.equals("1")){
		 result_set = coop.search_by1_from(table, Integer.parseInt(index1.trim()), content);
	}else if(num_of_items.equals("2")){
		result_set = coop.search_by2_from(table, Integer.parseInt(index1.trim()),Integer.parseInt(index2.trim()), content);		
	}
	int i=0;
	%>

<div class="outter1">
	<div class="center_80">
	<div class="inner_div">
		<div class="table_div">
			<table class="table table-dark">
				<tr>
					<th>Room ID</th>
					<th>Host ID</th>
					<th>Host</th>
					<th>Condition</th>
					<th>View details</th>
					
				</tr>
				
				
				<%
					if(result_set != null){
						for(i=0; i<result_set.size();i++){
							String game_name = coop.get_by_from("name", "id", "game", result_set.get(i).get(1)).get(0).get(0);
							String num_of_players = coop.get_by_from("COUNT(*)", "room_id", "room_players", result_set.get(i).get(0)).get(0).get(0);
							String host_name = coop.get_by_from("username", "id", "user", result_set.get(i).get(4)).get(0).get(0);
							String condition = "";
							if(result_set.get(i).get(8).equals("1")){
								condition = "playing";
							}else{
								condition = "waiting";
							}
							String availability = "";
							String change_to = "";
							String button_text ="";
							if(result_set.get(i).get(3).equals("1")){
								availability = "blocked";
								change_to = "0";
								button_text = "Cancle_block";
							}else{
								availability = "public";
								change_to = "1";
								button_text = "Block";
							}
				
							out.print("<tr><td>"+ result_set.get(i).get(0) +"</td><td>" + result_set.get(i).get(4) + "</td><td>" + host_name + "</td><td>" + condition + "</td><td><button class='btn' onclick=\"window.location.href=\'http://localhost:8080/BoardGamePlatform/view/room_details.jsp?r=" + result_set.get(i).get(0) + "\'\">View</button></td></tr>");
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