<%@ include file="head.jsp"%>

<% String player_type = request.getParameter("t"); %>
<h2><a href="players.jsp?t=online">Online</a> | <a href="players.jsp?t=friend">Friend</a></h2>
<% Common_operation coop = new Common_operation();
ArrayList<ArrayList<String>> online_user_set = coop.get_by_from("*", "is_online", "user", "1" );
System.out.println(online_user_set);

ArrayList<String> friend_id_set = new ArrayList<String>();
ArrayList<ArrayList<String>> friendship_set1 = coop.get_by_from("*", "player1_id", "friendship", String.valueOf(session.getAttribute("id")) );
for(int i=0;i<friendship_set1.size();i++){
	friend_id_set.add(friendship_set1.get(i).get(1));
}
ArrayList<ArrayList<String>> friendship_set2 = coop.get_by_from("*", "player2_id", "friendship", String.valueOf(session.getAttribute("id")) );
for(int i=0;i<friendship_set2.size();i++){
	friend_id_set.add(friendship_set2.get(i).get(0));
}
ArrayList<ArrayList<String>> friend_set = new ArrayList<ArrayList<String>>();
for(int i=0;i<friend_id_set.size();i++){
	friend_set.add(coop.get_by_from("*", "is_online", "user", "1" ).get(0) );
}


%>
<div id="show_online_div" style="display : <% if(player_type.equals("online")){
	out.println("block");
}else if(player_type.equals("friend")){
	out.println("none");
}
%>">
<table>
<tr>
<th>id</th>
<th>username</th>
<th>gender</th>
<th>location</th>
<th>pic</th>
</tr>
<% for(int i=0;i<online_user_set.size();i++){
	out.println("<tr><td>" + online_user_set.get(i).get(0) + "</td><td>" + online_user_set.get(i).get(1) + "</td><td>" + online_user_set.get(i).get(4) + "</td><td>" + online_user_set.get(i).get(5) + "</td><td>" + online_user_set.get(i).get(8) + "</td></tr>");
} %>
</table>
</div>
<div id="show_friend_div" style="display : <% if(player_type.equals("online")){
	out.println("none");
}else if(player_type.equals("friend")){
	out.println("block");
}
%>">
<table>
<tr>
<th>id</th>
<th>username</th>
<th>gender</th>
<th>location</th>
<th>pic</th>
</tr>
<% for(int i=0;i<friend_set.size();i++){
	out.println("<tr><td>" + friend_set.get(i).get(0) + "</td><td>" + friend_set.get(i).get(1) + "</td><td>" + friend_set.get(i).get(4) + "</td><td>" + friend_set.get(i).get(5) + "</td><td>" + friend_set.get(i).get(8) + "</td></tr>");
} %>
</table>
</div>

</body>
</html>