<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// request.getMethod();
	// pageContext.getRequest();
	
	// 驗證pageContext.getRequest() 與 隱含物件 request是否為同一物件
	HttpServletRequest request2 = (HttpServletRequest)pageContext.getRequest();
	out.println(String.format("request2 == request: %b", request2 == request));
	// request2 == request: true 
	
	request.getRemoteAddr();
	request.getQueryString();
	
	response.getLocale().getDisplayCountry();
%>
<hr />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Vic Big Company</title>
	</head>
	<body>
		Method = ${pageContext.request.method} <br />
		Remote IP = ${pageContext.request.remoteAddr} <br />
		QueryString = ${pageContext.request.queryString} <br />
		Account = ${param.account }<br />
		Passwd = ${param.passwd }<br />
		like1 = ${paramValues.like[0] }<br />
		like2 = ${paramValues.like[1] }<br />
		like3 = ${paramValues.like[2] }<br />
		
		Country = ${pageContext.response.locale.displayCountry }<br />
	</body>
</html>