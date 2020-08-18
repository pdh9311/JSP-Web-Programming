<%@page import="ch05.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<jsp:useBean id="productR" class="ch05.ProductRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<title>상품 정보</title>
</head>
<body>
	
	<%@ include file="menu.jsp" %>
	
	<div class ="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	
	<%
		String id = request.getParameter("id");
		Product product = productR.getProductById(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3><%=product.getPname() %></h3>
				<p> <%=product.getDescription() %>
				<p><b>상품 코드 : </b> <span class="badge badge-danger"><%=product.getProductId() %></span>
				<p><b>제조사</b> : <%=product.getManufacturer() %>
				<p><b>분류</b> : <%=product.getCategory() %>
				<p><b>재고 수</b> : <%=product.getUnitsInStock() %>
				<h4><%=product.getUnitPrice() %>원</h4>
				<p><a href="#" class="btn btn-info" role="button">상품 주문 &raquo;</a>
				<a href="./products.jsp" class="btn btn-secondary" role="button">상품 목록 &raquo;</a></p>
			</div>
		</div>
		<hr>
	</div>
	<%@ include file="footer.jsp" %>
	
</body>
</html>