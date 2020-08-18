<%-- 현재 JSP 페이지의 contentType 속성으로 appliction/msword를 사용할 경우 아래 작성한 내용을 msword파일을 다운로드하게 된다. --%>
<%@ page contentType="application/msword" %>
<%@ page pageEncoding="ISO-8859-1" %>

<html>
<head>
<title>Directive Tag</title>
</head>
<body>
	<h2>contentType 디렉티브 태그</h2>
	<h4>application/msword : msword 출력</h4>
	Today is = <%= new java.util.Date() %>
</body>
</html>
안녕 하세요.