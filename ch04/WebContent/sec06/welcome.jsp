<%@page import="ch04.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<jsp:useBean id="productR" class="ch04.ProductRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<title>상품 목록</title>
</head>
<body>
	
	<%@ include file="menu.jsp" %>
	
	<div class ="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 목록</h1>
		</div>
	</div>
	
	<% ArrayList<Product> pList = productR.getpList(); %>
	
	<div class ="container">
		<div class="row" align="center">
			<%
				for(int i=0; i<pList.size(); i++) {
					Product product = pList.get(i);
			%>
			<div class="col-md-4">
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %>
				<p><%=product.getUnitPrice() %>원
			</div>
			<%
				}
			%>
		</div>
		<hr/>
	</div>
	
	<%@ include file="footer.jsp" %>
	
</body>
</html>