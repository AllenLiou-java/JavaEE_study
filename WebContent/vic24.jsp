<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Vic Big Company</title>
	</head>
	<body>
		<%
			// 在jsp中，一律都是使用標籤，包含 "< % % >" 也是標籤
			// 在此範圍內可直接撰寫JAVA
			// out 為JSP隱含變數
		%>
		
		<h1>Vic Big Company</h1>
		<hr />
		<%
			int lotto = (int)(Math.random()*49+1);
			out.println("Hello World!");
		%>
		<hr />
		隨機產生號碼：<% out.println(lotto); %><br />
		隨機產生號碼：<%= lotto %><br />
	</body>
</html>