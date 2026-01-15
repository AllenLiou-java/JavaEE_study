<%@page import="java.util.HashMap"%>
<%@page import="java.util.LinkedList"%>
<%@page import="org.json.JSONObject"%>
<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>串接opendata資料，並將部分欄位渲染顯示</title>
	</head>
	<body>
		<h1>串接opendata資料，並將部分欄位渲染顯示</h1>
		<c:import var="data" url="https://data.moa.gov.tw/Service/OpenData/ODwsv/ODwsvAgriculturalProduce.aspx?&UnitId=197" />
		<%
			String strData =  (String)pageContext.getAttribute("data");
			//out.println(strData);
			
			JSONArray root = new JSONArray(strData);
			
			LinkedList<HashMap<String, String>> data = new LinkedList<>();
			
			for(int i=0; i<root.length(); i++) {
				JSONObject row = root.getJSONObject(i);
				HashMap<String, String> map = new HashMap<>();
				map.put("ProduceOrg", row.getString("ProduceOrg"));
				map.put("Feature", row.getString("Feature"));
				map.put("ContactTel", row.getString("ContactTel"));
				map.put("Column1", row.getString("Column1"));
				data.add(map);
			}
			pageContext.setAttribute("opData", data);
			//out.print(arrayData.getJSONObject(0).get("ProduceOrg"));
		%>
		
		<table border="1" width="100%">
			<thead>
				<tr>
					<td>Id</td>
					<td>ProduceOrg</td>
					<td>Feature</td>
					<td>ContactTel</td>
					<td>CoverImg</td>
					<td>imgBase64</td>
				</tr>
			</thead>
			<c:forEach items="${opData }" var="data" varStatus="status">
				<tr>
					<td>${status.index + 1 }</td>
					<td>${data.ProduceOrg }</td>
					<td>${data.Feature }</td>
					<td>${data.ContactTel }</td>
					<td><img alt="cover" src="${data.Column1 }" width="100px" Style="Object-Fit: contain;"></td>
				</tr>
			</c:forEach>
			
		</table>
	</body>
</html>