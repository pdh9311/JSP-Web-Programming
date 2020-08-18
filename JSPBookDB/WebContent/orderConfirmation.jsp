<%@page import="jspbook.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<title>주문 정보</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String cartId = session.getId();
	
	String shipping_cartId = "";
	String shipping_name = "";
	String shipping_shippingDate = "";
	String shipping_country = "";
	String shipping_zipCode = "";
	String shipping_addressName = "";

	Cookie[] cookies = request.getCookies();
	
	if(cookies != null) {
		for(int i=0; i<cookies.length;i++) {
			String cookieName = cookies[i].getName();
			if(cookieName.equals("Shipping_cartId")) {
				shipping_cartId = URLDecoder.decode(cookies[i].getValue(),"utf-8");
			}
			if(cookieName.equals("Shipping_name")) {
				shipping_name = URLDecoder.decode(cookies[i].getValue(),"utf-8");
			}
			if(cookieName.equals("Shipping_shippingDate")) {
				shipping_shippingDate = URLDecoder.decode(cookies[i].getValue(),"utf-8");
			}
			if(cookieName.equals("Shipping_country")) {
				shipping_country = URLDecoder.decode(cookies[i].getValue(),"utf-8");
			}
			if(cookieName.equals("Shipping_zipCode")) {
				shipping_zipCode = URLDecoder.decode(cookies[i].getValue(),"utf-8");
			}
			if(cookieName.equals("Shipping_addressName")) {
				shipping_addressName = URLDecoder.decode(cookies[i].getValue(),"utf-8");
			}
		}
	}
%>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">주문 정보</h1>
		</div>
	</div>
	
	<div class="container col-9 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong> <br> 
				성명 : <% out.print(shipping_name); %> <br>
				우편번호 : <% out.print(shipping_zipCode); %> <br>
				주소 : <% out.print(shipping_addressName); %> (<% out.print(shipping_country); %>) <br>
			</div>
			<div class="col-4" align="right">
				<p> <em>배송일 : <% out.print(shipping_shippingDate); %></em>				
			</div>
		</div>
		<div>
			<table class="table table-hover">
			<tr>
				<th class="text-center">도서</th>
				<th class="text-center">#</th>
				<th class="text-center">가격</th>
				<th class="text-center">소계</th>
			</tr>
			<%
				double sum = 0;
				ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartList");
				if(cartList == null) {
					cartList = new ArrayList<Product>();
				}
				for(int i=0;i<cartList.size();i++){
					Product product = cartList.get(i);
					double total = product.getUnitPrice() * product.getQuantity();
					sum += total;
			%>
			<tr>
				<td class="text-center"><em><%=product.getPname() %></em></td>
				<td class="text-center"><%=product.getQuantity() %></td>
				<td class="text-center"><%=product.getUnitPrice() %>원</td>
				<td class="text-center"><%=total %>원</td>
			</tr>
			<%
				}
			%>
			<tr>
				<td></td>
				<td></td>
				<td class="text-right"><strong>총액:</strong></td>
				<td class="text-center text-danger"><strong><%=sum %></strong>
			</tr>
			</table>
			
			<a href="./shippingInfo.jsp?cartId=<%=shipping_cartId %>" class="btn btn-secondary" role="button">이전</a>
			<a href="./thankCustomer.jsp" class="btn btn-success" role="button">주문 완료</a>
			<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>