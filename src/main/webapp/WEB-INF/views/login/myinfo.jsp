<%@page import="com.mbc.team.login.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<link href="./css/login/myinfo.css" rel="stylesheet"/> 
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
<div class="flex_container">

	<div class="sidebar_container">
		<div class="sidebar_title"><h2>MYPAGE</h2></div>
		<aside class="sidebar">
			<ul>
				<li><a href="myinfo">마이페이지</a></li>
				<li><a href="cart">장바구니</a></li>
				<li><a href="like_product">관심상품</a></li>
				<li><a href="update?id=${dto1.id}">회원정보 수정</a></li>
				<li><a href="delete?id=${dto1.id}&pw=${dto1.pw}">회원탈퇴</a></li>
			</ul>
		</aside>
	</div>
	
	<main class="main-container">
		<div class="title">
			<h1>" ${dto1.nickname} " 님의 회원정보</h1>
		</div>
		<div class="table-container">
			<table>
			    <input type="hidden" name="pw" value="${dto1.pw}">
			    <tr>
			        <th>회원등급</th>
			        <td><%=grade%></td>
			    </tr>
			    <tr>
			        <th>닉네임</th>
			        <td>${dto1.nickname}</td>
			    </tr>
			    <tr>
			        <th>주소</th>
			        <td>${dto1.address}입</td>
			    </tr>
			    <tr>
			        <th>핸드폰 번호</th>
			        <td>${dto1.phone}</td>
			    </tr>
			    <tr>
			        <th>이메일</th>
			        <td>${dto1.email}</td>
			    </tr>
			    <!-- <td colspan="2" class="btn-container"> -->
			    <tr>
			    	<td colspan="2">
			    		<div class="submitbutton">
				            <input type="button" class="button1" value="메인으로" onclick="location.href='main'"> 
			        	</div>
			        </td>
			    </tr>
			</table>
		</div>
	</main>
</div>
</body>
</html>
