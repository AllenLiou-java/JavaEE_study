<%@page import="tw.vic.beans.BCrypt"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Properties"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:catch var="errMsg">
	<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		String passwd = BCrypt.hashpw("123456", BCrypt.gensalt());
	
		Properties prop = new Properties();
		prop.put("user", "root");
		prop.put("password", "");
		prop.put("serverTimezone", "Asia/Taipei");
		
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/vic", prop);
		String sql = "INSERT INTO member (account, passwd, realname) VALUES (?, ?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, "Vic");
		pstmt.setString(2, passwd);
		pstmt.setString(3, "Vic Liou");
		pstmt.executeUpdate();
	%>
</c:catch>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSTL - c:catch 例外捕捉</title>
	</head>
	<body>
		<h1>JSTL - c:catch 例外捕捉</h1>
		<c:if test="${errMsg != null }">Server Busy!: ${errMsg }</c:if>
	</body>
</html>