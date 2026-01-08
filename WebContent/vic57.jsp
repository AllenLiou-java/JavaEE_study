<%@page import="java.util.SortedMap"%>
<%@page import="javax.servlet.jsp.jstl.sql.Result"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="errorPg.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<sql:setDataSource
	driver="com.mysql.cj.jdbc.Driver"
	url="jdbc:mysql://localhost:3307/vic?serverTimezone=Asia/Taipei"
	user="root"
	password=""
/>

<c:if test="${!empty param.delId }">
	<sql:update>
		DELETE FROM foods WHERE id = ?
		<sql:param>${param.delId}</sql:param>
	</sql:update>
</c:if>

<c:set var="rpp" value="10" />
<sql:query var="all">
	SELECT * FROM foods
</sql:query>
<%
	int rpp = Integer.parseInt((String)pageContext.getAttribute("rpp"));
	Result rs = (Result)pageContext.getAttribute("all");
	int count = rs.getRowCount();
	int pages = (int)Math.ceil((count * 1.0)/rpp);
	pageContext.setAttribute("pages", pages);
%>

<c:set var="page" value="${ param.page == null? 1: param.page}" />
<c:set var="start" value="${(page - 1) * rpp }" />
<c:set var="next" value="${page == pages? page: page + 1 }" />
<c:set var="prev" value="${page == 1? 1: page - 1 }" />

<sql:query var="rs">
	SELECT * FROM foods ORDER BY id desc LIMIT ${start }, ${rpp }
</sql:query>



<%
	//Result result = (Result)pageContext.getAttribute("rs");
	//int count = result.getRowCount();
	//out.print("總筆數：" + count);
	
	// 讀資料
	//SortedMap<String, Object>[] rows = result.getRows();
	//for (SortedMap<String, Object> row : rows) {
	//    out.println(row.get("id") + " - " + row.get("name") + "<br>");
	//}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>使用JSTL - sql - 查詢資料</title>
	</head>
	<body>
		<h1>使用JSTL - sql - 查詢｜刪除資料</h1>
		<h2>查詢｜刪除 列表</h2>
		<p>需有分頁功能</p>
		
		<hr />
		<a href="vic58.jsp">Add</a>
		<hr />
		
		<a href="?page=${prev }">Prev</a>｜<a href="?page=${next }">Next</a>
		<table border="1" width="100%">
			<tr>
				<td>id</td>
				<td>name</td>
				<td>address</td>
				<td>tel</td>
				<td>picUrl</td>
				<td>Delete</td>
			</tr>
			<c:forEach items="${rs.rows }" var="row" varStatus="status">
				<tr>
					<td>${row.id }</td>
					<td>${row.name }</td>
					<td>${row.address }</td>
					<td>${row.tel }</td>
					<td><img src="${row.picUrl }" width="128px" height="72px" style="object-fit: cover;" /></td>
					<script>
						function delConfirm(name){
							return confirm('Delete[' + name + ']?');
						}
					</script>
					<td><a href="?delId=${row.id }" onclick="return delConfirm('${row.name}')">刪除</a></td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>