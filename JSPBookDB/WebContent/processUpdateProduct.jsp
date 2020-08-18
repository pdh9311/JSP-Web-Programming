<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%

	String filePath = "D:\\SW PDH\\JSP Web Programming\\JSPBookDB\\WebContent\\resources\\image\\";
	MultipartRequest multi = new MultipartRequest(request,filePath,5*1024*1024,"utf-8",new DefaultFileRenamePolicy());
	
	String productId = multi.getParameter("productId");
	String pname = multi.getParameter("pname");
	double unitPrice = Double.parseDouble(multi.getParameter("unitPrice"));
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	long unitsInStock = Long.parseLong(multi.getParameter("unitsInStock"));
	String condition = multi.getParameter("condition");
	String fileName = multi.getFilesystemName("productImage");	

	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from product where p_id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	rs = pstmt.executeQuery();
	
	if (rs.next()){ 
		if(fileName != null){
			sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_manufacturer=?, p_category=?, p_unitsInStock=?, p_condition=?, p_fileName=? WHERE p_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,pname);
			pstmt.setDouble(2, unitPrice);
			pstmt.setString(3,description);
			pstmt.setString(4,manufacturer);
			pstmt.setString(5,category);
			pstmt.setLong(6,unitsInStock);
			pstmt.setString(7,condition);
			pstmt.setString(8,fileName);
			pstmt.setString(9,productId);
			pstmt.executeUpdate();
		} else {
			sql = "UPDATE product SET p_name=?, p_unitPrice=?, p_description=?, p_manufacturer=?, p_category=?, p_unitsInStock=?, p_condition=? WHERE p_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,pname);
			pstmt.setDouble(2, unitPrice);
			pstmt.setString(3,description);
			pstmt.setString(4,manufacturer);
			pstmt.setString(5,category);
			pstmt.setLong(6,unitsInStock);
			pstmt.setString(7,condition);
			pstmt.setString(8,productId);
			pstmt.executeUpdate();
		}
	}
	if(rs !=null) { rs.close(); }
	if(pstmt != null) { pstmt.close(); }
	if(conn != null) { conn.close(); }
	
	response.sendRedirect("editProduct.jsp?edit=update");
%>