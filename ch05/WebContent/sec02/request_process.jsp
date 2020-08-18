<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Request process</title>
</head>
<body>
	
	<% 
		request.setCharacterEncoding("UTF-8"); // 폼에서 한글로 입력한 데이터를 정상적으로 처리하기위해 필요함
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		out.print(id+"<br>");
		out.print(pw+"<br>");
	
	%>
	
	<%
		String hostValue = request.getHeader("host");
		String alValue = request.getHeader("accept-language");
		
		out.print("호스트명 : " + hostValue + "<br>");
		out.print("설정된 언어 : " + alValue + "<br><hr>");
		
		/* HTTP 요청 헤더(request header) 정보 */
		Enumeration<String> en = request.getHeaderNames();
		while(en.hasMoreElements()) {
			String headerName = en.nextElement();
			String headerValue = request.getHeader(headerName);
	%>
		<%= headerName %> : <%= headerValue %> <br/>
	<%
		}
	%>
	<hr>
	 클라이언트 IP : <%=request.getRemoteAddr() %><br>
	 요청 정보 길이 : <%= request.getContentLength() %><br>
	 요청 정보 인코딩 : <%= request.getCharacterEncoding() %><br>
	 요청 정보 콘텐츠 유형 : <%= request.getContentType() %><br>
	 요청 정보 프로토콜 :  <%= request.getProtocol() %><br>
	 요청 정보 전송방식 : <%= request.getMethod() %><br>
	 요청 URI : <%= request.getRequestURI() %><br>
	콘텍스트 경로 : <%= request.getContextPath() %><br>
	 서버 이름 : <%= request.getServerName() %><br>
	 서버 포트 : <%= request.getServerPort() %><br>
	 쿼리문 : <%= request.getQueryString() %><br>
	
</body>
</html>