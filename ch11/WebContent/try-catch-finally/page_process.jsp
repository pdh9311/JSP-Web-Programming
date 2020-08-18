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
		try {
			int num1 = Integer.parseInt(request.getParameter("num1"));
			int num2 = Integer.parseInt(request.getParameter("num2"));
			out.print("결과 값 : " + num1/num2);
		} catch(Exception e) {
			// RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
			// dispatcher.forward(request, response);
	%>
			<jsp:forward page="error.jsp" />
	<%
		} 
	%>
</body>
</html>