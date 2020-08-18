<%-- 현재 JSP 페이지에서 사용할 프로그래밍 언어를 설정하는데 사용 --%>
<%@ page language="java" %>

<%-- contentType의 charset과 pageEncoding의 차이
	charset : 웹 브라우저가 받아볼 페이지의 인코딩 방식 | pageEncoding : 작성한 현재 JSP페이지의 인코딩방식  --%>
	
<%-- 현재 JSP 페이지의 contentType으로 text/html을 설정하였고, 응답 JSP 페이지의 문자열 세트(charset)을 설정 --%>
<%@ page contentType="text/html; charset=UTF-8" %>

<%-- 현재 JSP 페이지의 문자 인코딩 유형을 설정--%>
<%@ page pageEncoding="UTF-8" %>

<%-- import 속성은 JSP페이지에서 자바 클래스를 사용할때 설정하며, 여러 클래스를 포함할 경우 쉼표(,)로 구분한다. --%>
<%@ page import="java.util.*, java.lang.*, java.io.*" %>

<%-- session 속성은 기본값이 true이며, 현재 페이지에서 JSP 내장객체인 session변수를 사용할 수 있고, 세션을 유지관리 할 수 있습니다.
	 session 속성은 기본값이 false이며, 현재 페이지에서 JSP 내장객체인 session변수를 사용할 수 없고, 세션을 유지관리 할 수 없습니다.  --%>
<%@ page session="false" %>

<%-- 현재 JSP 페이지의 출력 버퍼 크기를 설정하는데 사용
	 기본값은 일반적으로 8KB이며, none일 경우 출력 버퍼를 채우지 않고 웹 브라우저로 직접 보내게 된다.
	 만약 버퍼크기를 32KB로 했다면 페이지가 완료되는 경우나 출력이 명확하게 되는 경우를 제외하고는 출력 내용이 최소한 32KB 누적될 때까지 웹 브라우저로 전송되지 않는다. --%>
<%@ page buffer="none" %>

<%-- 자동으로 출력 버퍼를 비우는 것을 제어하는데 사용
	 기본값은 true이며, 출력버퍼가 채워질 때마다 자동으로 웹 브라우저로 보내고 버퍼를 비운다.
	 false인 경우, 출력버퍼가 채워질 때 버퍼 오버플로의 예외를 발생 시킴 --%>
<%@ page autoFlush="true" %>

<%-- 현재 JSP 페이지에서 멀티스레드의 동작을 제어하는데 사용
	 기본값은 true이며, 페이지에 대해 수신된 여러 요청이 동시에 처리된다.
	 false인 경우, JSP페이지에 대한 요청이 순차적으로 처리된다. --%>
<%@ page isThreadSafe="true" %>

<%-- JSP페이지에 대한 설명을 설정하는데 사용하며, 개발자가 페이지의 기능을 이해하는데 도움을 준다. (주석기능과 같음) --%>
<%@ page info="JSP Home Page" %>

<%-- 현재 JSP페이지가 실행되는 동안 오류가 발생하면 특정 오류 페이지로 이동하는데 사용 --%>
<%@ page errorPage="errorPage.jsp" %>

<%-- 현재 JSP 페이지가 오류 페이지인지 여부를 설정
	 기본값은 false이며, true로설정하면 현재 JSP페이지는 오류 페이지가 된다. --%>
<%@ page isErrorPage="false" %>

<%-- 현재 JSP 페이지의 표현언어(expression language)사용 여부를 설정
	 기본값은 false이며 표현언어의 표현식"${}"을 사용할 수 있다.
	 true인 경우, 표현식을 처리할 수 없기 때문에 텍스트로 처리된다.  --%>
<%@ page isELIgnored="true" %>

<%-- 스크립트 태그의 사용 여부를 설정
	 true일 경우 스크립트 태그 사용 가능, false일 경우 스크립트 태그 사용 불가능 --%>
<%@ page isScriptingEnabled = "true" %>

<!DOCTYPE html>
<html>
<head>
<title>Directive Tag</title>
</head>
<body>
	<h2>contentType 디렉티브 태그</h2>
	<h4>text/html : HTML 출력</h4>
	
	<%-- 디렉티브 태그의 import속성에 (java.text.*)추가하지 않았을 경우 패키지명을 포함한 클래스명으로 작성할 수 있다. --%>
	Today is = <%= new Date() %> <br/>
	<%
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd(E) HH:mm:ss");
		String now = sdf.format(new java.util.Date());
		out.print("Today is = " + now);
	%>
</body>
</html>