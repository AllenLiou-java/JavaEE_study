<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSTL例外處理</title>
	</head>
	<body>
		<h1>JSTL例外處理</h1>
		<p>加上var屬性後，後續的程式皆可存取此變數</p>
		<hr />
		<c:catch var="error">
			<%
				// 以下程式碼執行後會發生錯誤，可透過c:catch來捕捉
				String num = request.getParameter("n");
				int n = Integer.parseInt("num");
				out.print(n);
			%>
		</c:catch>
		${error }
		<hr />
		
		
	</body>
</html>