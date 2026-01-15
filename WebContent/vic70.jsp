<%@page import="tw.vic.beans.Member2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 當session的資料為字串時*/
	/*
	String account = (String)session.getAttribute("account");
	int lotto = -1;
	try{
		lotto = (Integer)session.getAttribute("lotto");
	}catch(Exception e){
		System.out.print(e.toString());
	}
	*/
	
	/* 當session的資料為類別物件時*/
	Member2 member = (Member2)session.getAttribute("member");
	
	String account = member.getAccount();
	int lotto = member.getLotto();
	
	pageContext.setAttribute("account", account);
	pageContext.setAttribute("lotto", lotto);

	if( account == null || (lotto<101 && lotto>149)){
		response.sendRedirect("vic68.jsp");
		return;
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Session - 實作簡易的登入登出機制</title>
	</head>
	<body>
		<h1>Session - 實作簡易的登入登出機制</h1>
		<h2>Home Page</h2>
		<hr/>
		<p>Welcome, ${account} : ${lotto }!</p>
		<a href="logout.jsp">Logout</a>
	</body>
</html>