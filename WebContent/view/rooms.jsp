<%@ include file="head.jsp"%>
<%@ include file="head2.jsp"%>

<% Common_operation coop = new Common_operation();
ArrayList<ArrayList<String>> room_set = coop.get_by_from("*", "is_public", "room", "1" );

ArrayList<ArrayList<ArrayList<String>>> total_room_player_set = new ArrayList<ArrayList<ArrayList<String>>>();
for(int i=0;i<room_set.size();i++){
	total_room_player_set.add(coop.get_by_from("*", "room_id", "room_players", room_set.get(i).get(0) ));
}
%>
<h3>waiting rooms list</h3>
<table>
<tr>
<th>id</th>
<th>game name</th>
<th>size</th>
<th>host id</th>
<th>room log</th>
<th>players</th>
</tr>
<% for(int i=0;i<room_set.size();i++){
	String player_string = "";
	for(int j=0;j<total_room_player_set.get(i).size();j++){
		player_string = player_string + total_room_player_set.get(i).get(j).get(0) + ",<br>";
	}
	out.println("<tr><td>" + room_set.get(i).get(0) + "</td><td>" + room_set.get(i).get(1) + "</td><td>" + room_set.get(i).get(2) + "</td><td>" + room_set.get(i).get(4) + "</td><td>" + room_set.get(i).get(6) + "</td><td>" + player_string + "</td></tr>");
} %>
</table>

<%coop.close(); %>
<%@ include file="manager_bar.jsp"%>
<%@ include file="footer.jsp"%>