<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Locale"%>
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
	// 로케일 감지 : 웹 브라우저에 설정된 국가와 언어 이름을 알아내는것.
	Locale locale = request.getLocale();
	String displayCountry = locale.getDisplayCountry();
	String country = locale.getCountry();
	String displayLanguage = locale.getDisplayLanguage();
	String language = locale.getLanguage();
	
	out.print("<p>" + Locale.getDefault() + "</p>"); 	// getDefault()메소드는 정적메소드이므로 인스턴스보다는 클래스로 접근한다.
	out.print("<p>로케일 국가 :" + displayCountry + "</p>");
	out.print("<p>로케일 국가 코드 :" + country + "</p>");
	out.print("<p>로케일 언어 :" + displayLanguage + "</p>");
	out.print("<p>로케일 언어 코드 :" + language + "</p>");
%>
<hr>
<%
	// 로케일 언어 설정
	response.setContentType("text/html");
	response.setHeader("Content-Language","es");	// 스페인 코드(es)
	String title = "Espa&ntilde;ol";
	out.print("<p> Idioma : Espa&ntilde;ol</p>");
	out.print("<p> &iexcl;Hola Mundo!</p>");
%>
<hr>
<%
	// 로케일 날짜와 시간 설정
	String date = DateFormat.getDateTimeInstance(DateFormat.FULL, DateFormat.SHORT, locale).format(new Date());
	out.print(date);
%>
<hr>
<%
	NumberFormat currency = NumberFormat.getCurrencyInstance(locale);	// 통화
	NumberFormat percentage = NumberFormat.getPercentInstance(locale);	// 비율
	NumberFormat digit = NumberFormat.getNumberInstance(locale);		// 숫자
	String fcurrency = currency.format(1234567);
	String fpercentage = percentage.format(0.25);
	String fdigit = digit.format(1234.567);
	out.print("<p>로케일 통화 형식 : " + fcurrency + "</p>");
	out.print("<p>로케일 비율 형식 : " + fpercentage + "</p>");
	out.print("<p>로케일 숫자 형식 : " + fdigit + "</p>");
%>
<hr>

</body>
</html>