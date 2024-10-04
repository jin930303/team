<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#nicknamecheck1").click(function() {
			var nickname = $("#nickname").val();
			$.ajax({

				type : "post",
				url : "nicknamecheck2",
				data : {
					"nickname" : nickname
				},
				async : true,
				success : function(data) {
					if (data == "ok") {
						alert("사용 가능한 닉네임입니다.")
					} else {
						alert("이미 사용중인 닉네임입니다.")
					}
				}
			});
		});
	});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="memberupdate2" method="post">
		<table border="6" align="center" width="auto">
			<caption>수정화면</caption>
			<tr>
				<td><input type="text" name="id" id="id" readonly
					value="${updateview.id}"></td>
			</tr>
			<tr>
				<td><input type="password" name="pw" id="pw"
					placeholder="비밀번호를 입력해주세요" ></td>
			</tr>
			<tr>
			<td><input type="text" name="name" id="name" placeholder="이름을 입력해주세요"></td>
	</tr>
	<tr>
			<td>
			<input type="hidden" name="gender" value="${updateview.gender}" id="gender">
			</td>
	</tr>
			<tr>
				<td><input type="text" name="nickname" id="nickname"
					placeholder="닉네임을 입력해주세요" value="${updateview.nickname}"> <input
					type="button" name="nicknamecheck" id="nicknamecheck1"
					value=" 중복확인"></td>
			</tr>
			<tr>
				<td><input type="date" name="birth" id="birth" value="${updateview.birth}"></td>
			</tr>
			<tr>
				<td>010-<input type="text" name="phone1" id="phone1" va>-<input
					type="text" name="phone2" id="phone2">
				</td>
			</tr>
			<tr>
				<td><input type="text" name="address" id="address"
					placeholder="주소를 입력해주세요"></td>
			</tr>
			<tr>
				<td><input type="text" name="fdomain" id="domain-txt">@
					<select class="box" id="domain-list" name="bdomain">
						<option value="naver.com">naver.com</option>
						<option value="google.com">google.com</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="nate.com">nate.com</option>
						<option value="kakao.com">kakao.com</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정" >
					<input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>