<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String result = "";
	String x = request.getParameter("x");
	String y = request.getParameter("y");
	
	int intX, intY;
	intX = intY = 0;
	
	if(x != null) {
		intX = Integer.parseInt(x);
		intY = Integer.parseInt(y);
		result = "" + (intX + intY);
	} else{
		x = y = "";
	}
	
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>10+3範例</title>
	</head>
	<body>
		<form action="">
			<input name="x" value="<%= x %>" />
			+
			<input name="y" value="<%= y %>"/>
			<input type="submit" value="=" />
			<span><%= result %></span>
		</form>
	</body>
</html>