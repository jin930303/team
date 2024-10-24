<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객센터</title>

<style type="text/css">

/* 백그라운드 배경 */
body {
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
	color: #333;
}

/* 목차+게시판 컨테이너 */
.container {
	display: flex;
	width: 80%;
}

/* 좌측 목차 사이드 바 */
.sidebar {
	width: 350px;
	background-color: #fff;
	border-right: 1px solid #ddd; /* 목차 - 게시판 사이 선*/
	padding: 20px;
}

/* 좌측 사이드바 "고객센터" */
.sidebar h2 {
	font-size: 18px;
	margin-bottom: 20px;
}

/* 목차 링크의 리스트 스타일 없애면 리스트별 . 생김 */
.sidebar ul {
	list-style: none;
	padding: 0;
	margin-bottom: 30px;
}

/* 목차 리스트 사이 간격 */
.sidebar ul li {
	margin-bottom: 10px;
}

/* 목차 리스트 별 버튼 모양 */
.sidebar ul li a {
	text-decoration: none;
	color: #333;
	display: block;
	padding: 10px;
	background-color: #f1f1f1;
	border-radius: 4px;
	transition: background-color 0.3s;
}

.sidebar ul li a:hover {
	background-color: #ddd;
}

/* 게시판 하단 컨테이너와 게시글 테이블 사이 간격 */
.contact-info {
	margin-bottom: 30px;
}

/* h3 텍스트(목차 하단 텍스트) */
.contact-info h3 {
	font-size: 16px;
	margin-bottom: 10px;
}

/* 목차 하단 텍스트 사이 간격 */
.contact-info p {
	margin-bottom: 5px;
}

/* 게시판 섹션 */
.main-content {
	flex-grow: 1;
	padding: 20px;
	background-color: #fff;
	margin-right: 150px;
}

/* 게시판 "FAQ - 자주묻는질문" */
.main-content h1 {
	font-size: 24px;
	margin-bottom: 20px;
}

/* 검색창 조건 틀 */
.search-bar {
	display: flex;
	margin-bottom: 20px;
}

/* 검색창 검색란 */
.search-bar input {
	width: 300px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	margin-right: 10px;
}

/* 검색하기 버튼 */
.search-bar button {
	padding: 10px 20px;
	background-color: #333;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.search-bar button:hover {
	background-color: #555;
}

/* 게시판 섹션 안 게시판 테이블 자체 */
.faq-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

/* 게시판 텍스트 "Best FAQ" */
.faq-table caption {
	font-size: 18px;
	margin-bottom: 10px;
	text-align: left;
}

/* 게시판 테이블 th,td 라인 */
.faq-table th, .faq-table td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

/* 게시판 테이블 th 영역 */
.faq-table th {
	background-color: #f4f4f4;
}

/* 게시글에 커서 가져다대면 색 바뀜 */
.faq-table tbody tr:hover {
	cursor: pointer;
	background-color: #f9f9f9;
}

</style>
</head>
<body>
	<div class="container">
		<!-- 사이드 메뉴바 -->
		<aside class="sidebar">
			<h2>고객센터</h2>
			<ul>
				<li><a href="faq_community">고객센터</a></li>
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
			<div class="contact-info">
				<h3>고객상담센터</h3>
				<p>070-7777-7777</p>
				<p>안녕하세요@naver.com</p>
				<p>운영 시간: 11:00 ~ 19:00 (연중무휴)</p>
			</div>
			<div class="contact-info">
				<h3>은행계좌 안내</h3>
				<p>777777-77-777777</p>
				<p>행복은행 (예금주: 행복이)</p>
			</div>
		</aside>

		<!-- 메인 콘텐츠 -->
		<main class="main-content">
			<h1>FAQ - 자주 묻는 질문 BEST 10</h1>
		
		<!-- 검색 바 -->
			<form action="faq_main_serch" method="post" class="search-bar">
				<!-- 기간 선택 -->
			    <select name="faqkey1" id="faqkey1">
			        <option value="">기간 선택</option>
			        <option value="1">1일</option>
			        <option value="7">1주일</option>
			        <option value="30">1개월</option>
			        <option value="90">3개월</option>
			    </select>
			
			    <!-- 검색 조건 선택 -->
			    <select name="faqkey2" id="faqkey2">
			        <option value="">검색 조건 선택</option>
			        <option value="title">제목</option>
			        <option value="fcontents">내용</option>
			        <option value="nickname">글쓴이</option>
			    </select>
			
			    <!-- 검색어 입력 -->
			    <input type="text" name="faqvalue" id="faqvalue" placeholder="검색어를 입력하세요" required>
			
			    <!-- 검색 버튼 -->
			    <button type="submit">검색</button>
			</form>
			
		<!-- 메인 게시판 -->
			<table class="faq-table">
				<caption>BEST FAQ</caption>
				<thead>
					<tr>
						<th>분류</th>
						<th>제목</th>
						<th>조회수</th>
					</tr>
				</thead>
				<c:forEach items="${bestfaq}" var="bestfaq">
					<tbody>
						<tr onclick="location.href='faqdetail?cnum=${bestfaq.cnum}'" class="trlink">
							<td>${bestfaq.tab}</td>
							<td>${bestfaq.title}</td>
							<td>${bestfaq.faqcnt}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</main>
	</div>
</body>
</html>
