<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="logincheck" method="post">
<table border="6" align="center">
	<tr>
		<td><input type="text" name="id" placeholder="아이디를 입력해주세요"></td>
	</tr>
	<tr>
		<td><input type="password" name="pw" placeholder="비밀번호를 입력해주세요"></td>
	</tr>
	<tr>
		<td><input type="submit" value="로그인" ></td>
	</tr>
</table>
<table align="center">
<tr>
<th colspan="2">
<input type="button" value="아이디 찾기" onclick="location.href='findmyid'">
<input type="button" value="비밀번호 찾기" onclick="location.href='findmypw'">
</th>
</tr>

</table>
</form>
</body>
</html>