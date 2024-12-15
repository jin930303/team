<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link href="./css/faq_ask/faqUpdateview.css" rel="stylesheet"/>
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
	<main class="main-container">
		<form action="faqupdate2" method="post" enctype="multipart/form-data">
			<div class="title">
				<h1>문의글 UPDATE</h1>
			</div>
			<table>
				<tr>
					<th>문의 번호</th>
					<td><input type="text" name="cnum" value="${dto.cnum}" readonly></td>
				</tr>
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
					<th>작성자</th>
					<td><input type="text" name="nickname" value="${dto.nickname}"></td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" value="${dto.title}"></td>
				</tr>
				<tr>
					<th>문의 내용</th>
					<td><textarea rows="10" cols="25" name="fcontents">${dto.fcontents}</textarea>
					</td>
				</tr>
				<tr>
				    <th>첨부 이미지</th>
				    <td>
				    <!-- 
				        <div id="fileInputs">
				            <input type="file" name="fimage1">
				        </div>
				        <button type="button" onclick="addFileInput()">이미지 추가</button>
				     -->
				     	<input type="file" name="fimage1">
						<input type="file" name="fimage2">
					    <input type="file" name="fimage3">
				    </td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<c:if test="${dto.fimage1 != null}">
						    <img src="./image/${dto.fimage1}" height="100px">
					    </c:if>
					    <c:if test="${dto.fimage2 != null}">
							<img src="./image/${dto.fimage2}" height="100px"> 
						</c:if>
						<c:if test="${dto.fimage3 != null}">
							<img src="./image/${dto.fimage3}" height="100px">
						</c:if>	
					</td>
				</tr>
				<tr>
					<!-- 공개/비공개 체크박스 -->
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
							<input type="submit" value="수정 완료">
							<input type="button" value="수정 취소" onclick="location.href='faqout'">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</main>
</div>	
</body>
</html>