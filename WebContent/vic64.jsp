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

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jstl - sql - transaction</title>
	</head>
	<body>
		<h1>jstl - sql - transaction</h1>
		<p>在資料庫member中新增資料後，若新增成功，則顯示該筆資料的ID</p>
		
		<c:catch>
			<sql:transaction>
				<sql:update var="num">
					INSERT INTO member(account, passwd, realname) VALUE (?,?,?)
					<sql:param>Test1</sql:param>
					<sql:param>123456</sql:param>
					<sql:param>TestA</sql:param>
				</sql:update>
				<sql:query var="lastId">
					SELECT LAST_INSERT_ID() as newId
				</sql:query>
			</sql:transaction>
			
			<c:if test="${num > 0 }">
				Last ID: ${lastId.rows[0].newId }
			</c:if>
		</c:catch>
		
	</body>
</html>