<%@page import="tw.vic.beans.Member"%>
This is vic41 Page<br />
<%
	Member m2 = (Member)request.getAttribute("member");
	out.println(m2.getAccout());
%>
<hr />