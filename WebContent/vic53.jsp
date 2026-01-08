<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="tw.vic.beans.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSTL - if</title>
	</head>
	<body style="background-color: 
		<c:choose>
			<c:when test="${param.gender == 'm' }">yellow</c:when>
			<c:when test="${param.gender == 'f' }">pink</c:when>
			<c:otherwise>white</c:otherwise>
		</c:choose>
	">
		<p>在c:if中，可透過var指派的變數來看test中執行的結果</p>
		<c:if test="${param.n == '100' }" var="result">
			param is 100
		</c:if>
		${result }<br />
		<hr />
		
		<p>透過c:set來設定變數與值</p>
		<c:set var="score">100</c:set>
		Score: ${score }<br />
		<hr />
		
		<p>結合c:set 與 class的static方法 隨機設定0-100的值</p>
		<c:set var="score">${VicApi.createScore() }</c:set>
		Score: ${score }<br />
		<hr />
		
		<p>c:choose 進行多重判斷</p>
		<p>將score產生的數值進行評等</p>
		<c:choose>
			<c:when test="${score >=90 }">A</c:when>
			<c:when test="${score >=80 }">B</c:when>
			<c:when test="${score >=70 }">C</c:when>
			<c:when test="${score >=60 }">D</c:when>
			<c:otherwise>E</c:otherwise>
		</c:choose>
		<hr />
		
	</body>
</html>