<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<title>게시판 목록</title>
</head>
<body>
	<%@ include file="/menu.jsp" %>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>

	<div class="container">
		<form action="boardListPage.do" method="post">
			<div>
				<div class="text-rigth">
					<span class="badge badge-success">전체 ${totalCount}건</span>				
				</div>
			</div>
			<div style="padding-top:50px">
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
						<th>글쓴이</th>
					</tr>
					<c:choose>
						<c:when test="${!empty boardList}">
							<c:forEach var="n" items="${boardList}">
								<tr>
									<td>${n.getNum()}</td>
									<td><a href="/boardViewPage.do?num=${n.getNum()}&pageNum=${pageNum}">${n.getSubject()}</a></td>	
									<td>${n.getRegist_day()}</td>
									<td>${n.getHit()}</td>
									<td>${n.getName()}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">작성된 게시물이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
			<div align="center">
				<c:set var="pageNum" value="${pageNum}"/>
				<c:forEach var="j" begin="1" end="${totalPage}">
					<a href="boardListPage.do?pageNum=${j}">
						<c:choose>
							<c:when test="${pageNum == i}">
								<font color='4C5317'><b>[${j}]</b></font>
							</c:when>
							<c:otherwise>
								<font color='4C5317'>[${j}]</font>
							</c:otherwise>
						</c:choose>
					</a>
				</c:forEach> 
			</div>
			<div align="left">
				<table width="100%">
					<tr>
						<td width="50%" align="left">&nbsp;&nbsp;
						<select name="items" class="txt">
							<option value="subject">제목에서</option>
							<option value="content">본문에서 </option>
							<option value="name">글쓴이에서</option>
						</select>
						<input type="text" name="text" />
						<input type="submit" id="btnAdd" class="btn btn-primary" value="검색" />
						</td>
						<td width="50%" align="right">
							<c:set var="sessionId" value="${sessionScope.sessionId}" />
							<%-- onclick속성의 값으로 return false에 의미는 a태그의 href로 이동하는 액션을 취하지 않겠단 의미 --%>
							<a href="#" onclick="checkForm(); return false;" class="btn btn-primary">&laquo; 글쓰기</a>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<hr>
	</div>
	<%@ include file="/footer.jsp" %>
	<script>
		function checkForm() {
			if(${sessionId == null}) {
				alert("로그인 해주세요.");
				return false;
			} else {
 				location.href="/boardWritePage.do?id=${sessionId}";
			}
		}
	</script>
</body>
</html>