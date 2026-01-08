<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	out.println("jsp:useBean的id 需搭配 jsp:setProperty的name");
%>
<jsp:useBean id="cust" class="tw.vic.beans.Cust"></jsp:useBean>
<jsp:setProperty property="cname" value="${param.cname }" name="cust"/>
<jsp:setProperty property="realname" value="${param.realname }"  name="cust"/>
<jsp:setProperty property="birthday" value="${param.birthday }"  name="cust"/>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP-EL表示法</title>
	</head>
	<body>
		<h1>JSP-EL表示法(範例檔案 vic46.jsp - vic50.jsp)</h1>
		<h2>EL表示法中的 param 為隱含物件</h2>
		<p>此vic46.jsp須配合 vic46.html & 類別tw.vic.beans.Cust</p>
		
		<h3>使用 %標籤 透過JAVA語法取得cname</h3>
		<p>jsp:setProperty標籤中的value，可透過JAVA語法取得參數 request.getParameter("cname")</p>
		<%
			out.println(request.getParameter("cname"));
		%>
		
		<hr />
		
		<h3>使用EL語法取得cname</h3>
		<p>為了減少使用JAVA語法，可用EL表示法取代</p>
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