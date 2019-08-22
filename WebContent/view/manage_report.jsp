<%@ include file="head.jsp"%>
<%@ include file="head2.jsp"%>
<% 
	Common_operation coop = new Common_operation();	
	ArrayList<ArrayList<String>> report_set = coop.get_by_from("*", "1", "report", "1");
	int i=0;
%>

<div class="outter1">
	<div class="line_60_div">
	<div class="center_90">
		<div class="inner_div">
		
		<div class="table_div">
			<table class="table table-dark">
				<tr>
					<th>Report ID</th>
					<th>Report By</th>
					<th>User name</th>
					<th>Condition</th>
					<th>View Content</th>
					<th>Operation</th>
				</tr>
				
				
				<%
					if(report_set != null){
						for(i=0; i<report_set.size();i++){
							String user_name = coop.get_by_from("username", "id", "user", report_set.get(i).get(1)).get(0).get(0);
							String condition = report_set.get(i).get(3);
							String button_part = "";
							if(condition.equals("submited")){
								button_part = "<button class='btn' onclick=\"change_report_condition(\'" + report_set.get(i).get(0) + "\',\'dealt\' )\">Mark as dealt</button>";
							}
				
							out.print("<tr><td>"+ report_set.get(i).get(0) +"</td><td>"+ report_set.get(i).get(1) +"</td><td>" + user_name + "</td><td>" + report_set.get(i).get(3) + "</td><td><button class='btn' onclick=\"show_content(\'" + report_set.get(i).get(0)+ "\')\">View</button></td><td>" + button_part + "</td></tr>");
						}
					}
					
				%>
			</table>
		</div>
		</div>
	</div>
	</div>
	<div class="line_40_div">
		<div class="center_90">
			<div class="inner_div">
				<div id="show_content_div">
				</div>
			</div>
		</div>
	</div>	
</div>
<% coop.close(); %>
<%@ include file="manager_bar.jsp"%>
<%@ include file="footer.jsp"%>
