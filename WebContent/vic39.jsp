<%@page import="java.util.Calendar"%>
<%
	Calendar now = Calendar.getInstance();
	int hh = now.get(Calendar.HOUR);
	int mm = now.get(Calendar.MINUTE);
	int ss = now.get(Calendar.SECOND);
	
	out.println(String.format("%d:%d:%d", hh, mm, ss));
%>
