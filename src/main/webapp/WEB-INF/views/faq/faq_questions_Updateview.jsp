<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- 좌측 사이드바 -->
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
	transition: background-color 0.2s ease;
}

.sidebar ul li a:hover {
	border-color: #be241c;
	background-color: #be241c;
	font-weight: bold;
	color: white;
}

</style>

<!-- 메인 섹션 -->
<style type="text/css">
/* 테이블 스타일 */
.main-container {
	flex: 1;
	/*width: 100%;*/
    max-width: 1100px;
    padding: 20px 60px;
    border-right: 1px solid #ddd;  /*목차 - 게시판 사이 선*/
    border-left: 1px solid #ddd;  /*목차 - 게시판 사이 선*/
}

table {
    width: 100%; /* 테이블 너비 100% */
    margin-top: 10px; /* 상단 간격 */
    border-collapse: collapse; /* 테이블 경계 겹치지 않도록 */
    text-align: center;
}

caption {
	color: black;
	text-align: center;
}

table tr th, 
table tr td {
    padding: 14px;
    text-align: left; /* 모든 셀의 정렬을 왼쪽으로 */
    vertical-align: middle; /* 수직 가운데 정렬 */
    border-bottom: 1px solid #ddd; /* 테두리 유지 */
    border: none;
}

/* tr 사이 선*/
table tr{
	padding: 24px;
	border-bottom: 1px solid #ddd;
}

table tr:last-child {
	border-bottom: none;
}

/* input 필드 공통 스타일 */
input[type="text"],
input[type="file"],
textarea,
select {
    width: 100%;
    padding: 12px; /* 내부 여백 */
    border: 1px solid #ddd; /* 연한 테두리 */
    border-radius: 5px; /* 모서리 둥글게 */
    font-size: 14px; /* 글씨 크기 */
    margin-top: 8px; /* 입력 필드 간 간격 */
    box-sizing: border-box; /* 패딩과 테두리 포함한 전체 크기 */
    background-color: #fff;
    transition: border 0.3s ease; /* 테두리 변경 시 부드러운 전환 */
}

/* file input 스타일 */
input[type="file"] {
    padding: 12px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
    background-color: #fff;
    width: 100%;
    box-sizing: border-box;
    cursor: pointer; /* 마우스 오버 시 커서가 포인터로 변경 */
}
/* checkbox 스타일 */
input[type="checkbox"] {
    margin-right: 8px;
}
/* 파일 업로드 컨테이너 스타일 */
#fileInputs {
    display: flex;
    flex-direction: column;
}
/* textarea 스타일 */
textarea {
    resize: vertical; /* 사용자가 세로 크기 조절 가능하도록 설정 */
    padding: 12px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
    margin-top: 8px;
    width: 100%; /* 텍스트영역이 td 내에서 전체 너비를 차지 */
    box-sizing: border-box;
    background-color: #fff;
}
/* input 필드 포커스 시 스타일 */
input[type="text"]:hover,
input[type="file"]:hover,
textarea:hover,
select:hover {
    border-color: #be241c; /* 포커스 시 붉은색 테두리 */
    outline: none; /* 포커스 시 외곽선 제거 */
}

/* input 필드 포커스 시 스타일 */
input[type="text"]:focus,
input[type="file"]:focus,
textarea:focus,
select:focus {
    border-color: #be241c; /* 포커스 시 붉은색 테두리 */
    outline: none; /* 포커스 시 외곽선 제거 */
}

/* 중복확인 버튼 스타일 */
input[type="button"],
input[type="submit"],
input[type="reset"] {
    margin-top: 8px; /* 입력 필드 간 간격 */
	padding: 12px 20px; /* 버튼 내부 여백 */
	font-size: 14px; /* 버튼 글씨 크기 */
	color: white; /* 글자 색상 */
	background-color: #be241c; /* 버튼 배경색 */
	border: none; /* 테두리 제거 */
	border-radius: 5px; /* 둥근 모서리 */
	cursor: pointer; /* 포인터 모양 변경 */
	transition: background-color 0.3s ease; /* 배경색 전환 */
}

/* 중복확인 버튼 호버 효과 */
input[type="button"]:hover,
input[type="submit"]:hover,
input[type="reset"]:hover {
	background-color: #8e1a14;
}

.submitbutton {
	text-align: center;
}

td img {
	display: inline-block; 
    margin: 5px auto;  
    border-radius: 4px;
    height: 150px;
    vertical-align: middle;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
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
		<form action="faq_admin_update2" method="post"
			enctype="multipart/form-data">
			<table>
				<caption><h2>FAQ : 수정</h2></caption>
				<tr>
					<th>FAQ 번호</th>
					<td><input type="text" name="cnum" value="${dto.cnum}" readonly>
					</td>
				</tr>
				<tr>
					<th>FAQ 종류</th>
					<td><input type="text" name="tab" value="FAQ" readonly>
					</td>
				</tr>
				<tr>
					<th>FAQ 작성자</th>
					<td><input type="text" value="운영자" name="nickname" readonly></td>
				</tr>
				<tr>
					<th>FAQ 제목</th>
					<td><input type="text" name="title" value="${dto.title}"></td>
				</tr>
				<tr>
					<th>FAQ 내용</th>
					<td><textarea rows="10" cols="25" name="fcontents">${dto.fcontents}</textarea>
					</td>
				</tr>
				<tr>
					<th>FAQ 첨부 이미지</th>
					<td>
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