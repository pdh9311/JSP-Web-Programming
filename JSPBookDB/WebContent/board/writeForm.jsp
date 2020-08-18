<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<title>게시글 작성</title>
</head>
<body>
	<%@ include file="/menu.jsp" %>	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<div class="container">
		
		<form name="newWrite" action="/boardWriteAction.do" method="post" class="form-horizontal" onsubmit="return checkForm()">
			<input name="id" type="hidden" class="form-control" value="${sessionScope.sessionId}" />
			<div class="form-group row">
				<label class="col-sm-2 control-label">성명</label>
				<div class="col-sm-3">
					<input name="name" type="text" class="form-control" value="${name}" placeholder="name" readonly/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">
					<input name="subject" type="text" class="form-control"  placeholder="subject"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-8">
					<textarea name="content" cols="50" rows="5" class="form-contorl" placeholder="content"></textarea>
				</div>
			</div>
			<div class="form-gorup row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록" />
					<input type="reset" class="btn btn-primary" value="취소" />
				</div>
			</div>			
		</form>
	</div>
	<%@ include file="/footer.jsp" %>
	<script>
		function checkForm() {
			if(!document.newWrite.subject.value) {
				alert("제목을 입력하세요.");
				return false;
			}
			if(!document.newWrite.content.value) {
				alert("내용을 입력하세요.");
				return false;
			}
		}
	</script>
</body>
</html>