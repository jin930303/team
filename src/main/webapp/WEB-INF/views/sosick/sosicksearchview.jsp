<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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


.kborank table tbody tr:hover {
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

.title {
	display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 2px solid #be241c;
    padding: 30px;
}

/* 왼쪽 정렬된 공지사항 텍스트 */
.title h1 {
	text-align: left;
    margin: 0;
}

/* 오른쪽 정렬된 ascdesc */
.ascdesc {
	text-align: right;
    font-size: 1em;
    margin-bottom: 5px;
}

/* ascdesc 내부 링크 스타일 */
.ascdesc a {
	text-decoration: none;
	color: #333;
    margin: 0 3px;
}

/* ascdesc 링크 호버 효과 */
.ascdesc a:hover {
	color: #be241c;
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
    text-align: center;
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

<!-- 검색 -->
<style type="text/css">

/* 검색 영역을 가운데에 배치하는 컨테이너 */
.search-bar {
	padding-top: 25px;
    display: flex;
    justify-content: center; /* 검색창을 가운데 정렬 */
    align-items: center;
    margin-bottom: 20px;
}

/* 검색 옵션 select 필드의 컨테이너 */
.search-container {
    display: flex;
    gap: 10px; /* select 필드 간의 간격 */
}

.search-container select {
	flex:1;
    width: 30%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    transition: border-color 0.3s ease;
}

.search-container select:hover {
    border-color: #be241c;
}

.search-container select:focus {
    border-color: #be241c;
}

.search-bar input[type="text"] {
	border: 1px solid #ddd;
	width: 45%;
	padding: 10px;
	border-radius: 4px;
	margin-left:10px;
	transition: border-color 0.3s ease;
}
.search-bar input[type="text"]:hover {
	border-color: #be241c;
}
.search-bar input[type="text"]:focus {
	border-color: #be241c;
}

/* 검색 버튼 */
.search-bar button,
.search-bar input[type="button"] {
    padding: 10px 20px;
    background-color: #be241c;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin-left: 10px; /* 검색창과 버튼 사이의 간격 */
    transition: background-color 0.3s ease;
}

.search-bar button:hover,
.search-bar input[type="button"]:hover {
    background-color: #8e1a14;
}
</style>
<meta charset="UTF-8">
<title>
</title>
</head>
<body>
<div class="flex_container">
<!-- 사이드 메뉴바 -->
	<div class="sidebar_container">
		<div class="sidebar_title"><h2>야구소식</h2></div>
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
		<c:choose>
			<c:when test="${empty list}">
				<th colspan="5" style="text-align: right;">
					최신 <a href="sosickdayup" style="margin-right: 3px;">↑ </a><a href="sosickdaydown" style="margin-right: 5px;">↓ </a> 
					조회수 <a href="sosickviewup" style="margin-right: 3px;">↑ </a><a href="sosickviewdown" style="margin-right: 5px;">↓ </a>
				</th>
			</c:when>
			<c:otherwise>
				<td colspan="2" style="text-align: left; padding-left: 10px;">"${svalue}"로 검색한 결과</td>
				<th colspan="3" style="text-align: right;">
					최신 <a href="sosickdayup" style="margin-right: 3px;">↑ </a><a href="sosickdaydown" style="margin-right: 5px;">↓ </a> 
					조회수 <a href="sosickviewup" style="margin-right: 3px;">↑ </a><a href="sosickviewdown" style="margin-right: 5px;">↓ </a>
				</th>
			</c:otherwise>
		</c:choose>
		<table>
			<tr>
				<th>번 호</th>
				<th>제 목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		
			<c:choose>
			    <c:when test="${empty list}">
					<tr>
						<td colspan="6">"${svalue}"로 검색한 결과가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>	
					<c:forEach items="${list}" var="sosick">
						<tr>
							<td>${sosick.snum}</td>
							<td><a href="sosickdetail?snum=${sosick.snum}">[${sosick.stag}] ${sosick.stitle}</a></td>
							<td>${sosick.nickname}</td>
							<td>${sosick.sdate}</td>
							<td>${sosick.scnt}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
		
<!-- 페이징 -->
		<div class="pagination">
		   <c:if test="${paging.startPage!=1 }">
		      <a href="sosicksearchview?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}"></a>
		   </c:if>   
		      <c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
		         <c:choose>
		            <c:when test="${p == paging.nowPage }">
		               <b><span style="color: red;">${p}</span></b>
		            </c:when>   
		            <c:when test="${p != paging.nowPage }">
		               <a href="sosicksearchview?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
		            </c:when>   
		         </c:choose>
		      </c:forEach>
		      
		      <c:if test="${paging.endPage != paging.lastPage}">
		      <a href="sosicksearchview?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage }">  </a>
		   </c:if>
		</div>
		
<!-- 하단 검색 -->
		<form action="sosicksearchsave" method="post" class="search-bar">
			<div class="search-container">
				<select name="sosickkey" >
					<option value="stitle">제목
					<option value="scontents">내용
					<option value="nickname">글쓴이
				</select>
			</div>
				<input type="text" name="svalue" style="width: 250px" placeholder="검색어를 입력해주세요.">
				<button type="submit">검색</button>
			<c:choose>
				<c:when test="${adminloginstate==true}">
					<input type="button" onclick="location.href='sosickinput'" value="글쓰기">
					<input type="button" onclick="location.href='sosickboard'" value="목록">
				</c:when>
				<c:otherwise>
					<input type="button" onclick="location.href='sosickboard'" value="목록">
				</c:otherwise>
			</c:choose>
		</form>
	</main>
</div>
</body>
</html>