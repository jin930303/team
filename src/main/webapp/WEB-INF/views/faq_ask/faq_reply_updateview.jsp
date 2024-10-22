<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>고객센터 문의 게시판</title>
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
.contact-info, .account-info {
	margin-bottom: 30px;
}

/* h3 텍스트(목차 하단 텍스트) */
.contact-info h3, .account-info h3 {
	font-size: 16px;
	margin-bottom: 10px;
}

/* 목차 하단 텍스트 사이 간격 */
.contact-info p, .account-info p {
	margin-bottom: 5px;
}

/* 게시판 섹션 */
.main-content {
	flex-grow: 1;
	padding: 20px;
	background-color: #fff;
	margin-right: 150px;
}

/* 게시판 "1:1 문의글 답변 수정" */
.main-content h1 {
	font-size: 24px;
	margin-bottom: 20px;
}
table {
	text-align: center;
	margin-bottom: 10px;
	padding: 20px;
	width: 90%;
}

th,td {
	background-color: white;
	border: 1px solid #ddd;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
		<!-- 사이드 메뉴바 -->
		<aside class="sidebar">
			<h2>고객센터</h2>
			<ul>
				<li><a href="faq_community">고객센터</a></li>
				<li><a href="#">공지사항</a></li>
				<c:choose>
					<c:when test="${loginstate == true}">
						<li><a href="faqin">1:1 문의하기</a></li>
					</c:when>
				</c:choose>
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
	<!-- 메인 콘텐츠 -->
	<main class="main-content">
		<h1>1:1 문의 답변 수정</h1>	
	<form action="faq_reply_update2" method="post" enctype="multipart/form-data">
		<table class="table_style">
			<caption>UPDATE</caption>
			<tr>
				<th>문의 번호</th>
				<td>
					<input type="number" name="cnum" value="${dto.cnum}" readonly>
				</td>
			</tr>
			<tr>
				<th>문의 종류</th>
				<td>
					<select name="tab">
						<option value="회원관련 문의">회원관련 문의</option>
						<option value="이벤트/혜택">이벤트/혜택</option>
						<option value="상품옵션 문의">상품옵션</option>
						<option value="교환/환불 문의">교환/환불</option>
						<option value="배송 문의">배송 문의</option>
						<option value="기타 문의">기타 문의</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="title" value="${dto.title}"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="nickname" value="${dto.nickname}"></td>
			</tr>
			<tr>
				<th>문의 내용</th>
				<td>
					<textarea rows="10" cols="25" name="fcontents">${dto.fcontents}</textarea>
				</td>
			</tr>
			<tr>
				<th>첨부이미지</th>
				<td>
					<input type="file" name="fimage1"> 
					<input type="file" name="fimage2"> 
					<input type="file" name="fimage3">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정 완료">
					<input type="button" value="수정 취소" onclick="location.href='faqout'">
				</td>
			</tr>
		</table>
	</form>
	</main>
</div>
</body>
</html>