<%@ include file="head.jsp"%>
<% session.invalidate();
out.println("<script>alert('Logged out!');window.location='index.jsp'</script>");%>
</body>
</html>