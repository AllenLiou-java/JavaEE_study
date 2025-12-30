<%@page import="tw.vic.beans.*"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String[] varGroup = { "var1", "var2", "var3", "var4", "var5"};
	pageContext.setAttribute("group", varGroup);
	
	String[] allenGroup = { "allen1", "allen2", "allen3", "allen4", "allen5"};
	request.setAttribute("group", allenGroup);
	
	LinkedList<String> list = new LinkedList<>();
	list.add("Vic"); list.add("Tina"); list.add("Tad");
	pageContext.setAttribute("list", list);
	
	HashMap<String, String> map = new HashMap<>();
	map.put("k1", "map1");
	map.put("k2", "map2");
	map.put("k3", "map3");
	pageContext.setAttribute("map", map);
	
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>EL表示法 - 應用</title>
	</head>
	<body>
		<p>當 pageContext 與 request 同時呼叫setAttribute並給定相同的屬性group1</p>
		<p>此時是取得 pageContext上的attribute</p>
		<p>因為讀取的優先權：pageContext => request => session => application</p>
		${group[1] }
		<hr />
		
		<p>若要直接取request帶的屬性，可使用requestScope</p>
		<p>讀取的優先權：pageScope => requestScope => sessionScope => applicationScope</p>
		${requestScope.group[2] }
		<hr />
		
		<%= varGroup[0] %>
		<hr />
		
		<p>讀取資料結構 - LinkedList</p>
		${list[1] }<br />
		${list["2"] }<br />
		${list[param.i] }
		<hr />
		
		<p>讀取資料結構 - HashMap</p>
		${map["k1"] }<br />
		${map.k2 }<br />
		<hr />
		
		<p>讀取類別Static</p>
		${Math.random() }<br />
		${ VicApi.sayHi(param.who) }
		<hr />
		
		<p>表達式運算</p>
		${10 > 3 }<br />
		${(param.gender == "m")?"Male": "Female" }<br />
	</body>
</html>