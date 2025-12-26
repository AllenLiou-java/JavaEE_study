<%
	Object tempObjLotto = request.getAttribute("lotto");
	// unboxing
	int lotto2 = (Integer)tempObjLotto;
	
	String test = (String)pageContext.getAttribute("key");
	out.println(test);
%>
<div>Line 1.5: <%= lotto2 %></div>

<%
	String name = request.getParameter("name");
%>
<%= name %>
