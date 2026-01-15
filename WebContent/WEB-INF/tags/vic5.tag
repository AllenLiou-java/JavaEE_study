<%@tag import="java.util.HashMap"%>
<%@tag dynamic-attributes="product" %>

<%
	HashMap<String, String> ps = 
		(HashMap<String, String>)jspContext.getAttribute("product");

	out.print("<tr>");
	out.print("<td>");
	out.print(ps.get("name"));
	out.print("</td>");
	out.print("<td>");
	out.print(ps.get("price"));
	out.print("</td>");
	out.print("</tr>");
%>