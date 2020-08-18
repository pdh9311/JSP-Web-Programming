<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
	<h2>Scripting Tag</h2>
	
	<%-- 선언문 태그는 자바 변수나 메소드를 정의하는데 사용하는 태그로써 
		*_jsp.java 파일로 변환 되었을 때 선언부에 해당하며 클래스의 필드(=멤버변수,전역변수)와 메소드로 작성된다. --%>
	<%!	int count = 3;
	
	String makeItLower(String data) {
		return data.toLowerCase();
	}
	%>
	
	
	<%-- 스크립틀릿 태크는 자바 로직 코드를 작성하는데 사용하는 태그로써
		 *_jsp.java 파일로 변환 되었을 때 처리부에 해당하며 _jspService()메소드의 내부에 작성된다.  --%>
	<%	
		for(int i=1; i<= count; i++) {
			out.println("Java Server Pages " + i + ".<br/>");
		}
	%>
	
	<%-- 표현문 태그는 변수, 계산식, 메소드 호출 결과를 "문자열 형태"로 출력하는데 사용하는 태그로써 
		 *_jsp.java 파일로 변환 되었을때 출력부에 해당하며 _jspService()메소드의 내부에 out.print()메소드의 매개값으로 들어간다.
		 따라서 표현문 태그안에 세미콜론(;)을 작성해서는 안된다. --%>
	<%= makeItLower("Hello World") %>
</body>
</html>