<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jstl - functions</title>
	</head>
	<body>
		<c:set var="greet" value="Hello, World" />
		<c:if test='${fn:contains(greet, "World") }'>
			OK
		</c:if>
		
		<%
			String greet = (String)pageContext.getAttribute("greet");
			if(greet.contains("World")) {
				out.println("OK");
			}
		%>
	</body>
</html>