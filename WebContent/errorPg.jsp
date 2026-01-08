<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Error Page</title>
	</head>
	<body>
		Oops! Server Busy.<br />
		可透過隱含物件exception 進行錯誤處理<br />
		<%
			out.println(exception);
		%>>
	</body>
</html>