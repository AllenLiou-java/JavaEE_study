<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource
	driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3307/vic?serverTimezone=Asia/Taipei"
	user="root"
	password=""
/>
<sql:query var="result">
	SELECT * FROM foods WHERE id = ?
	<sql:param>${param.editId }</sql:param>
</sql:query>

<c:if test="${!empty param.updateId }">
	<sql:update>
		UPDATE foods SET name = ?, address = ?, tel = ? WHERE id = ?
		<sql:param>${param.name }</sql:param>
		<sql:param>${param.address }</sql:param>
		<sql:param>${param.tel }</sql:param>
		<sql:param>${param.updateId }</sql:param>
	</sql:update>
	<c:redirect url="vic57.jsp"></c:redirect>
</c:if>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>使用JSTL - sql - 修改資料</title>
	</head>
	<body>
		<h1>使用JSTL - sql - 修改資料</h1>
		
		<form action="vic60.jsp">
			<input type="hidden" name="updateId" value="${ result.rows[0].id }" />
			Name: <input id="name" name="name" value="${result.rows[0].name }" /><br />
			Address: <input name="address" value="${result.rows[0].address }" /><br />
			Tel: <input name="tel" value="${result.rows[0].tel }" /><br />
			<input type="submit" value="Update" />
		</form>
	</body>
</html>