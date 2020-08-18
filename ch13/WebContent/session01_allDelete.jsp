<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id ;
		String pw ;
		out.print("-------------세션 삭제전-------------<br>");
		
		if(request.isRequestedSessionIdValid() == true) {
			out.print("세션이 유효합니다. <br>");
			id = (String) session.getAttribute("id");
			pw = (String) session.getAttribute("pw");
			out.print("id : " + id + "<br>");
			out.print("pw : " + pw + "<br>");
		} else {
			out.print("세션이 유효하지 않습니다. <br>");
		}
		
		out.print("<hr>");
		session.invalidate();
		
		out.print("-------------세션 삭제후-------------<br>");
		if(request.isRequestedSessionIdValid() == true) {
			out.print("세션이 유효합니다. <br>");
			id = (String) session.getAttribute("id");
			pw = (String) session.getAttribute("pw");
			out.print("id : " + id + "<br>");
			out.print("pw : " + pw + "<br>");
		} else {
			out.print("세션이 유효하지 않습니다. <br>");
		}
	%>
</body>
</html>