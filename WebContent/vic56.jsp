<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="tw.vic.beans.*"%>
<%@ page errorPage="errorPg.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>使用JSTL - sql - 新增資料</title>
	</head>
	<body>
		<h1>使用JSTL - sql - 新增資料</h1>
		<sql:setDataSource
			driver="com.mysql.cj.jdbc.Driver"
			url="jdbc:mysql://localhost:3307/vic?serverTimezone=Asia/Taipei"
			user="root"
			password=""
		/>
		<sql:update>
			INSERT INTO member (account, passwd, realname) 
			VALUES ('${param.account }', '${VicApi.createPasswd(param.passwd) }', '${param.realname }')
		</sql:update>
		<p>注意：innerHTML中sql敘述句的VALUES，需加上單引號</p>

		<p>SQL的增刪修都是使用標籤 sql:update</p>
		<p>SQL的查詢使用標籤 sql:query</p>
		
	</body>
</html>