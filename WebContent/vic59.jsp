<%@page import="javax.servlet.jsp.jstl.sql.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!-- 輸入框驗證，確認填入的name是否有與資料庫的資料重複 -->

<sql:setDataSource
	driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3307/vic?serverTimezone=Asia/Taipei"
	user="root"
	password=""
/>

<sql:query var="rs">
	SELECT name FROM foods WHERE name=?
	<sql:param>${param.name }</sql:param>
</sql:query>

<c:if test="${rs.rowCount > 0 }">
資料重複
</c:if>


