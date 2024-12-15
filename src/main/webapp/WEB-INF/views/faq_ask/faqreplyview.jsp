<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="./css/faq_ask/faqreplyview.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<!-- 메인 콘텐츠 -->
	<main class="main-container">
		<form action="faqreplysave" method="post">
			<div class="title">
				<h1>FAQ ANSWER</h1>
			</div>
			<table>
				<c:forEach items="${faqlist}" var="faq">
					<input type="hidden" value="${faq.cnum}" name="cnum">
					<input type="hidden" value="${faq.groups}" name="groups">
					<input type="hidden" value="${faq.step}" name="step">
					<input type="hidden" value="${faq.indent}" name="indent">
					
					<!-- 문의 답변 -> 탭, 답변 일자, 답변 내용, 답변 제목 -->
					<tr>
						<th>문의 일자</th>
						<td>${faq.fdate}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" value="운영자" name="nickname" readonly></td>
					</tr>
					<tr>
						<th>문의내용 재선택</th>
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
						<th>답변 제목</th>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<th>답변 내용</th>
						<td colspan="2">
							<p>문의작성자 : ${faq.nickname}님</p>
							<p>문의 내용 : <br>${faq.fcontents}</p>
							<textarea rows="10" cols="30" name="fcontents"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="submitbutton">
								<input type="submit" value="문의 답변 등록">
								<input type="reset" value="다시 작성">
							</div>
						</td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</main>	
</div>
</body>
</html>