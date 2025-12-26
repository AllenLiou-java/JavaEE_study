<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	final String  OP_ADD = "1";
	final String  OP_MIN = "2";
	final String  OP_MUL = "3";
	final String  OP_DIV = "4";
	
	String result = "";
	String x = request.getParameter("x");
	String y = request.getParameter("y");
	String op = request.getParameter("op");
	
	int intX, intY;
	intX = intY = 0;
	
	if(x != null) {
		intX = Integer.parseInt(x);
		intY = Integer.parseInt(y);
		
		switch(op){
			case OP_ADD: 
				result = "" + (intX + intY);
				break;
			case OP_MIN: 
				result = "" + (intX - intY);
				break;
			case OP_MUL: 
				result = "" + (intX * intY);
				break;
			case OP_DIV: 
				result = "" + (intX / intY) + "..." + (intX % intY);
				break;
		}
		
	} else{
		x = y = "";
		op = OP_ADD;
	}
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>10+3範例</title>
	</head>
	<body>
		<form>
			<input name="x" value="<%= x %>" />
			<select name="op">
				<option value="1" <% out.println(op.equals(OP_ADD)? "selected": ""); %>>+</option>
				<option value="2" <%= (op.equals(OP_MIN)? "selected": "") %>>-</option>
				<option value="3" <%= (op.equals(OP_MUL)? "selected": "") %>>x</option>
				<option value="4" <%= (op.equals(OP_DIV)? "selected": "") %>>/</option>
			</select>
			<input name="y" value="<%= y %>"/>
			<input type="submit" value="=" />
			<span><%= result %></span>
		</form>
	</body>
</html>