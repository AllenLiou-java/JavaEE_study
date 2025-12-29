<%@page import="tw.vic.beans.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	Member member = (Member)application.getAttribute("member");
	member.addAge();
%>
<%= member.getAge() %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Vic Big Company</title>
	</head>
	<body>
		
	</body>
</html>