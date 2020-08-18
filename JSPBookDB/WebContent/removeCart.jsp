<%@page import="java.util.ArrayList"%>
<%@page import="jspbook.Product"%>
<%@page import="jspbook.ProductRepository"%>
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
		String id = request.getParameter("id");
		if(id == null || id.trim().equals("")){
			response.sendRedirect("cart.jsp");
			return;
		}
		
		ProductRepository dao = ProductRepository.getInstance();
		
		Product product = dao.getProductById(id);
		if(product == null) {
			response.sendRedirect("exceptionNoProductId.jsp");
		}
		
		// 세션에서 id가 일치하는 정보를 제거
		ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartList");
		Product goodsQnt = new Product();
		for(int i=0; i<cartList.size();i++){
			goodsQnt = cartList.get(i);
			if(goodsQnt.getProductId().equals(id)){
				cartList.remove(goodsQnt);
			}
		}
		
		response.sendRedirect("cart.jsp");
	%>
</body>
</html>