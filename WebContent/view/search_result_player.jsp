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
<div class="center_90">		
	<div class="inner_div">
	<div class="vertical_100">
	</div>

		<div class="table_div">
			<table class="table table-dark">
				<tr>
					<th>User ID</th>
					<th>User Name</th>
					<th>View Details</th>
					
					
				</tr>
				
				
				<%
					if(result_set != null){
						for(i=0; i<result_set.size();i++){
							float wins = Float.parseFloat(result_set.get(i).get(10).trim());
							float played = Float.parseFloat(result_set.get(i).get(11).trim());
							float rate =0;
							if(played == 0){
							}else{
								rate = wins/played;
							}
							
							
							String is_blocked = result_set.get(i).get(9);
							String is_premium = result_set.get(i).get(14);
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
							
							out.print("<tr><td>"+ result_set.get(i).get(0) +"</td><td>" + result_set.get(i).get(1) + "</td><td><button class='btn' onclick=\"window.location.href=\'http://localhost:8080/BoardGamePlatform/view/player_detail.jsp?u=" + result_set.get(i).get(0) + "\'\">View</button></td></tr>");
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