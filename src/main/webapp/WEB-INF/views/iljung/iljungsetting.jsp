<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
    function deliljung(gamedate, gameresult) {
        if (confirm('삭제하시면 복구할 수 없습니다.\n정말로 삭제하시겠습니까?')) {
            location.href = 'iljungdelete?gamedate=' + gamedate + '&gameresult=' + gameresult;
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
.ascdesc {
	text-align: right;
}

.main-container {
	flex: 1;
	/*width: 100%;*/
    max-width: 1000px;
    padding: 20px;
    padding-left: 60px;
    padding-right: 60px;
    border-right: 1px solid #ddd;  /*목차 - 게시판 사이 선*/
    border-left: 1px solid #ddd;  /*목차 - 게시판 사이 선*/
}

.title h1 {
    text-align: left;
    padding: 30px;
    border-bottom: 2px solid #be241c;
}

.main-container table {
    width: 100%; /* 테이블 너비 100% */
    margin-top: 10px; /* 상단 간격 */
    border-collapse: collapse; /* 테이블 경계 겹치지 않도록 */
    text-align: center;
}

.main-container table tr th, 
.main-container table tr td {
    padding: 15px;
    text-align: center; /* 모든 셀의 정렬을 왼쪽으로 */
    vertical-align: middle; /* 수직 가운데 정렬 */
    border: none;
}

/* tr 사이 선*/
.main-container table tr{
	padding: 28px;
	border-bottom: 1px solid #ddd;
	transition: border-bottom 0.3s ease;
	transition: background-color 0.3s ease;
}

.main-container table tr:last-child {
	border-bottom: none;
}

/* 게시판 th td 배경 */
.main-container th {
	background-color: #f4f4f4;
}

.main-container table tbody tr:hover {
	background-color: #f9f4f4;
	border-bottom: 1.5px solid #be241c;
	cursor: pointer;
}
/* 중복확인 버튼 스타일 */
input[type="button"] {
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
input[type="button"] {
	background-color: #8e1a14;
}

.submitbutton {
	text-align: center;
}
</style>

<!-- 페이지 번호 -->
<style type="text/css">
/*페이지*/
.pagination {
    text-align: center;
    margin-top: 20px;
}

.pagination a {
    margin: 0 5px;
    text-decoration: none;
    padding: 5px 10px;
    border: 1px solid #ddd;
    color: #333;
}

.pagination a:hover {
    background-color: #ddd;
}

.pagination .current {
    font-weight: bold;
    color: red;
}
</style>
<meta charset="UTF-8">
<title>KBO 일정</title>
</head>
<body>
<div class="flex_container">
	<!-- 사이드 메뉴바 -->
	<div class="sidebar_container">
		<div class="sidebar_title"><h2>경기일정</h2></div>
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
					<tr>
						<th>순위</th><th>팀</th><th>승</th><th>패</th><th>무</th><th>승률</th>
					</tr>
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
				</table>
			</div>
		</aside>
	</div>
	<!-- 메인 콘텐츠 -->
	<main class="main-container">
		<div class="title">
			<h1>KBO 일정 UPDATE</h1>
		</div>
		<table>
			<thead>
				<tr>
					<th>경기날짜</th>
					<th>경기내용</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="iljung">
					<tr>
						<td>${iljung.gamedate}</td>
						<td>${iljung.gameresult}</td>
						<td>
							<input type="button" value="수정" onclick="location.href='iljungupdateview?gamedate=${iljung.gamedate}&&gameresult=${iljung.gameresult}'">
							<input type="button" value="삭제" onclick="deliljung('${iljung.gamedate}', '${iljung.gameresult}')">
						</td>
				    </tr>
				</c:forEach>
			</tbody>
		</table>
			
<!-- 페이징 -->
		<div class="pagination">		   
			<!-- '이전' 화살표 (처음 페이지로 이동) -->
		    <c:if test="${paging.startPage > 1}">
		        <a href="iljungsetting?nowPage=1&cntPerPage=${paging.cntPerPage}">&laquo;</a>
		    </c:if>
		
		    <!-- '이전' 화살표 (10페이지 이전으로 이동) -->
		    <c:if test="${paging.startPage > 10}">
		        <a href="iljungsetting?nowPage=${paging.startPage - 10}&cntPerPage=${paging.cntPerPage}">&lt;</a>
		    </c:if>
		
		    <!-- 페이지 번호 목록 -->
		    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
		        <c:choose>
		            <c:when test="${p == paging.nowPage}">
		                <b><span class="current">${p}</span></b>
		            </c:when>
		            <c:otherwise>
		                <a href="iljungsetting?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
		            </c:otherwise>
		        </c:choose>
		    </c:forEach>
		
		    <!-- '다음' 화살표 (10페이지 다음으로 이동) -->
		    <c:if test="${paging.endPage + 10 <= paging.lastPage}">
		        <a href="iljungsetting?nowPage=${paging.startPage + 10}&cntPerPage=${paging.cntPerPage}">&gt;</a>
		    </c:if>
		
		    <!-- '다음' 화살표 (마지막 페이지로 이동) -->
		    <c:if test="${paging.endPage < paging.lastPage}">
		        <a href="iljungsetting?nowPage=${paging.lastPage}&cntPerPage=${paging.cntPerPage}">&raquo;</a>
		    </c:if>
		</div>	
			   
<!-- 하단 버튼-->
		<div class="submitbutton">
			<input type="button" onclick="location.href='iljung'" value="돌아가기">
		</div>
	</main>
</div>
</body>
</html>