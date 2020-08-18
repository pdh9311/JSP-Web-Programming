<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<title>게시글</title>
</head>
<body>
	<%@ include file="/menu.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<c:set var="userId" value="${board.getId()}" />
	
	<div class="container">
		<form name="newUpdate" action="boardUpdateAction.do?num=${board.getNum()}&pageNum=${nowPage}" class="form-horizontal" method="post">
			<div class="form-group row">
				<label class="col-sm-2 control-label">성명</label>
				<div class="col-sm-3">
					<input name="name" class="form-control" value="${board.getName()}" readonly/>
				</div> 
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-8" style="word-break: break-all;">
					<input name="subject" class="form-control" value="${board.getSubject()}" <c:if test="${sessionId !=  userId}"><c:out value="readonly" /></c:if>/>
				</div> 
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-8" style="word-break: break-all;">
					<textarea name="content" class="form-control" cols="50" rows="5" <c:if test="${sessionId !=  userId}"><c:out value="readonly" /></c:if>>${board.getContent()}</textarea>
				</div> 
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<c:if test="${sessionId == userId}">
						<p>
							<a href="/boardDeleteAction.do?num=${board.getNum()}&pageNum=${nowPage}" class="btn btn-danger">삭제</a>
							<input type="submit" class="btn btn-success" value="수정" />
					</c:if>
					<a href="/boardListPage.do?pageNum=${nowPage}" class="btn btn-primary">목록</a>
				</div>
			</div>
		</form>
		<hr>
	</div>	
	<%@ include file="/footer.jsp" %>
</body>
</html>