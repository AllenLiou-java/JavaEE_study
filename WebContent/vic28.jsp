<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Vic Big Company</title>
	</head>
	<body>
		Hello,<%= name %>
	</body>
</html>