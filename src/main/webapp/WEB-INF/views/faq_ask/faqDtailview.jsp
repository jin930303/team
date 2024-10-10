<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 상세페이지 하단 문의 답변내용 기재 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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
	width: 350px;
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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
    function deleteFaq(cnum) {
        if (confirm('삭제하시면 복구할 수 없습니다.\n정말로 삭제하시겠습니까?')) {
            location.href = 'faqdelete?cnum=' + cnum;
        }
    }
</script>
<meta charset="UTF-8">
<title>1:1 문의 목록 상세페이지</title>
</head>
<body>
<div class="container">
		<!-- 사이드 메뉴바 -->
		<aside class="sidebar">
			<h2>고객센터</h2>
			<ul>
				<li><a href="faq_community">고객센터</a></li>
				<li><a href="gongjiboard">공지사항</a></li>
				<li><a href="faqin">1:1 문의하기</a></li>
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
				<li><a href="#">CART</a></li>
				<li><a href="#">KAKAO</a></li>
				<li><a href="#">CREDIT CARD</a></li>
				<li><a href="#">EMS</a></li>
			</ul>
			<!-- 
            <div class="scroll-button" onclick="window.scrollTo({top: 0, behavior: 'smooth'});">△</div>
            <div class="scroll-button" onclick="window.scrollTo({top: document.body.scrollHeight, behavior: 'smooth'});">▽</div>
     -->
		</div>
	<form action="faqreply" method="post" enctype="multipart/form-data">
		<table align="center" width="900px" border="1">
			<c:forEach items="${list}" var="faq">
				<caption>
					<h1>${faq.nickname}님의문의 내용</h1>
				</caption>
				<input type="hidden" value="${faq.cnum}" name="cnum">
				<tr>
					<th colspan="4" id="cnum">${faq.cnum} / ${faq.tab} / ${faq.fdate} / ${faq.faqcnt}</th>
				</tr>
				<tr>
					<th>제 목</th>
					<td>${faq.title}</td>
					<th>작성자</th>
					<td>${faq.nickname}</td>
					<th>조회수</th>
					<td>${faq.faqcnt}</td>
					
				<tr>
					<td colspan="4">${faq.fcontents}</td>
				</tr>
				<tr>
					<td colspan="4">
						<c:if test="${faq.fimage1 != null}">
			                <img src="./image/${faq.fimage1}" width="80px" height="70px">
			            </c:if>
			            <c:if test="${faq.fimage2 != null}">
							<img src="./image/${faq.fimage2}" width="80px" height="70px"> 
						</c:if>
						<c:if test="${faq.fimage3 != null}">
							<img src="./image/${faq.fimage3}" width="80px" height="70px">
						</c:if>	
					</td>
				</tr>
				<tr>
					<td colspan="4">
					<!-- 관리자 문의 답변달기 버튼 -->
					<% 
						Boolean FAQadmin = (Boolean) session.getAttribute("adminloginstate");
						if (FAQadmin != null && FAQadmin) {
					%>
						<button type="submit">문의 답변 달기</button>
					<% 
						}
					%>
					
					<!-- 회원 문의 수정,삭제 버튼(작성한 회원만 사용하게끔 보완해야됨) -->
					<% 
						Boolean FAQmember = (Boolean) session.getAttribute("loginstate");
						if (FAQmember != null && FAQmember) {
					%>
						<input type="button" value="문의글 수정" onclick="location.href='faqupdate?cnum=${faq.cnum}'">
						<input type="button" value="문의글 삭제" onclick="deleteFaq(${faq.cnum})">
					<% 
						}
					%>
						<input type="button" value="돌아가기" onclick="location.href='./faqout'">
					</td>
				</tr>
			</c:forEach>
		</table>

		<table align="center" width="900px" border="1">
			<caption>
				<br>
				<h2>↳ Q&A : 답변 드립니다.</h2>
			</caption>
			<c:forEach items="${replylist}" var="replylist">
				<tr>
					<th>문의 종류</th>
					<td>${replylist.tab}</td>
				</tr>
				<tr>
					<th>답변 제목</th>
					<td>${replylist.title}</td>
					<th>문의 일자</th>
					<td>${replylist.fdate}</td>
				</tr>
				<tr>
					<td colspan="4"><br>
						<br> 말씀하신 문의 내용을 확인했습니다. <br> 이에
						아래와 같이 답변 드리겠습니다.<br> 답변 내용 : ${replylist.fcontents}
					</td>
				</tr>
				<% 
					Boolean FAQadmin = (Boolean) session.getAttribute("adminloginstate");
					if (FAQadmin != null && FAQadmin) {
				%>
				<tr>
					<td colspan="6">
						<input type="button" value="답변 수정" onclick="location.href='faq_reply_update1?cnum=${replylist.cnum}'">
						<input type="button" value="답변 삭제" onclick="location.href='faq_reply_delete?cnum=${replylist.cnum}'">
					</td>
				</tr>
				<% 
					}
				%>
			</c:forEach>
		</table>
	</form>
</div>
</body>
</html>