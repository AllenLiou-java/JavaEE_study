<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page errorPage="errorPg.jsp" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>錯誤處理 - 將頁面導到指定錯誤頁面</title>
	</head>
	<body>
		<p>透過標籤 <%@ page errorPage="errorPg.jsp" %> 指定error page</p>
		<p>將b 改成 0，運算時即會拋出錯誤</p>
		<%
			int a = 10, b = 0;
			out.println(a / b);
		
		%>
	</body>
</html>