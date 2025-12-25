<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>表單 - Get送出參數</title>
	</head>
	<body>
		<p>表單送出前透過onsubmit 檢查</p>
		<form action="vic28.jsp" onsubmit="return true;">
			<input name="name" />
			<input type="submit" name="submit">
		</form>
	</body>
</html>