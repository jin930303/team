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
<link href="./css/faq_ask/faqDtailview.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>1:1 문의 목록 상세페이지</title>
</head>
<body>
<div class="flex_container">
<!-- 사이드 메뉴바 -->
	<div class="sidebar_container">
		<div class="sidebar_title"><h2>문의 내역</h2></div>
		<aside class="sidebar">
			<ul>
				<li><a href="faq_community">고객센터 홈</a></li>
				<c:choose>
					<c:when test="${loginstate == true}">
						<li><a href="faqin">1:1 문의하기</a></li>
					</c:when>
				</c:choose>
				<li><a href="faqout">문의 내역</a></li>
				<li><a href="faq">FAQ</a></li>
				<c:choose>
					<c:when test="${adminloginstate == true}">
					<li><a href="FAQ_in">FAQ 작성</a></li>
					</c:when>
				</c:choose>
			</ul>
		</aside>
	</div>
	<main class="main-container">
		<form action="faqreply" method="post" enctype="multipart/form-data">
			<div class="table-container">	
				<c:forEach items="${list}" var="faq">
					<table>
						<div class="title">
							<h1>${faq.nickname} 님의 문의 내용</h1>
							<h5>문의 번호 : ${faq.cnum}</h5>
						</div>
						<input type="hidden" value="${faq.cnum}" name="cnum">
							<tr>
								<th width="100px">문의 종류</th>
								<th>제 목</th>
								<th width="80px">문의일자</th>
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
					</table>
				</c:forEach>
			</div>
			<br>
			<br>
			<div class="table-container">
				<table>
					<c:forEach items="${replylist}" var="replylist">
					<c:choose>
						<c:when test="${replylist ne null}">
					
					<div class="title1">
						<h1>Q&A : 답변 드립니다.</h1>
					</div>
						<tr>
							<th>문의 종류</th>
							<th width="650px">제 목</th>
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