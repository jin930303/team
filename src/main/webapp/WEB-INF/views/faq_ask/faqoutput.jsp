<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객센터 문의 게시판</title>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
	color: #333;
}

.container {
	display: flex;
	width: 80%;
}

.sidebar {
	width: 250px;
	background-color: #fff;
	border-right: 1px solid #ddd;
	padding: 20px;
}

.sidebar h2 {
	font-size: 18px;
	margin-bottom: 20px;
}

.sidebar ul {
	list-style: none;
	padding: 0;
	margin-bottom: 30px;
}

.sidebar ul li {
	margin-bottom: 10px;
}

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

.contact-info, .account-info {
	margin-bottom: 30px;
}

.contact-info h3, .account-info h3 {
	font-size: 16px;
	margin-bottom: 10px;
}

.contact-info p, .account-info p {
	margin-bottom: 5px;
}

.main-content {
	flex-grow: 1;
	padding: 20px;
	background-color: #fff;
}

.main-content h1 {
	font-size: 24px;
	margin-bottom: 20px;
}

.search-bar {
	display: flex;
	margin-bottom: 20px;
}

.search-bar input {
	width: 300px;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	margin-right: 10px;
}

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

.faq-table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.faq-table caption {
	font-size: 18px;
	margin-bottom: 10px;
	text-align: left;
}

.faq-table th, .faq-table td {
	border: 1px solid #ddd;
	padding: 10px;
	text-align: center;
}

.faq-table th {
	background-color: #f4f4f4;
}

.faq-table tbody tr:hover {
	background-color: #f9f9f9;
}

.trlink:hover {
	cursor: pointer;
	background-color: #ddd;
}

.pagination {
	text-align: center;
	margin-top: 20px;
}

.pagination a {
	margin: 0 5px;
	text-decoration: none;
	padding: 5px 10px;
	border: 1px solid #ddd;
	color: #333;
}

.pagination a:hover {
	background-color: #ddd;
}

.pagination .current {
	font-weight: bold;
	color: red;
}
/* 플로팅 메뉴 스타일 */
#floating-menu {
	position: fixed;
	right: 30px;
	top: 250px; /* 상단에서 150px 떨어짐 */
	z-index: 600;
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 10px;
	padding: 20px;
}

.main-content {
	margin-right: 150px;
}

#floating-menu ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

#floating-menu ul li {
	margin-bottom: 10px;
}

#floating-menu ul li a {
	text-decoration: none;
	color: #333;
	padding: 10px 20px;
	display: block;
	border: 1px solid #ddd;
	border-radius: 5px;
	text-align: center;
	transition: background-color 0.3s;
}

#floating-menu ul li a:hover {
	background-color: #f4f4f4;
}
/* 탑버튼, 바텀버튼 */
.scroll-button {
	color: #333;
	text-align: center;
	padding: 10px 20px;
	border: 1px solid #ddd;
	font-size: 20px;
	border-radius: 5px;
	cursor: pointer;
	margin-bottom: 8px;
}

.scroll-button:hover {
	background-color: #f4f4f4;
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
				<% 
					Boolean FAQmember = (Boolean) session.getAttribute("loginstate");
					if (FAQmember != null && FAQmember) {
				%>
					<li><a href="faqin">1:1 문의하기</a></li>
				<%
					}
				%>
				<li><a href="faqout">문의 내역</a></li>
				<li><a href="faq">FAQ</a></li>
			</ul>
			<div class="contact-info">
				<h3>고객상담센터</h3>
				<p>070-7777-7777</p>
				<p>example@naver.com</p>
				<p>운영 시간: 11:00 ~ 19:00 (연중무휴)</p>
			</div>
			<div class="account-info">
				<h3>은행계좌 안내</h3>
				<p>777777-77-777777</p>
				<p>행복은행 (예금주: 행복이)</p>
			</div>
		</aside>
		<!-- 오른쪽 플로팅 메뉴 -->
		<div id="floating-menu">
			<ul>
				<li><a href="cart">장바구니</a></li>
				<li><a href="https://open.kakao.com/o/suixDsUg">KAKAO문의</a></li>
				<li><a href="#">배송조회</a></li>
				<li><a href="#">최근 본 상품</a></li>
				<li><a href="#">관심상품</a></li>
				<li><a href="myinfo">마이페이지</a></li>
			</ul>
            <div class="scroll-button" onclick="window.scrollTo({top: 0, behavior: 'smooth'});">△</div>
            <div class="scroll-button" onclick="window.scrollTo({top: document.body.scrollHeight, behavior: 'smooth'});">▽</div>
		</div>

		<!-- 메인 콘텐츠 -->
		<main class="main-content">
			<h1>문의 게시판</h1>

			<form action="category" method="post">
			    <button type="submit" name="faq_category" value="faqcnt">조회수 많은 순</button>
			    <button type="submit" name="faq_category" value="fdate">최신순</button>
			</form>

			<form action="faqsearch" method="post" class="search-bar">
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
			
			<!-- 문의 리스트 테이블 -->
			<table class="faq-table">
				<caption>문의 내역</caption>
				
				<thead>
					<tr class="faq-small-title">
						<th width="60px">TAB</th>
						<th width="350px">제목</th>
						<th width="100px">작성자</th>
						<th width="100px">작성일자</th>
						<th width="80px">공개여부</th>
						<th width="50px">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="faq">
						<tr onclick="location.href='faqdetail?cnum=${faq.cnum}&openclose=${faq.openclose}'" class="trlink" id="admincheck">
							<c:choose>
		                        <c:when test="${faq.openclose == '공개'}">
		                            <td>${faq.tab}</td>
		                            <td style="text-align: left;">${faq.title}</td>
		                            <td>${faq.nickname}</td>
									<td>${faq.fdate}</td>
									<td>${faq.openclose}</td>
									<td>${faq.faqcnt}</td>
		                        </c:when>
		                        <c:otherwise>
		                            <td>${faq.tab}</td>
		                            <td style="text-align: left;">비공개</td>
		                            <td>비공개</td>
		                            <td>${faq.fdate}</td>
		                            <td>${faq.openclose}</td>
		                            <td>${faq.faqcnt}</td>
		                        </c:otherwise>
		                    </c:choose>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>

			<!-- 페이지 네비게이션 -->
			<div class="pagination">
				<c:if test="${paging.startPage != 1}">
					<a
						href="faqout?nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}">이전</a>
				</c:if>

				<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage}">
							<span class="current">${p}</span>
						</c:when>
						<c:otherwise>
							<a href="faqout?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${paging.endPage != paging.lastPage}">
					<a
						href="faqout?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">다음</a>
				</c:if>
			</div>
		</main>
	</div>
</body>
</html>
