<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function toggleStateOptions() {
    var fileonoff = document.querySelector('select[name="fileonoff"]').value;  // 선택된 select 값
    var imagestateon = document.getElementById("imagestateon");
    var imagestateoff = document.getElementById("imagestateoff");

    if (fileonoff === 'fileo') {
        imagestateon.style.display = '';  // 파일첨부 시 보이기
        imagestateoff.style.display = 'none';  
    } else {
        imagestateon.style.display = 'none';  // 파일없음 선택 시 숨기기
        imagestateoff.style.display = '';  
        document.querySelector('input[name="cimage"]').value = "fileno";
    }
}

window.onload = function() {
    toggleStateOptions();  // 페이지 로드 시 초기 상태 설정
};
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

	width: 350px;
	border: 1px solid #ddd;
	border-top: none; /* 타이틀과 경계선 중복 방지 */
	padding: 20px;
    margin-right: 20px;
    border-bottom-right-radius: 10px;
    border-bottom-left-radius: 10px;
	
}
.sidebar_container {
	width: 350px;
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

.kborank {
	font-size: 13px;
}

.kborank table {
    width: 100%; /* 테이블 너비 100% */
    margin-top: 10px; /* 상단 간격 */
    border-collapse: collapse; /* 테이블 경계 겹치지 않도록 */
    text-align: center;
}

.kborank table th {
	background-color: #f4f4f4;
}

.kborank table tr th, 
.kborank table tr td {
    padding: 15px;
    text-align: center; /* 모든 셀의 정렬을 왼쪽으로 */
    vertical-align: middle; /* 수직 가운데 정렬 */
    border: none;
}


.kborank table tr:hover {
	background-color: #f9f4f4;
	border-bottom: 1.5px solid #be241c;
}

/* tr 사이 선*/
.kborank table tr{
	padding: 28px;
	border-bottom: 1px solid #ddd;
	transition: border-bottom 0.3s ease;
	transition: background-color 0.3s ease;
}

.kborank table tr:last-child {
	border-bottom: none;
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
/* 테이블 스타일 */
.main-container {
	flex: 1;
	/*width: 100%;*/
    max-width: 1000px;
    padding: 20px 60px;
    border-right: 1px solid #ddd;  /*목차 - 게시판 사이 선*/
    border-left: 1px solid #ddd;  /*목차 - 게시판 사이 선*/
}

.main-container table {
    width: 100%; /* 테이블 너비 100% */
    margin-top: 10px; /* 상단 간격 */
    border-collapse: collapse; /* 테이블 경계 겹치지 않도록 */
    text-align: center;
}

caption {
	color: black;
	text-align: center;
}

.main-container table tr th, 
.main-container table tr td {
    padding: 14px;
    text-align: left; /* 모든 셀의 정렬을 왼쪽으로 */
    vertical-align: middle; /* 수직 가운데 정렬 */
    border-bottom: 1px solid #ddd; /* 테두리 유지 */
    border: none;
}

/* tr 사이 선*/
.main-container table tr{
	padding: 24px;
	border-bottom: 1px solid #ddd;
}

.main-container table tr:last-child {
	border-bottom: none;
}

/* input 필드 공통 스타일 */
table input[type="text"],
table input[type="file"],
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
table input[type="file"] {
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
table input[type="checkbox"] {
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
table input[type="text"]:hover,
table input[type="file"]:hover,
textarea:hover,
select:hover {
    border-color: #be241c; /* 포커스 시 붉은색 테두리 */
    outline: none; /* 포커스 시 외곽선 제거 */
}

/* input 필드 포커스 시 스타일 */
table input[type="text"]:focus,
table input[type="file"]:focus,
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
</style>

<meta charset="UTF-8">
<title>
</title>
</head>
<body onload="toggleStateOptions();">  <!-- 페이지 로드 시 상태 체크 -->
<div class="flex_container">
	<!-- 사이드 메뉴바 -->
	<div class="sidebar_container">
		<div class="sidebar_title"><h2>자유게시판 WRITE</h2></div>
		<aside class="sidebar">
				<ul>
					<li><a href="gongjiboard">공지사항</a></li>
					<li><a href="eventboard">이벤트</a></li>
					<li><a href="board">자유게시판</a></li>
					<li><a href="sosickboard">야구소식</a></li>
					<li><a href="iljung">경기일정</a></li>
				</ul>
			<div class="kborank">
				<h4>2024시즌 KBO순위</h4>
				<table>
					<thead>
						<tr>
							<th>순위</th><th>팀</th><th>승</th><th>패</th><th>무</th><th>승률</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td><td>기아</td><td>87</td><td>55</td><td>2</td><td>0.613</td>
						</tr>
						<tr>
							<td>2</td><td>삼성</td><td>78</td><td>64</td><td>2</td><td>0.549</td>
						</tr>
						<tr>
							<td>3</td><td>LG</td><td>76</td><td>66</td><td>2</td><td>0.535</td>
						</tr>
						<tr>
							<td>4</td><td>두산</td><td>74</td><td>68</td><td>2</td><td>0.521</td>
						</tr>
						<tr>
							<td>5</td><td>KT</td><td>72</td><td>70</td><td>2</td><td>0.507</td>
						</tr>
						<tr>
							<td>6</td><td>SSG</td><td>72</td><td>70</td><td>2</td><td>0.507</td>
						</tr>
						<tr>
							<td>7</td><td>롯데</td><td>66</td><td>74</td><td>4</td><td>0.471</td>
						</tr>
						<tr>
							<td>8</td><td>한화</td><td>66</td><td>76</td><td>2</td><td>0.465</td>
						</tr>
						<tr>
							<td>9</td><td>NC</td><td>61</td><td>81</td><td>2</td><td>0.430</td>
						</tr>
						<tr>
							<td>10</td><td>키움</td><td>58</td><td>86</td><td>0</td><td>0.403</td>
						</tr>
					</tbody>
				</table>
			</div>
		</aside>
	</div>
	
<!-- 메인 콘텐츠 -->
	<main class="main-container">
		<form action="boardsave" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<th>태그</th>
					<td>
						<select name="tag">
							<option value="국내야구">국내야구
							<option value="해외야구">해외야구
							<option value="유머">유머
							<option value="군사">군사
							<option value="사회">사회
							<option value="경제">경제
							<option value="기타">기타
						</select>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="title" required="required">
						<c:choose>
							<c:when test="${adminloginstate==true}">
								<input type="hidden" name="nickname" value="관리자" readonly>
							</c:when>
							<c:when test="${loginstate==true}">
								<input type="hidden" name="nickname" value="${sessionScope.dto3.nickname}" readonly>
							</c:when>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="20" cols="100px" name="ccontents" required="required"></textarea>
					</td>
				</tr>
				
				<tr>
					<th>파일첨부</th>
					<td id="imagestateon">
						<select name="fileonoff" onchange="toggleStateOptions()">
							<option value="fileo">파일첨부
							<option value="filex">파일없음
						</select>
						<input type="file" name="cimage">
					</td>
					<td id="imagestateoff" style="display: none;">
						첨부된 파일없음
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<div class="submitbutton">
							<input type="submit" value="작성완료">
							<input type="reset" value="작성취소">
							<input type="button" onclick="location.href='board'" value="목록">
						</div>
					</td>
				</tr>
			</table>
		</form>
	</main>
</div>
</body>
</html>