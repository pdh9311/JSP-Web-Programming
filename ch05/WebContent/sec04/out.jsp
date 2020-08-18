<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out</title>
</head>
<body>
	<%
		out.print("웹 브라우저에 데이터를 전송하는 출력 스트림 객체" + "<br>");
		out.println("웹 브라우저에 데이터를 전송하는 출력 스트림 객체" + "<br>"); 	// 줄바꿈은 적용되지 않는다.
		out.print(out.getBufferSize() + "<br>");		// 현재 출력 버퍼의 크기를 가져온다.
		out.print(out.getRemaining() + "<br>");		// 현재 남아 있는 출력 버퍼의 크기를 가져온다.
	%>
</body>
</html>