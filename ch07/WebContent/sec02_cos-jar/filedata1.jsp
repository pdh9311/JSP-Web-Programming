<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FileUpload-cos.jar</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	// cos.jar 파일에 포함된 MultipartRequest 클래스를 이용한 파일 업로드
	MultipartRequest multi = new MultipartRequest(
			request,		// Request 내장객체
			"D:\\",			// 파일 저장 위치	
			5*1024*1024,	// 업로드할 파일의 최대 크기(5MB)
			"utf-8",		// 파일명의 인코딩 유형
			new DefaultFileRenamePolicy()	// 서버에 동일한 파일 존재하면 파일명뒤에 숫자를 붙여서 중복되지 않게 한다.		
			);
	String name1= multi.getParameter("name1");
	String title1 = multi.getParameter("title1");
	String name2 = multi.getParameter("name2");
	String title2 = multi.getParameter("title2");
	String name3 = multi.getParameter("name3");
	String title3 = multi.getParameter("title3");
	
	Enumeration<String> params = multi.getFileNames();

	String fileInputName1 = params.nextElement();	// input 태그의 name값
	String saveFileName1 = multi.getFilesystemName(fileInputName1);		// 저장된 파일명
	String originalFileName1 = multi.getOriginalFileName(fileInputName1);	// 원본 파일명
	
	String fileInputName2 = params.nextElement();
	String saveFileName2 = multi.getFilesystemName(fileInputName2);
	String originalFileName2 = multi.getOriginalFileName(fileInputName2);
	
	
	String fileInputName3 = params.nextElement();
	String saveFileName3 = multi.getFilesystemName(fileInputName3);
	String originalFileName3 = multi.getOriginalFileName(fileInputName3);
	
	out.print("<table border=1>");
	out.print("<tr>");
	out.print("<td>작성자</td><td>제목</td><td>저장된 파일명</td><td>원본 파일명</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<td>"+name1+"</td><td>"+title1+"</td><td>"+saveFileName1+"</td><td>"+originalFileName1+"</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<td>"+name2+"</td><td>"+title2+"</td><td>"+saveFileName2+"</td><td>"+originalFileName2+"</td>");
	out.print("</tr>");
	out.print("<tr>");
	out.print("<td>"+name3+"</td><td>"+title3+"</td><td>"+saveFileName3+"</td><td>"+originalFileName3+"</td>");
	out.print("</tr>");
	out.print("</table>");
	
	
%>
</body>
</html>