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

<c:if test="${!empty param.name }">
	<sql:update var="count">
		INSERT INTO foods (name, address, tel) VALUES (?,?,?)
		<sql:param>${param.name }</sql:param>
		<sql:param>${param.address }</sql:param>
		<sql:param>${param.tel }</sql:param>
	</sql:update>
	<c:redirect url="vic57.jsp"></c:redirect>
</c:if>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>使用JSTL - sql - 新增資料</title>
	</head>
	<body>
		<h1>使用JSTL - sql - 新增資料</h1>
		<p>輸入框驗證，確認填入的name是否有與資料庫的資料重複 - 由vic59.jsp處理</p>
		
		<script>
			const xhttp = new XMLHttpRequest();
			function checkName(){
				let name = document.getElementById("name").value;
				
				xhttp.onload = function() {
				  document.getElementById("mesg").innerHTML = this.responseText;
				  }
				xhttp.open("GET", "vic59.jsp?name=" + name, true);
				xhttp.send();
				
			}
		</script>
		
		<form action="vic58.jsp">
			Name: <input id="name" name="name" onblur="checkName()" /><span id="mesg"></span><br />
			Address: <input name="address" /><br />
			Tel: <input name="tel" /><br />
			<input type="submit" value="Add" />
		</form>
	</body>
</html>