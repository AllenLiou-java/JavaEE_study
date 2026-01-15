<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="iii"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>自訂tag</title>
	</head>
	<body>
		<h1>自訂tag</h1>
		<iii:vic1 /><br />
		<iii:vic2 user="Vic" />
		<iii:vic2 user="Tina" />
		<iii:vic3 x="9" y="3">
			10 + 3 = ${add }<br />
			10 - 3 = ${sub }<br />
			10 * 3 = ${mul }<br />
			10 / 3 = ${divid }<br />
		</iii:vic3>
		<hr />
		Lucky Number:<iii:vic4 />
		<hr />
		<table border="1" width="100%">
			<tr>
				<td>Name</td>
				<td>Price</td>
			</tr>
				<iii:vic5 name="keyboard" price="6000" />
				<iii:vic5 name="ps5" price="26000" />
				<iii:vic5 name="mouse" price="600" />
		</table>
	</body>
</html>