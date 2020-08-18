<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 로케일 설정 setLocale 태그 --%>
	<%=response.getLocale() %>

	<fmt:setLocale value="ja" />
	<p> <%=response.getLocale() %>

	<fmt:setLocale value="en" />
	<p> <%=response.getLocale() %>
	
	<fmt:setLocale value="ko" />
	<p> <%=response.getLocale() %>
<hr>
	<%-- requestEncoding 태그 --%>
	<form action="#" method="post">
		<p> 아이디 <input type="text" name="id" />
		<input type="submit" value="전송"	/>
	</form>
	
	<fmt:requestEncoding value="euc-kr"	/>
	<%= "요청 파라미터 : " + request.getParameter("id") %>
<hr>
	
	<%-- bundle 태그, message 태그 --%>
	<fmt:bundle basename="resourceBundle.message">
		<p> <fmt:message key="name" />
			<fmt:message key="hello" var="msg" />
		<p>${msg}
	</fmt:bundle>
<hr>
		
	<%-- setBundle 태그 : var의 값을 이용해서 JSP페이지 어디서나 사용할 수 있게 된다. --%> 
	<fmt:setBundle basename="resourceBundle.message" var="message"/>
	<p> <fmt:message bundle="${message}" key="name" />
		<fmt:message bundle="${message}" key="hello" var="msg" />
	<p>${msg}
	
	<fmt:setLocale value="en" />
	<p> <fmt:message bundle="${message}" key="name" />
		<fmt:message bundle="${message}" key="hello" var="msg" />
	<p>${msg}
<hr>
	
	<%-- formatNumber 태그 --%>
	<p>숫자 : <fmt:formatNumber value="12345.67" />
	<p>숫자 : <fmt:formatNumber value="12345.67" type="number" />
	<p>숫자 : <fmt:formatNumber value="12345.67" type="number" minIntegerDigits="10" minFractionDigits="3"/>
	<p>숫자 : <fmt:formatNumber value="12345.67" type="number" groupingUsed="false" />
	<p>통화 : <fmt:formatNumber value="12345.67" type="currency" currencySymbol="$" />
	<p>퍼센트 : <fmt:formatNumber value="0.55" type="percent" />
	<p>패턴(.0000): <fmt:formatNumber value="12345.67" pattern=".0000" type="number" />
	<p>패턴(#,##0.0): <fmt:formatNumber value="12345.67" pattern="#,##0.0" type="number" />
<hr>
	 
	<%-- parseNumber 태그 --%>
	<p>패턴(없음) : <fmt:parseNumber value="12345.67" />
	<p>패턴(0000.000) : <fmt:parseNumber value="12345.67" pattern="0000.000"/>
	<p>패턴(####.###) : <fmt:parseNumber value="12345.67" pattern="####.###"/>
<hr>
	
	<%-- formatDate 태그 --%>
	<jsp:useBean id="now" class="java.util.Date" />
	<p> date 형식 : <fmt:formatDate value="${now}" type="date" />
	<p> time 형식 : <fmt:formatDate value="${now}" type="time" />
	<p> both 형식 : <fmt:formatDate value="${now}" type="both" pattern="yyyy-MM-dd HH:mm:ss "/>
	<%-- parseDate 태그 --%>
	<p> <fmt:parseDate value="20200728" pattern="yyyyMMdd" var="date"/>
	<p> <fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />
<hr>
	
	<%-- timeZone 태그 : 시간대별로 시간을 처리 --%>
	<p> 한국 : <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/>
	<p> <fmt:timeZone value="GMT-8">
		뉴욕1 : <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/>
		</fmt:timeZone> 
	<p> <fmt:timeZone value="America/New_York">
		뉴욕2 : <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/>
		</fmt:timeZone> 
	<p> <fmt:timeZone value="GMT">
		런던1 : <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/>
		</fmt:timeZone> 
	<p> <fmt:timeZone value="Europe/London">
		런던2 : <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/>
		</fmt:timeZone> 
<hr>
	<%-- setTimeZone 태그 : 특 --%>
	<p> 한국 : <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/>
	<p> <fmt:setTimeZone value="GMT-8" />
		뉴욕 : <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/>
	<p> <fmt:setTimeZone value="GMT" />
		런던 : <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss"/>
</body>
</html>