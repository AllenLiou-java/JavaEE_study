<%
	String v1 = request.getParameter("key1");
	String v2 = request.getParameter("key2");
	Object m1 = (Object)request.getAttribute("member");

%>

Hello, vic36.jsp!<br />
<%= v1 %><br />
<%= v2 %><br />
<%= m1 %>