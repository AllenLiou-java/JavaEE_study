<%@page import="tw.vic.beans.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member member = new Member("1", "vic", "vicLiou");
	request.setAttribute("member", member);
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Vic Big Company</title>
	</head>
	<body>
		Account: <%= member.getAccout() %><br />
		<%
			Member m2 = (Member)request.getAttribute("member");
			out.println(m2.getAccout());
		%>
		<hr />
		
		<p>sendRedirect 與 jsp:forward 會有衝突</p>
		<jsp:include page="vic41.jsp" />
		<%
			response.sendRedirect("vic42.jsp?x=10&y=3");
		%>
		
	</body>
</html>