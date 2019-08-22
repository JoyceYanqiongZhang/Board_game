<%@ include file="head.jsp"%>
<%@ include file="head2.jsp"%>


<% 

Common_operation coop = new Common_operation();


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
	friend_set.add(coop.get_by_from("*", "id", "user", friend_id_set.get(i) ).get(0) );
}


%>

<div id="show_friend_div">
<table>
<tr>
<th>id</th>
<th>username</th>
<th>gender</th>
<th>location</th>
<th>pic</th>
</tr>
<% for(int i=0;i<friend_set.size();i++){
	out.print("<tr><td>" + friend_set.get(i).get(0) + "</td><td>" + friend_set.get(i).get(1) + "</td><td>" + friend_set.get(i).get(4) + "</td><td>" + friend_set.get(i).get(5) + "</td><td>" + friend_set.get(i).get(8) + "</td></tr>");
} %>
</table>
</div>

<%@ include file="manager_bar.jsp"%>
<%@ include file="footer.jsp"%>