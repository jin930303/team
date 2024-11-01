<%@page import="com.mbc.team.login.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>

<style type="text/css">
/* 목차+게시판 컨테이너 */
.flex_container {
	width: 100%;
	display: flex;
	justify-content: center;
	margin: 0 auto;
}

.sidebar {
	width: 250px;
	border: 1px solid #ddd;
	border-top: none; /* 타이틀과 경계선 중복 방지 */
	padding: 20px;
    margin-right: 20px;
    border-bottom-right-radius: 10px;
    border-bottom-left-radius: 10px;
	
}
.sidebar_container {
	width: 250px;
    display: block; /* 상하로 정렬 */
    margin-right: 60px; /* 오른쪽에 여백 */
}

/* 상단 타이틀 부분 */
.sidebar_title {
    background-color: #be241c; /* 상단 배경색 */
    padding: 60px;
    text-align: center;
    border: 2px thin #303030;
    border-top-right-radius: 10px;
    border-top-left-radius: 10px;
}

/* 타이틀 내부 h2 스타일링 */
.sidebar_title h2 {
    margin: 0;
    color: white;
    font-weight: bold;
    font-size: 22px;
}

/* 목차 링크의 리스트 스타일 없애면 리스트별 . 생김 */
.sidebar ul {
	list-style: none;
	padding: 0;
	margin-bottom: 30px;
}

/* 목차 리스트 사이 간격 */
.sidebar ul li {
	margin-bottom: 15px;
	
}

/* 목차 리스트 별 버튼 모양 */
.sidebar ul li a {
	text-decoration: none;
	color: #333;
	font-size: 14px;
	display: block;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	transition: border 0.3s ease; /* 테두리 변경 시 부드러운 전환 */
	transition: font 0.3s ease;
	transition: background-color 0.3s ease;
}

.sidebar ul li a:hover {
	background-color: #f9f4f4;
	font-weight: bold;
	color: black;
}
</style>

 <!-- 메인 섹션 -->
<style type="text/css">
/* 메인 컨테이너 */
.main-container {
    flex: 1;
    max-width: 1100px;
    padding: 20px 60px;
    border-right: 1px solid #ddd;
    border-left: 1px solid #ddd;
}
table {
    width: 100%;
    margin-top: 10px;
    border-collapse: collapse;
    text-align: center;
}

.title h1 {
    text-align: left;
	padding: 30px;
	border-bottom: 2px solid #be241c;
}

table tr {
    padding: 28px;
    border-bottom: 1px solid #ddd;
}

table tr:last-child {
    border-bottom: none;
}

table tr th, 
table tr td {
    padding: 14px;
    text-align: center;
    vertical-align: middle;
    border: none;
    font-size: 16px;
}

th {
    font-weight: 600;
}

/* 버튼 스타일 */
input[type="button"] {
    padding: 12px 20px;
    font-size: 14px;
    color: white;
    background-color: #be241c;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    margin-right: 10px;
    transition: background-color 0.3s ease;
}

input[type="button"]:hover {
    background-color: #8e1a14;
}

.submitbutton {
	text-align: center;
}

</style>
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
