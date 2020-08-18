<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Connection conn = null;

	try {
		String url = "jdbc:mysql://localhost:3306/jsp?useSSL=false";
		String user = "root";
		String password = "1234";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(url, user, password);
	} catch(Exception e) {
		out.print("데이터베이스 연결이 실패했습니다.<br>");
		out.print("Exception: " + e.getMessage());
	}
	
%>