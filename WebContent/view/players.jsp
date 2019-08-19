<%@ include file="head.jsp"%>
<div class="outter1">
<% 
List<Map<String,Object>> online_user_set = new ArrayList<Map<String,Object>>();
	online_user_set = (List<Map<String,Object>>)request.getAttribute("onLines");
	//System.out.println("players" + online_user_set);
	//System.out.println("user" + ((Users)(online_user_set.get(0).get("user"))).get_username());
Common_operation coop = new Common_operation();

//ArrayList<ArrayList<String>> online_user_set = coop.get_by_from("*", "is_online", "user", "1" );
//System.out.println(online_user_set);



%>
<div id="show_online_div" >
<table>
<tr>
<th>id</th>
<th>username</th>
<th>gender</th>
<th>location</th>
<th>pic</th>
</tr>
<% 
	if(online_user_set != null){
		Iterator<Map<String,Object>> it = online_user_set.iterator();
		while(it.hasNext()){
			Users thisuser = (Users)it.next().get("current_user");
			//out.println(it.next().get("user"));
			if(thisuser != null){
				out.println("<tr><td>" + thisuser.get_id() + "</td><td>" + thisuser.get_username() + "</td><td>" + thisuser.get_gender() + "</td><td>" + thisuser.get_location() + "</td><td>" + thisuser.get_pic() + "</td></tr>");
			}
		}
	}
 %>
</table>
</div>
</div>
<%@ include file="footer.jsp"%>