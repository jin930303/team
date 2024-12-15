<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
    function deleteFaq(cnum) {
        if (confirm('삭제하시면 복구할 수 없습니다.\n정말로 삭제하시겠습니까?')) {
            location.href = 'faq_admin_delete?cnum=' + cnum;
        }
    }
</script>
<link href="./css/faq/faq_questions_Detailview.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>FAQ-자주묻는질문 상세페이지</title>
</head>
<body>
<div class="flex_container">
		<!-- 사이드 메뉴바 -->
		<div class="sidebar_container">
			<div class="sidebar_title"><h2>FAQ</h2></div>
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
		<div class="table-container">
			<table>
				<div class="caption-color">
					<h1>FAQ : ${faq.title}</h1>
					<h5>문의 번호 : ${faq.cnum}</h5>
				</div>
					<input type="hidden" value="${faq.cnum}" name="cnum">
					<tr>
						<th>문의 종류</th>
						<th width="550px">제 목</th>
						<th>작성 일자</th>
						<th>조회수</th>
					</tr>
					<tr>
						<td>${faq.tab}</td>
						<td>${faq.title}</td>
						<td>${faq.fdate}</td>
						<td>${faq.faqcnt}</td>
					<tr>
						<td colspan="4" height="250px">${faq.fcontents}</td>
					</tr>
					<c:choose>
						<c:when test="${faq.fimage1 ne null}">
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
						</c:when>
					</c:choose>
					<tr>
						<td colspan="4" class="submitbutton">
						<!-- 관리자 문의 답변달기 버튼 -->
						<c:choose>
							<c:when test="${adminloginstate eq true}">
								<input type="button" value="FAQ 수정(관리자)" onclick="location.href='faq_admin_update?cnum=${faq.cnum}'">
								<input type="button" value="FAQ 삭제(관리자)" onclick="deleteFaq(${faq.cnum})">
							</c:when>
						</c:choose>	
						<input type="button" value="돌아가기" onclick="location.href='./faq'"></td>
					</tr>
				</table>
			</div>
			<div class="table-container">
				<table>	
					<div class="caption-color1"><h1>댓글</h1></div>
					<tr>
						<th width="150px">닉네임</th>
						<th>내 용</th>
					</tr>
				<c:forEach items="${faqreply}" var="reply">
					<tr>	
						<td>${reply.nickname}</td>
						<td style="text-align: left;">
							${reply.fcontents}
						</td>
					</tr>
				</c:forEach>
				</table>
			</div>	
		<br>
		<br>
		<!-- 회원만 댓글달기 -->
		<form action="faq_questions_reply_save" method="post">
			<div class="table-container">
				<table>
				<c:choose>
					<c:when test="${loginstate eq true}">
					<input type="hidden" value="${faq.cnum}" name="cnum"> 
					<input type="hidden" value="${faq.groups}" name="groups"> 
					<input type="hidden" value="${faq.step}" name="step"> 
					<input type="hidden" value="${faq.indent}" name="indent">
					<input type="hidden" value="${faq.tab}" name="tab">
					<input type="hidden" value="${sessionScope.dto3.nickname}" name="nickname">
					<tr>	
						<td width="800px">
							<textarea rows="5" cols="10" name="fcontents"></textarea>
						</td>
						<td class="submitbutton">
							<input type="submit" value="댓글 달기">
							<input type="reset" value="다시 작성">
						</td>
					</tr>
					</c:when>
				</c:choose>
				</table>
			</div>
		</form>
	</main>		
</div>
</body>
</html>