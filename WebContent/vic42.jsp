<%@page import="tw.vic.beans.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 透過 sendRedirect 將頁面跳轉過來時，會使用新的request，
	// 故以下request.getAttribute("member")會是null
	// 並不會將attribute - member帶過來
	// Member m2 = (Member)request.getAttribute("member");
	// out.println(m2.getAccout());

	
	// 透過 response.sendRedirect("vic42.jsp?x=10&y=3"); 將參數帶過來
	String x = request.getParameter("x");
	String y = request.getParameter("y");
	out.println( x + ":" + y);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Vic Big Company</title>
	</head>
	<body>
		<p>This is vic42 page.</p><br />
		test sendRedirect.
	</body>
</html>