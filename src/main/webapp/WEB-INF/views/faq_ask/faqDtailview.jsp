<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 상세페이지 하단 문의 답변내용 기재 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
    function deleteFaq(cnum) {
        if (confirm('삭제하시면 복구할 수 없습니다.\n정말로 삭제하시겠습니까?')) {
            location.href = 'faqdelete?cnum=' + cnum;
        }
    }
    
    function delete_reply(cnum) {
        if (confirm('삭제하시면 복구할 수 없습니다.\n정말로 삭제하시겠습니까?')) {
            location.href = 'faq_reply_delete?cnum=' + cnum;
        }
    }
</script>
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

main h1, main h5 {
    text-align: left;
    color: #333;
    margin-bottom: 20px;
}

.caption-color {
    background-color: #eef1f5; 
    color: #333; /* 텍스트 색상 */
    text-align: left;
    padding: 20px;
}

.caption-color1 {
    background-color: #eef1f5; 
    color: #333; /* 텍스트 색상 */
    text-align: left;
    padding: 20px;
    display: flex;
   	align-items: center;  /* 세로 중앙 정렬 */
}

.contents {
	display: flex;
   	align-items: center;  /* 세로 중앙 정렬 */
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
button[type="submit"], 
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

button[type="submit"]:hover, 
input[type="button"]:hover {
    background-color: #8e1a14;
}

/* 이미지 스타일 */
img {
    margin: 5px;
    border-radius: 4px;
    height: 150px;
}
.submitbutton {
	text-align: center;
}

</style>
<meta charset="UTF-8">
<title>1:1 문의 목록 상세페이지</title>
</head>
<body>
<div class="flex_container">
		<!-- 사이드 메뉴바 -->
		<div class="sidebar_container">
			<div class="sidebar_title"><h2>1:1 문의</h2></div>
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
				</ul>
			</aside>
		</div>
	<main class="main-container">
		<form action="faqreply" method="post" enctype="multipart/form-data">
			<div class="table-container">	
				<table>
					<c:forEach items="${list}" var="faq">
						<div class="caption-color">
							<h1>${faq.nickname} 님의 문의 내용</h1>
							<h5>문의 번호 : ${faq.cnum}</h5>
						</div>
						<input type="hidden" value="${faq.cnum}" name="cnum">
							<tr>
								<th>문의 종류</th>
								<th>제 목</th>
								<th>문의일자</th>
							</tr>
							<tr>
								<td id="cnum">${faq.tab}</td>
								<td>${faq.title}</td>
								<td>${faq.fdate}</td>
							</tr>
						<tr>
							
							<td colspan="3" height="250px">${faq.fcontents}</td>
						</tr>
						<tr>
							<td colspan="4">
								<c:if test="${faq.fimage1 != null}">
					                <img src="./image/${faq.fimage1}">
					            </c:if>
					            <c:if test="${faq.fimage2 != null}">
									<img src="./image/${faq.fimage2}"> 
								</c:if>
								<c:if test="${faq.fimage3 != null}">
									<img src="./image/${faq.fimage3}">
								</c:if>	
							</td>
						</tr>
						<tr>
							<td colspan="3" class="submitbutton">
						<!-- 관리자 문의 답변달기 버튼 -->
							<c:choose>
								<c:when test="${adminloginstate==true}">
									<button type="submit">문의 답변 달기</button>
								</c:when>
							</c:choose>
								
							<!-- 회원 문의 수정, 삭제 버튼 (로그인한 사람이며 작성자와 nickname이 같을 때만 가능) -->
							<c:choose>
								<c:when test="${loginstate eq true && sessionScope.dto3.nickname eq faq.nickname}">
									<input type="button" value="문의글 수정" onclick="location.href='faqupdate?cnum=${faq.cnum}'">
									<input type="button" value="문의글 삭제" onclick="deleteFaq(${faq.cnum})">
								</c:when>
							</c:choose>
									<input type="button" value="돌아가기" onclick="location.href='./faqout'">
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<br>
			<br>
			<div class="table-container">
				<table>
					<c:forEach items="${replylist}" var="replylist">
					<c:choose>
						<c:when test="${replylist ne null}">
					
					<div class="caption-color1"><br><h1>▶ Q&A : 답변 드립니다.</h1>
					</div>
						<tr>
							<th>문의 종류</th>
							<th>제 목</th>
							<th>답변 일자</th>
						</tr>
						<tr>
							<td>${replylist.tab}</td>
							<td>${replylist.title}</td>
							<td>${replylist.fdate}</td>
						</tr>
						<tr>
							<td colspan="3" height="250px">
								<br> 말씀하신 문의 내용을 확인했습니다. 
								<br> 이에 아래와 같이 답변 드리겠습니다.
								<br class="contents">${replylist.fcontents}
							</td>
						</tr>
						<tr>
							<td colspan="3">
							<c:choose>
								<c:when test="${adminloginstate == true}">
									<input type="button" value="답변 수정" onclick="location.href='faq_reply_update1?cnum=${replylist.cnum}'">
									<!-- 
									<input type="button" value="답변 삭제" onclick="location.href='faq_reply_delete?cnum=${replylist.cnum}'">
									 -->
									<input type="button" value="답변 삭제" onclick="delete_reply(${replylist.cnum})">
								</c:when>
							</c:choose>
							</td>
						</tr>
						</c:when>
					</c:choose>
					</c:forEach>
				</table>
			</div>
		</form>
	</main>
</div>
</body>
</html>