<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int a=10;
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>顯示變數值</title>
	</head>
	<body>
		a = <%= a++ %><br />
		a = <%= a %>
	</body>
</html>