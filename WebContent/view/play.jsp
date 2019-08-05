<%@ include file="head.jsp"%>
<% Common_operation coop = new Common_operation();
ArrayList<ArrayList<String>> current_game = coop.get_by_from("file", "id", "game", request.getParameter("id") ); %>
<div class="play_div">
	<embed class="play_window" src="<% out.println(current_game.get(0).get(0)); %>"></embed>
</div>

</body>
</html>