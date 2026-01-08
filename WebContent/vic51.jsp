<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//載入核心標籤庫
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="cust1" class="tw.vic.beans.Cust" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSTL - Java EE Standard Tag Library</title>
	</head>
	<body>
		<h1>JSTL - Java EE Standard Tag Library</h1>
		<p>主要是減少在HTML中穿插 %標籤的JAVA程式，提升維護性</p>
		<h2>前置設定</h2>
		<ol>
			<li>搜尋關鍵字 taglibs standard dowmload</li>
			<li>下載 jar Files 中的 Impl & Spec</li>
			<li>將jar檔放到 WebContent => WEB-INF => lib</li>
		</ol>
		
		<hr />
		<h2>語法範例</h2>
		<p>預設都是pageScope</p>
		<p>若不設定scope，則以page、request、session、application的範圍尋找屬性名稱</p>
		<%
			// pageContext.setAttribute("x", "321");
			// request.setAttribute("x", "123");
			// 以上JAVA語法可使用JSTL取代
		%>
		<c:set var="x" value="321" scope="page" />
		x = ${x }<br />
		<c:set var="x" value="123" scope="request" />
		x = ${requestScope.x }<br />
		
		<c:out value="Hello World" /><br />
		<c:out value="${'Hello World2' }" /><br />
		${'Hello World3' }<br />
		
		<c:out value="${y }" default="none" /><br />
		${cust1 }<br />
		
		<p>取代useBean - set/get寫法</p>
		<c:set target="${cust1 }" property="cname">Eric</c:set>
		<c:set target="${cust1 }" property="realname">Eric Cheng</c:set>
		<c:set target="${cust1 }" property="birthday">1999-01-02</c:set>
		${cust1.cname }:${cust1.realname }:${cust1.birthday }<br />
		
		<p>清除物件內容</p>
		<c:remove var="cust1"/>
		<c:out value="${cust }" default="nobody" /><br />
		${cust1.cname }:${cust1.realname }:${cust1.birthday }<br />
		
		<h2>總彙整：</h2>
		<ul>
			<li>jsp:useBean產生物件實體</li>
			<li>c:set target給值，值放在innerHTML</li>
			<li>c:out輸出值</li>
		</ul>
		
	</body>
</html>