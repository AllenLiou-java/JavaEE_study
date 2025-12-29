<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Vic Big Company</title>
	</head>
	<body>
		<p>This is vic38 page.</p><br />
		
		<%
			String formName = request.getParameter("form");
			out.println("formName:" + formName);
		%>
	</body>
</html>