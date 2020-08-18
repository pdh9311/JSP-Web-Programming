<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>validation</title>
</head>
<body>
	<form name="MemberJoinForm" id="form" action ="#" method="post">
		<table style="border:1px solid black">
			<tr><td colspan="3"><p>회원가입</p></td></tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" /></td>
				<td>* 5~15자리 영문, 숫자 조합</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" /></td>
				<td>* 8~16자리 영문,숫자,특수문자 조합</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" /></td>
				<td>* 한글</td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age" /></td>
				<td>* 숫자</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" name="phone1" size="1"/> - <input type="text" name="phone2" size="1"/> - <input type="text" name="phone3" size="1"/></td>
				<td></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email" /></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3"><input type="button" value="회원가입" onclick="checkForm()" /></td>
			</tr>
		</table>
	</form>
<script>
	function checkForm() {
		// 정규 표현식 검사
		
		// 영문 소문자 or 대문자로 시작하며 | 영문 소문자 or 대문자 or 숫자로 끝나는 5~15자리의 문자열
		var regExpId = /^[a-zA-Z]{1}[a-zA-Z0-9]{4,14}$/;	// var regExpId = new RegExp('/^[a-zA-Z]{1}[a-zA-Z0-9]{4,14}$/','g'); 와 같음
		
		/*	(?=여기)은 앞에 위치하는 표현식이 여기에 작성된 표현식에 일치하는 문자의 앞에 있어야 함을 의미
			. 임의의 한 문자
			* 0회 이상 연속으로 반복되는 문자와 가능한 많이 일치
			(?=.*[a-zA-Z])	→ 영문 소문자나 대문자를 적어도 1개 포함한다			
			(?=.*[!@#$%^*+=-]) ≒ (?=.*\W) → 특수문자를 적어도 1개 포함한다			
			(?=.*[0-9])	→ 숫자를 적어도 1개 포함한다	
			(?!.*\s) → 공백은 포함하지 않는다.
			.{8,16}	→ 8~16자리의 문자열		*/
		var regExpPw = /^(?=.*[a-zA-Z])(?=.*\W)(?=.*[0-9])(?!.*\s).{8,16}$/;
		var regExpName = /^[가-힣]*$/;
		var regExpAge = /^[0-9]*$/;
		var regExpPhone = /^(02\d{0}|01\d{1}|[0-9]{3})-\d{3,4}-\d{4}$/;
		var regExpEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;

		var form = document.MemberJoinForm;
		var id = form.id.value;
		var pw = form.pw.value;
		var name = form.name.value;
		var age = form.age.value;
		var phone = form.phone1.value + "-" + form.phone2.value + "-" +form.phone3.value;
		var email = form.email.value;
		
		if(!regExpId.test(id)){
			alert("적합하지 않은 아이디 입니다.");
			form.id.focus();
			return false;
		}else if(!regExpPw.test(pw)){
			alert("적절하지 않은 비밀번호 입니다.");
			form.pw.select();
			return false;
		}else if(!regExpName.test(name)){
			alert("이름은 한글만 입력해주세요");
			form.name.focus();
			return false;
		}else if(!regExpAge.test(age)){
			alert("나이는 숫자만 입력해주세요");
			form.age.focus();
			return false;
		}else if(!regExpPhone.test(phone)) {
			alert("연락처를 확인해 주세요");
			form.phone1.focus();
			return false;
		}else if(!regExpEmail.test(email)){
			alert("이메일을 확인해 주세요.");
			form.email.focus();
			return false;
		}else {
			alert("아이디: " + id + "\n" + "비밀번호: " + pw + "\n" + "이름: " + name + "\n" + "나이: " + age + "\n" + "연락처: " + phone + "\n" + "이메일: " + email);
		}
		form.submit();
	}	
</script>
</body>
</html>