<%@page import="org.apache.tomcat.util.codec.binary.Base64"%>
<%@page import="org.apache.tomcat.util.http.fileupload.IOUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ServletContext context = request.getServletContext();
	String uploadPath = context.getInitParameter("uploadPath");
	out.println(uploadPath);
	
	Part part = request.getPart("upload");
	
	// 另存新檔在指定路徑
	//part.write(uploadPath + "/" + "test.jpg");
	
	// 將檔案轉成 base64 並將「字串資料」存到資料庫
	long size = part.getSize();
	byte[] buffer = new byte[(int)size];
	IOUtils.readFully(part.getInputStream(), buffer);
	
	String base64String = Base64.encodeBase64String(buffer);
	// 若只用在web，則存進資料庫的內容：data:image/jpeg;base64, base64String
	// 若用在行動裝置，則存進資料庫的內容：base64String
	out.println("<img src='data:image/jpeg;base64," + base64String + "'/>");
	
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>檔案上傳</title>
	</head>
	<body>
		
	</body>
</html>