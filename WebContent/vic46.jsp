<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="cust" class="tw.vic.beans.Cust"></jsp:useBean>
<jsp:setProperty property="cname" value="${param.cname }" name="cust"/>
<jsp:setProperty property="realname" value="${param.realname }"  name="cust"/>
<jsp:setProperty property="birthday" value="${param.birthday }"  name="cust"/>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Vic Big Company</title>
	</head>
	<body>
		<h2>JSP-EL表示法，param為隱含物件</h2>
		<p>jsp:setProperty標籤中的value，透過JAVA語法取得參數 request.getParameter("cname")</p>
		<p>但為了減少使用JAVA語法，可以使用EL表示法取代</p>
		<p>${param.cname }</p>
		
		<hr />
		
		<p>以下也可用EL表示法 取代</p>
		Orginal_cname = <jsp:getProperty property="cname" name="cust"/><br />
		
		Cname = ${cust.cname}<br />
		Realname = ${cust.realname}<br />
		Birthday = ${cust.birthday}<br />
		物件的記憶體位址：${cust}
	</body>
</html>