<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의글 작성</title>
<link href="./css/faq_ask/faqinput.css" rel="stylesheet"/>
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
			<form action="faqsave" method="post" enctype="multipart/form-data">
				<div class="title">
					<h1>문의글 WRITE</h1>
				</div>
				<table>
					<tr>
						<th>문의 종류</th>
						<td><select name="tab">
								<option value="회원관련 문의">회원관련 문의</option>
								<option value="이벤트/혜택">이벤트/혜택</option>
								<option value="상품옵션 문의">상품옵션</option>
								<option value="교환/환불 문의">교환/환불</option>
								<option value="배송 문의">배송 문의</option>
								<option value="기타 문의">기타 문의</option>
						</select></td>
					</tr>
					<tr>
					<c:choose>
						<c:when test="${loginstate==true}">
							<th>작성자</th>
							<td><input type="text" name="nickname" value="${sessionScope.dto3.nickname}" readonly></td>
						</c:when>
					</c:choose>
					</tr>					
					
					<tr>
						<th>제목</th>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<th>문의 내용</th>
						<td>
							<textarea rows="10" cols="25" name="fcontents"></textarea>
						</td>
					</tr>

					<tr>
					    <th>첨부 이미지</th>
					    <td>
					        <input type="file" name="fimage1">
					        <input type="file" name="fimage2">
					    	<input type="file" name="fimage3">
					    </td>
					</tr>
					<tr>
					    <td>
						    <label for="openclose">공개 여부</label>
					    </td>
					    <td>
						    <input type="checkbox" name="openclose" value="공개"> 공개
						    <input type="checkbox" name="openclose" value="비공개"> 비공개
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<div class="submitbutton">
							<input type="submit" value="작성 완료">
							<input type="reset" value="다시 작성">
						</div></td>
					</tr>
				</table>
			</form>
		</main>
	</div>	
</body>
</html>
