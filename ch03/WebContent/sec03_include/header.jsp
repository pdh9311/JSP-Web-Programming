<%@ page contentType="text/html; charset=UTF-8" %>

<h3>머리글 페이지 영역 입니다.</h3>
<%! int count = 0;

	public void addCount() {
		count++;
	}
%>
<% addCount(); %>

<p><%= count %> 번째 새로고침 중</p>
