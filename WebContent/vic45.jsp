<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<p>給定定義會員類別的位置，useBean將會產生此類別的物件實體，後續要使用此物件實體，可透過設定的id="member"進行呼叫</p>
<p>此類別需有 無傳參數建構式，否則會出錯</p>
<p>jsp:useBean的id 需搭配 jsp:setProperty的name</p>
<jsp:useBean id="member" class="tw.vic.beans.Member"></jsp:useBean>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>儘可能使用標籤語法來取代<% %></title>
	</head>
	<body>
	<p>使用 useBean</p>
	
	<p>透過name來認識指定物件，也就是member</p>
	Realname: <jsp:getProperty property="realname" name="member"/>
	<hr />
	
	<jsp:setProperty property="realname" value="III" name="member"/>
	Realname: <jsp:getProperty property="realname" name="member"/>
	<hr />
	
	Account: <jsp:getProperty property="account" name="member"/>
	</body>
</html>