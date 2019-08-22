<%@ page import="java.text.DecimalFormat" %>
<%@ include file="head.jsp"%>
<%@ include file="head2.jsp"%>
<% 
List<Map<String,Object>> online_user_set = new ArrayList<Map<String,Object>>();
	online_user_set = (List<Map<String,Object>>)request.getAttribute("onLines");
	//System.out.println("online test" + online_user_set.get(0).get("creationTime"));
%>
<% 
	int i=0;
%>

<div class="outter1">
	<div class="vertical_100">
		<button onclick="window.location.href='http://localhost:8080/BoardGamePlatform/view/manage_player.jsp'">Show All User Info</button>
		<button onclick="window.location.href='http://localhost:8080/BoardGamePlatform/back_controller/ShowServlet?from=manage_online_user'">Show Online User Info</button>
	</div>
	<div class="center_60">
		<div class="table_div">
			<table class="table table-striped">
				<tr>
					<th>User ID</th>
					<th>User Name</th>
					<th>Start Visiting Time</th>
					<th>Last active time</th>
					<th>Visit IP</th>
					
				</tr>
				
				
				<%
					if(online_user_set != null){
	            		Iterator<Map<String,Object>> it = online_user_set.iterator();
	            		while(it.hasNext()){
	            			Map<String,Object> the_user = it.next();
	            			Users thisuser = (Users)the_user.get("current_user");
	            			//System.out.println((String)the_user.get("creationTime"));
	            			//out.println(it.next().get("user"));
	            			if(thisuser != null){
	
	            				out.println("<tr><td>" + thisuser.get_id() + "</td><td>" + thisuser.get_username() + "</td><td>" + the_user.get("creationTime") + "</td><td>" + the_user.get("lastAccessTime") + "</td><td>" + the_user.get("ip") + "</td></tr>");
	            			}
	            		}
	            	}
					
					
				%>
			</table>
		</div>
	</div>	
</div>
<%@ include file="manager_bar.jsp"%>
<%@ include file="footer.jsp"%>
