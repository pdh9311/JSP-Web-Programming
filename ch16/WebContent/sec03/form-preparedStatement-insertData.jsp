<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL</title>
</head>
<body>
	<form action="jdbc-preparedStatement-insert.jsp" method="post">
		<input type="text" name="id" placeholder="아이디" /> <br>
		<input type="password" name="pw" placeholder="비밀번호" /> <br>
		<input type="text" name="name" placeholder="이름"	 /> <br>
		<input type="submit" value="전송" />
	</form>
	<a href ="jdbc-preparedStatement-select.jsp">데이터 검색</a>
	<a href ="jdbc-preparedStatement-delete.jsp">데이터 삭제</a>
	<a href ="form-preparedStatement-updateData.jsp">데이터 수정</a>
</body>
</html>