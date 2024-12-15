<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="./css/faq/faq_admin_input.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="flex_container">
		<!-- 사이드 메뉴바 -->
		<div class="sidebar_container">
			<div class="sidebar_title"><h2>FAQ 작성</h2></div>
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
			<form action="faq_admin_save" method="post" enctype="multipart/form-data">
				<table>
				<div class="title">
					<h1>FAQ WRITE</h1>
				</div>
					<input type="hidden" name="cnum">
					<tr>
						<th>문의 종류</th>
						<td><input type="text" name="tab" value="FAQ" readonly></td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title"></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input type="text" value="운영자" name="nickname" readonly></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="25" name="fcontents">
						
							</textarea></td>
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
						<td colspan="2" class="submitbutton">
							<input type="submit" value="작성 완료">
							<input type="reset" value="다시 작성">
						</td>
					</tr>
				</table>
			</form>
		</main>
	</div>
</body>
</html>