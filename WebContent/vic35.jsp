<%@page import="tw.vic.beans.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int lotto1 = (int)(Math.random()*49+1);
	int lotto2 = (int)(Math.random()*49+1);
	
	
	// 關於Parameter存取，僅有request.getParameter()方法，並無set方法
	// 一般都是透過在url?key=value 來設定參數
	// 關於Parameter的設定，key 與 value僅限於String
	
	
	// 若傳遞的資料不為String，則應改用 setAttribute(key, value)、getAttribute(key, value)，其值皆為Object
	Member member = new Member("1", "vic", "VicLiou");
	request.setAttribute("member", member);
	
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>標籤語法 - 使用必要屬性 jsp:include </title>
	</head>
	<body>
		<h1>Vic Big Company</h1>
		<hr />
		
		<p>標籤語法 - 維護性較好</p>
		<jsp:include page="vic36.jsp">
			<jsp:param value="<%= lotto1 %>" name="key1"/>
			<jsp:param value="<%= lotto2 %>" name="key2"/>
		</jsp:include>
	</body>
</html>