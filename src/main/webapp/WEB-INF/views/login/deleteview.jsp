<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function confirmdelete(id){
	var pw=prompt("비밀번호를 입력해주세요:");
	if(pw!=null && pw.trim()!==""){
		if(confirm("정말로 삭제하겠습니까?")){
			location.href='delete2?id='+id+'&pw='+pw;
		}
	 	}else
			{
			alert("비밀번호를 입력해주세요");
			}
}

</script>
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

.title h1 {
    text-align: left;
	padding: 30px;
	border-bottom: 2px solid #be241c;
}

<style type="text/css">
/* 전체 버튼 컨테이너 */
.submitbutton {
    display: flex;
    width: 500px;
    height: 500px;
    margin: 0 auto; /* 화면 중앙 정렬 */
    border: 2px solid #ddd;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    overflow: hidden;
}

/* 리스트 및 리스트 항목 스타일 */
.submitbutton ul {
    display: flex;
    width: 100%;
    height: 100%;
    margin: 0;
    padding: 0;
    list-style: none;
}

.submitbutton li {
    width: 50%; /* 좌우 버튼 각각 절반 너비 */
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 10px;
}

/* 버튼 스타일 */
.submitbutton button {
    width: 100%;
    height: 400px;
    font-size: 16px;
    color: #aaaaaa;
    border: 1px solid #777777;
    border-radius: 5px;
    background-color: white;
    cursor: pointer;
    transition: border 0.1s ease;
}

.submitbutton button:hover {
    border: 3px solid #be241c;
    color: #be241c;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="flex_container">
	<div class="sidebar_container">
		<div class="sidebar_title"><h2>회원탈퇴</h2></div>
		<aside class="sidebar">
			<ul>
				<li><a href="myinfo">마이페이지</a></li>
				<li><a href="cart">장바구니</a></li>
				<li><a href="like_product">관심상품</a></li>
				<li><a href="update?id=${sessionScope.dto3.id}">회원정보 수정</a></li>
				<li><a href="delete?id=${sessionScope.dto3.id}&pw=${sessionScope.dto3.pw}">회원탈퇴</a></li>
			</ul>
		</aside>
	</div>
	
	<main class="main-container">
		<div class="title">
			<h1>" ${deleteview.nickname} " 님의 정보</h1>
		</div>
			<p><h2> 회원님의 현재 등급은 
				<strong>
					<c:choose>
			        	<c:when test="${grade_code == '004'}">vvip</c:when>
			            <c:when test="${grade_code == '003'}">vip</c:when>
			            <c:when test="${grade_code == '002'}">우수회원</c:when>
			            <c:otherwise>일반회원</c:otherwise>
					</c:choose>
				</strong>
				입니다.</h2>
			</p> 
					
					<!-- 
						<input type="button" value="삭제 하겠습니다." onclick="confirmdelete('${deleteview.id}')">
						<input type="button" value="삭제 하지않겠습니다." onclick="location.href='main'"> 
					 --> 
		<div class="submitbutton">
			<ul>
				<li>
					<button onclick="confirmdelete('${deleteview.id}')"> 
						<h1>삭제하겠습니다.</h1>
						<br>
						<br>
						<span>그동안 많은 관심주셔서 감사했습니다.</span>
						<br>
						<strong>회원탈퇴 완료</strong>
					</button>
				</li>
				<li>
					<button onclick="location.href='main'"> 
						<h1>삭제하지 않겠습니다.</h1>
						<br>
						<br>
						<span>앞으로도 더 나은 서비스를 제공하겠습니다.</span>
						<br>
						<strong>메인으로 돌아가기</strong>
					</button>
				</li>
			</ul>
		</div>
	</main>
</div>
</body>
</html>