<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int lotto = (int)(Math.random()*49+1);
	// setAttribute()的參數2規定放入object，此時會 autoBoxing
	request.setAttribute("lotto", lotto);
	
	// 隱含物件：pageContext，透過setAttribute 將資料送到指定的 include html片段
	// pageContext 存活在當前頁面，包含include進來的頁面，因為include進來的頁面算在同一頁
	pageContext.setAttribute("key", "pageContext-value");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>在JSP中使用include </title>
	</head>
	<body>
		<h1>在JSP中使用include</h1>
		<p>include 進來的html片段，算在同一頁中</p>
		
		<div>Line 1: <%= lotto %></div>
		<%@ include file="vic34.jsp" %>
		
		<div>Line 2</div>
		
		<h1>隱含物件：pageContext</h1>
		<p>透過setAttribute 將資料送到指定的 include html片段</p>
	</body>
</html>