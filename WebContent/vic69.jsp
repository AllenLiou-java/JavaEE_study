<%@page import="tw.vic.beans.Member2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String account = (String)request.getParameter("account");
	String passwd = (String)request.getParameter("passwd");
	
	if(account == null || passwd == null) {
		response.sendRedirect("vic68.jsp");
		// 這邊記得要加上return，否則程式會繼續往下執行
		return;
	}
	
	// System.out.print(session.isNew());
	
	
	if(account.equals("vic") && passwd.equals("123456")){
		/* 若session帶的資料是String，在session.setAttribute之後操作(變更)要送出的資料時，
			資料在session.getAttribute時並「不會」變更 */
		/*
		int lotto = (int)(Math.random()*49+1);
		session.setAttribute("account", account);
		session.setAttribute("lotto", lotto);
		
		account += "先生";
		lotto += 100;
		*/
		
		/* 若session帶的資料是class物件時，在session.setAttribute之後操作(變更)要送出的資料時，
		資料在session.getAttribute時「會」變更 */
		int lotto = (int)(Math.random()*49+1);
		Member2 member = new Member2(account, lotto);
		session.setAttribute("member", member);
		
		member.setAccount("Vic Liou");
		member.setLotto(lotto + 100);
		
		response.sendRedirect("vic70.jsp");
	} else {
		response.sendRedirect("vic68.jsp");
	}
%>