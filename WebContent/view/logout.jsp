<%@ include file="head.jsp"%>
<% session.invalidate();
out.print("<script>alert('Logged out!');window.location='index.jsp'</script>");%>
</body>
</html>