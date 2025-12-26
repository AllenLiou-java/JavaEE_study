<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Server 時間</title>
	</head>
	<body>
		<p>在進行跨國交易時，例如會指定3天內有效，此時通常都是會以Server的時間為主</p>
		
		Today : <% 
			Calendar now = Calendar.getInstance();
			int year = now.get(Calendar.YEAR);
			int month = now.get(Calendar.MONTH) + 1;
			int day = now.get(Calendar.DAY_OF_MONTH);
			int hour = now.get(Calendar.HOUR);
			int minute = now.get(Calendar.MINUTE);
			int second = now.get(Calendar.SECOND);
			
			out.print(String.format("%d/%d/%d %d:%d:%d", year, month, day, hour, minute, second));
		%>
	</body>
</html>