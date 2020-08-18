<%@page import="java.util.ArrayList"%>
<%@page import="jspbook.Product"%>
<%@page import="jspbook.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
	String id = request.getParameter("id");

	// id가 null이거나 없을 경우 페이지 이동
	/*
	if(id == null || id.trim().equals("")) {
		 response.sendRedirect("products.jsp");
		 return;
	}
	*/
	ProductRepository dao = ProductRepository.getInstance();
	
	// id가 일치하는 상품이 없을 경우 페이지 이동
	/*
	Product product = dao.getProductById(id);
	if(product == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	*/
	// 상품리스트에서 id가 일치하는 상품을 찾아 상품 객체 생성	
	ArrayList<Product> goodsList = dao.getpList();
	Product goods = new Product();
	for(int i=0; i<goodsList.size(); i++) {
		goods = goodsList.get(i);
		if(goods.getProductId().equals(id)) {
			break;
		}
	}
	
	ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartList");
	if(cartList == null) {
		cartList = new ArrayList<Product>();
		session.setAttribute("cartList", cartList);
	}
	
	int cnt = 0;
	
	Product goodsQnt = new Product();
	for(int i=0; i<cartList.size();i++){
		goodsQnt = cartList.get(i);
		if(goodsQnt.getProductId().equals(id)){
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}

	if(cnt == 0) {
		goods.setQuantity(1);
		cartList.add(goods);
	}
	
	response.sendRedirect("product.jsp?id="+id);
%>