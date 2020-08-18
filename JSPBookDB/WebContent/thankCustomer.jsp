<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
<%
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";
	
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			String cookieName = cookies[i].getName();
			if(cookieName.equals("Shipping_cartId")) {
				shipping_cartId = URLDecoder.decode(cookies[i].getValue(),"utf-8");
			}
			if(cookieName.equals("Shipping_shippingDate")) {
				shipping_shippingDate = URLDecoder.decode(cookies[i].getValue(),"utf-8");
			}
		}
		
	}
%>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 완료</h1>
		</div>
	</div>
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p> 주문은 <% out.print(shipping_shippingDate); %>에 배송될 예정입니다!
		<p> 주문번호 : <% out.print(shipping_cartId); %>
	</div>
	<div class="container">
		<p> <a href="./products.jsp" class="btn btn-secondary">&laquo; 상품 목록</a>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>
<%
	session.invalidate();

	for(int i=0;i<cookies.length;i++) {
		String cookieName = cookies[i].getName();
		if(cookieName.equals("Shipping_cartId")){
			cookies[i].setMaxAge(0);
		}
		if(cookieName.equals("Shipping_name")){
			cookies[i].setMaxAge(0);
		}
		if(cookieName.equals("Shipping_shippingDate")){
			cookies[i].setMaxAge(0);
		}
		if(cookieName.equals("Shipping_country")){
			cookies[i].setMaxAge(0);
		}
		if(cookieName.equals("Shipping_zipCode")){
			cookies[i].setMaxAge(0);
		}
		if(cookieName.equals("Shipping_addressName")){
			cookies[i].setMaxAge(0);
		}
		response.addCookie(cookies[i]);
	}
	
%>
