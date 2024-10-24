<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script>
	let fileCount = 1;
	const maxFiles = 3;
		
	function addFileInput() {
    if (fileCount >= maxFiles) {
	    alert("최대 3장까지 첨부 가능합니다.");
	return;
	}
					
    fileCount++;
    const newInput = document.createElement('input');
    newInput.type = 'file';
    newInput.name = `fimage${fileCount}`;
					
    document.getElementById('fileInputs').appendChild(newInput);
}
</script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>문의글 작성</title>
<!-- 좌측 사이드바 -->
<style type="text/css">
/* 목차+게시판 컨테이너 */
.container {
	display: flex;
	width: 80%;
}

/* 좌측 목차 사이드 바 */
.side-container {
	background-color: #f7f7f7;
	padding: 12px;
}

.sidebar {
	width: 350px;
	border-right: 1px solid #ddd; /* 목차 - 게시판 사이 선*/
	padding: 20px;
	
}

/* 좌측 사이드바 "고객센터" */
.sidebar h2 {
	margin-bottom: 50px;
	padding-top: 30px;
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
	border-radius: 4px;
	transition: background-color 0.3s;
}

.sidebar ul li a:hover {
	background-color: #be241c;
	color: white;
}
</style>

<!-- 테이블 스타일 -->
<style type="text/css">
/* 테이블 스타일 */
.main-container {
	width: 100%;
    max-width: 850px;
    margin: 0 auto; /* 가운데 정렬 */
    padding: 20px;
    border-right: 1px solid #ddd; /* 목차 - 게시판 사이 선*/
}

table {
    width: 100%; /* 테이블 너비 100% */
    margin-top: 10px; /* 상단 간격 */
    border-collapse: collapse; /* 테이블 경계 겹치지 않도록 */
    text-align: center;
}

caption {
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
input[type="submit"] {
    margin-top: 8px; /* 입력 필드 간 간격 */
	padding: 12px 20px; /* 버튼 내부 여백 */
	font-size: 14px; /* 버튼 글씨 크기 */
	background-color: #be241c; /* 버튼 배경색 */
	color: white; /* 글자 색상 */
	border: none; /* 테두리 제거 */
	border-radius: 5px; /* 둥근 모서리 */
	cursor: pointer; /* 포인터 모양 변경 */
	transition: background-color 0.3s ease; /* 배경색 전환 */
}
.submitbutton {
	text-align: center;
}

/* 중복확인 버튼 호버 효과 */
input[type="button"]:hover,
input[type="submit"]:hover {
	background-color: #8e1a14;
}
</style>
</head>
<body>
	<div class="container">
		<!-- 사이드 메뉴바 -->
		<aside class="sidebar">
			<div class="side-container">
			<h2>고객센터</h2>
			<ul>
				<li><a href="faq_community">고객센터</a></li>
				<li><a href="gongjiboard">공지사항</a></li>
				<c:choose>
					<c:when test="${loginstate == true}">
						<li><a href="faqin">1:1 문의하기</a></li>
					</c:when>
				</c:choose>
				<li><a href="faqout">문의 내역</a></li>
				<li><a href="faq">FAQ</a></li>
			</ul>
			</div>
		</aside>
		<div class="main-container">
			<form action="faqsave" method="post" enctype="multipart/form-data">
				<table>
					<caption><h2>문의글 작성</h2></caption>
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
							<th>닉네임</th>
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
					        <div id="fileInputs">
					            <input type="file" name="fimage1" onclick="addFileInput()">
					        </div>
					    </td>
					</tr>
					<tr>
						<!-- 공개/비공개 체크박스 추가 -->
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
						</div></td>
					</tr>
				</table>
			</form>
		</div>
	</div>	
</body>
</html>
