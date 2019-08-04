<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="basic_class.*" %>
<%@ page import="model.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Game Platform</title>
<script src="../view/JS/general_script.js"></script>

</head>
<body>
<script type="text/javascript">
//online checking

//code from: https://blog.csdn.net/chengqiuming/article/details/78600118 
//author: cakincqm
//source: CSDN
//add offline listener
window.addEventListener("offline" , function()
{
	alert("You are Offline now!");
	offline_update();
} , true);

// check browser online condition
if (navigator.onLine)
{
	alert("Online");
}
else
{
	alert("Offline");
}

window.addEventListener("close" , function(){
	offline_update();
} , true)

}
</script>
<input type="hidden" id="hidden_user_id" name= "hidden_user_id"value="<% out.println(session.getAttribute("id")); %>">
</body>
</html>