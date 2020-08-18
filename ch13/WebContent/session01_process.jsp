<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 기본값이 session="true" 이므로 ture일때는 따로 작성할 필요 없고, 
	 session.setAttribute("name",value); 로 사용할 수 있다.--%>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(id.equals("admin") && pw.equals("admin1234")) {
			session.setAttribute("id", id);
			session.setAttribute("pw",pw);
			out.print("세션 설정이 성공했습니다.<br>");
			out.print(id+"님 환영합니다.");
		} else {
			out.print("세션 설정이 실패했습니다.");
		}
		
		out.print("<hr>");
		
		// 새로고침하면서 경과시간을 확인 할것!
		String session_id = session.getId();
		long start_time = session.getCreationTime();	// 1970년 1월 1일 0시 0분 0초 부터 현재 세션이 생성된 시간까지 경과한 시간을 1/1000초 값을 반환
		long last_time = session.getLastAccessedTime();	// 1970년 1월 1일 0시 0분 0초 부터 해당 세션에 클라이언트가 마지막으로 request를 보낸 시간
		long used_time = (last_time - start_time)/1000;
		out.print("세션 아이디 : " + session_id + "<br>");
		out.print("요청 시작 시간 : " + start_time/1000 + "초<br>");
		out.print("요청 마지막 시간 : " + last_time/1000 + "초<br>");
		out.print("웹 사이트의 경과 시간 : " + used_time + "초<br>");	
		
	%>
	<p> <a href="session01_check.jsp">세션확인</a>
</body>
</html>