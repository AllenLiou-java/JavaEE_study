<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String[] names = {"Vic", "Tina", "Tim", "Peter", "Amy", "Joe"};
	pageContext.setAttribute("names", names);
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>c:forEach</title>
	</head>
	<body>
		<p>c:forEach中的varStatus可以表現其陣列尋訪的特性</p>
		<table border="1" width="100%">
			<tr>
				<td>Index</td>
				<td>Name</td>
				<td>Count</td>
				<td>First</td>
				<td>Last</td>
			</tr>
			<c:forEach items="${names }" var="name" varStatus="status">
				<tr bgcolor="${status.index % 2 == 0? 'yellow': 'pink'  }">
					<td>${status.index + 1 }</td>
					<td>${name }</td>
					<td>${status.count }</td>
					<td>${status.first }</td>
					<td>${status.last }</td>
				</tr>
			</c:forEach>
			
		</table>
	</body>
</html>