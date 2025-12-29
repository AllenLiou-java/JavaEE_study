<%@page import="tw.vic.beans.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<p>在application設定member物件，並在vic44.jsp將member物件取出，然後執行 addAge()、getAge()</p>
<br />

<%
	Member member = new Member("", "", "");
	application.setAttribute("member", member);
%>
<%= member.getAge() %>