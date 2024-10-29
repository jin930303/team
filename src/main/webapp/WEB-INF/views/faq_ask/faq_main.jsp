<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객센터</title>
<!-- 사이드바 -->
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
	/*border-bottom: 1px solid #be241c;*/
	background-color: #f9f4f4;
	font-weight: bold;
	color: black;
}
</style>
<!-- 메인 섹션 -->
<style type="text/css">
.main-container {
	flex: 1;
	/*width: 100%;*/
    max-width: 1100px;
    padding: 20px;
    padding-left: 60px;
    padding-right: 60px;
    border-right: 1px solid #ddd;  /*목차 - 게시판 사이 선*/
    border-left: 1px solid #ddd;  /*목차 - 게시판 사이 선*/
}

main h1{
	text-align: left;
}

table {
    width: 100%; /* 테이블 너비 100% */
    margin-top: 10px; /* 상단 간격 */
    border-collapse: collapse; /* 테이블 경계 겹치지 않도록 */
    text-align: center;
}

table tr th, 
table tr td {
    padding: 15px;
    text-align: center; /* 모든 셀의 정렬을 왼쪽으로 */
    vertical-align: middle; /* 수직 가운데 정렬 */
    border: none;
}

/* tr 사이 선*/
table tr{
	padding: 28px;
	border-bottom: 1px solid #ddd;
	transition: border-bottom 0.3s ease;
	transition: background-color 0.3s ease;
}

table tr:last-child {
	border-bottom: none;
}

/* 게시판 th td 배경 */
th {
	background-color: #f4f4f4;
}

table tbody tr:hover {
	background-color: #f9f4f4;
	border-bottom: 1.5px solid #be241c;
	cursor: pointer;
}
</style>

<!-- 검색 -->
<style type="text/css">


/* 검색 영역을 가운데에 배치하는 컨테이너 */
.search-bar {
	padding-top: 25px;
    display: flex;
    justify-content: center; /* 검색창을 가운데 정렬 */
    align-items: center;
    margin-bottom: 20px;
}

/* 검색 옵션 select 필드의 컨테이너 */
.search-container {
    display: flex;
    gap: 10px; /* select 필드 간의 간격 */
}

.search-container select {
	flex:1;
    width: 30%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    transition: border-color 0.3s ease;
}

.search-container select:hover {
    border-color: #be241c;
}

.search-container select:focus {
    border-color: #be241c;
}

.search-bar input[type="text"] {
	border: 1px solid #ddd;
	width: 45%;
	padding: 10px;
	border-radius: 4px;
	margin-left:10px;
	transition: border-color 0.3s ease;
}
.search-bar input[type="text"]:hover {
	border-color: #be241c;
}
.search-bar input[type="text"]:focus {
	border-color: #be241c;
}

/* 검색 버튼 */
.search-bar button {
    padding: 10px 20px;
    background-color: #be241c;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-left: 10px; /* 검색창과 버튼 사이의 간격 */
    transition: background-color 0.3s ease;
}

.search-bar button:hover {
    background-color: #8e1a14;
}
</style>

</head>
<body>
	<div class="flex_container">
		<!-- 사이드 메뉴바 -->
		<div class="sidebar_container">
			<div class="sidebar_title"><h2>고객센터 홈</h2></div>
			<aside class="sidebar">
				<ul>
					<li><a href="faq_community">고객센터 홈</a></li>
					<li><a href="gongjiboard">공지사항</a></li>
					<c:choose>
						<c:when test="${loginstate == true}">
							<li><a href="faqin">1:1 문의하기</a></li>
						</c:when>
					</c:choose>
					<li><a href="faqout">문의 내역</a></li>
					<li><a href="faq">FAQ</a></li>
				<c:choose>
					<c:when test="${adminloginstate == true}">
					<li><a href="FAQ_in">FAQ 글 쓰기</a></li>
					</c:when>
				</c:choose>
				</ul>
			</aside>
		</div>

		<!-- 메인 콘텐츠 -->
		<main class="main-container">
			<h1>FAQ - 자주 묻는 질문 BEST 10</h1>
		
		<!-- 검색 바 -->
			<form action="faq_main_serch" method="post" class="search-bar">
				<div class="search-container">
			    <!-- 기간 선택 -->
			    <select name="faqkey1" id="faqkey1">
				    <optgroup label="기간 선택">
				        <option value="1">1일</option>
				        <option value="7">1주일</option>
				        <option value="30">1개월</option>
				        <option value="90">3개월</option>
				    </optgroup>
				</select>
				
				<!-- 검색 조건 선택 -->
				<select name="faqkey2" id="faqkey2">
				    <optgroup label="검색 조건 선택">
				        <option value="title">제목</option>
				        <option value="fcontents">내용</option>
				        <option value="nickname">글쓴이</option>
				    </optgroup>
				</select>
				</div>
			    <!-- 검색어 입력 -->
			    <input type="text" name="faqvalue" id="faqvalue" placeholder="검색어를 입력하세요" required>
			
			    <!-- 검색 버튼 -->
			    <button type="submit">검색</button>
			</form>
			
		<!-- 메인 게시판 -->
			<table>
				<thead>
					<tr>
						<th>분류</th>
						<th>제목</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${bestfaq}" var="bestfaq">
					<tr onclick="location.href='faq_questions_detail?cnum=${bestfaq.cnum}'">
						<td>${bestfaq.tab}</td>
						<td>${bestfaq.title}</td>
						<td>${bestfaq.faqcnt}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</main>
	</div>
</body>
</html>
