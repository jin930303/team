<%@page import="com.mbc.team.login.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String grade="";
	LoginDTO dto1=(LoginDTO)request.getAttribute("dto1");
	String grade_code=dto1.getGrade_code();
	
	if (grade_code.equals("004")) grade = "vvip";
	else if (grade_code.equals("003")) grade = "vip";
	else if (grade_code.equals("002")) grade = "우수회원";
	else grade = "일반회원";
	%>
	
	<table border="6" align="center">
		<caption>${dto1.nickname}님의회원정보</caption>
		<input type="hidden" name="pw" value="${dto1.pw}">
		<tr>
			<th>당신의 현재 등급은</th>
			<td><%=grade%>입니다.</td>
		</tr>
		<tr>
			<th>당신의 닉네임은</th>
			<td>${dto1.nickname}입니다.</td>
		</tr>
		<tr>
			<th>당신의 주소는</th>
			<td>${dto1.address}입니다.</td>
		</tr>
		<tr>
			<th>당신의 핸드폰 번호는</th>
			<td>${dto1.phone}입니다.</td>
		</tr>
		<tr>
			<th>당신의 이메일 주소는</th>
			<td>${dto1.email}입니다.</td>
		</tr>
		<tr>
			<td colspan="2">
			<input type="button" value="정보수정" onclick="location.href='update?id=${dto1.id}'"> 
			<input type="button" value="메인으로" onclick="location.href='main'"> 
			<input type="button" value="장바구니" onclick="location.href='cart'"> 
			
			</td>
			
		</tr>
	</table>
<input type="button" value="회원탈퇴" onclick="location.href='delete?id=${dto1.id}&pw=${dto1.pw}'">
</body>
</html>