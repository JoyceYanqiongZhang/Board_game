<%@ include file="head.jsp"%>
<% 
	Common_operation coop = new Common_operation();
	String show_user_id = request.getParameter("u");
	ArrayList<String> show_user = coop.get_by_from("*", "id", "user", show_user_id).get(0);
	Users current_user = (Users)session.getAttribute("current_user");
	String is_friend;
	if(coop.get_by_from_function("*", "(player1_id,player2_id)", "friendship","('" + show_user_id + "','" + current_user.get_id() + "')" ).size() != 0){
		is_friend = "2";
	}else if(coop.get_by_from_function("*", "(player1_id,player2_id)", "friendship","('" + current_user.get_id() + "','" + show_user_id + "')" ).size() != 0){
		is_friend ="1";
	}else{
		is_friend = "0";
	}
	%>
<div class="outter1">
<div class="vertical_100">
	<div class="line_40_div">
		<img alt="" src="<% out.println(show_user.get(8)); %>">
	</div>
	<div class="line_60_div" id="player_info">
		<table>
			<tr>
					<th>Player Name : </th>
					<td><% out.println(show_user.get(1)); %></td>
				</tr>
				<tr>
					<th>Gender : </th>
					<td><% out.println(show_user.get(4)); %></td>
				</tr>
				<tr>
					<th>Location : </th>
					<td><% out.println(show_user.get(5)); %></td>
				</tr>
				<tr>
					<th>Date of Birth : </th>
					<td><% out.println(show_user.get(6)); %></td>
				</tr>
		</table>
	</div>
</div>
<div class="vertical_100">
<%
	System.out.println(is_friend);
	if(is_friend.equals("0")){
		out.println("<button onclick=\"add_friend(\'"+ show_user_id +"\')\">Add Friend</button>");
		
	}else{
		out.println("<button onclick=\"delete_friend(\'" + is_friend + "\',\'"+ show_user_id +"\')\">Delete Friend</button>");
	}
%>
</div>


</div>
<% coop.close(); %>
<%@ include file="footer.jsp"%>