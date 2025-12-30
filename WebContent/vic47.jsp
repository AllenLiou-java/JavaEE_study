<%@page import="tw.vic.beans.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Vic Big Company</title>
	</head>
	<body>
		<p>應用 EL-表示法 呼叫 自訂類別的static方法</p>
		<form action="vic47.jsp">
			<input type="number" name="x" value="${param.x }" />
			<select name="op">
				<option value="1" ${ (param.op == "1")? "selected": ""}>+</option>
				<option value="2" ${ (param.op == "2")? "selected": ""}>-</option>
				<option value="3" ${ (param.op == "3")? "selected": ""}>x</option>
				<option value="4" ${ (param.op == "4")? "selected": ""}>/</option>
			</select>
			<input type="number" name="y" value="${param.y }" />
			<input type="submit" value="=" />
			${VicApi.calc(param.x, param.y, param.op) }<br />
		</form>
	</body>
</html>