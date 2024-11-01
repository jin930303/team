<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function toggleStateOptions() {
    var leaguestate = document.getElementsByName("leaguestate")[0].value;
    var stateRow = document.getElementById("stateRow");
    
    if (leaguestate === '정규시즌') {
        stateRow.style.display = 'none';  // 정규시즌 선택 시 1~7차전 숨김
    } 
    else {
        stateRow.style.display = '';  // 정규시즌 이외 선택 시 보이기
    }
}

function toggleScoreFields() {
    var gamestate = document.getElementsByName("gamestate")[0].value;
    var homeScoreField = document.getElementById("homeScoreField");
    var awayScoreField = document.getElementById("awayScoreField");

    if (gamestate === '예정' || gamestate === '취소') {
        homeScoreField.style.display = 'none';  // 예정 또는 취소 시 숨김
        awayScoreField.style.display = 'none';  // 예정 또는 취소 시 숨김
    } else {
        homeScoreField.style.display = '';  // 진행 시 보이기
        awayScoreField.style.display = '';  // 진행 시 보이기
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

.title h1 {
    text-align: left;
    padding: 30px;
    border-bottom: 2px solid #be241c;
}

.main-container table tr th, 
.main-container table tr td {
    padding: 14px;
    text-align: left; /* 모든 셀의 정렬을 왼쪽으로 */
    vertical-align: middle; /* 수직 가운데 정렬 */
    border-bottom: 1px solid #ddd; /* 테두리 유지 */
    border: none;
}
.main-container table thead tr{
	background-color: #f4f4f4;
}

.main-container table thead td, 
.main-container table thead th {
	text-align: center;
	padding: 24px;
}


/* tr 사이 선*/
.main-container table tbody tr{
	padding: 24px;
	border-bottom: 1px solid #ddd;
}

.main-container table tbody tr:last-child {
	border-bottom: none;
}

/* input 필드 공통 스타일 */
table input[type="text"],
table input[type="file"],
table input[type="number"],
table input[type="date"],
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


/* input 필드 포커스 시 스타일 */
table input[type="text"]:hover,
table input[type="file"]:hover,
table input[type="number"]:hover,
table input[type="date"]:hover,
select:hover {
    border-color: #be241c; /* 포커스 시 붉은색 테두리 */
    outline: none; /* 포커스 시 외곽선 제거 */
}

/* input 필드 포커스 시 스타일 */
table input[type="text"]:focus,
table input[type="file"]:focus,
table input[type="number"]:focus,
table input[type="date"]:focus,
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
<title>일정 입력</title>
</head>
<body onload="toggleStateOptions(); toggleScoreFields();">  <!-- 페이지 로드 시 상태 체크 -->
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
		<form action="iljungupdate" method="post">
			<div class="title">
				<h1>KBO 일정 UPDATE</h1>
			</div>
			<table>
				<thead>
					<tr>
						<th>수정전 경기일정</th>
						<th>수정전 경기상태</th>
					</tr>
					<tr>
						<td>${list.gamedate}<input type="hidden" name="fgamedate" value="${list.gamedate}" readonly></td>
						<td>${list.gameresult}<input type="hidden" name="fgameresult" value="${list.gameresult}" readonly></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>경기구분</th>
						<td>
							<select name="leaguestate" onchange="toggleStateOptions()" required>
								<option value="정규시즌">정규시즌</option>
					            <option value="TB">타이브레이커</option>
					            <option value="WC">와일드카드</option>
					            <option value="준PO">준플레이오프</option>
					            <option value="PO">플레이오프</option>
					            <option value="KS">한국시리즈</option>
							</select>
				        </td>
				        <td id="stateRow">
				            <select name="state">
				                <option value="1">1차전</option>
				                <option value="2">2차전</option>
				                <option value="3">3차전</option>
				                <option value="4">4차전</option>
				                <option value="5">5차전</option>
				                <option value="6">6차전</option>
				                <option value="7">7차전</option>
				            </select>
				        </td>
					</tr>
					
					<tr>
						<th>경기진행상태</th>
				        <td>
				            <select name="gamestate" onchange="toggleScoreFields()" required>
				                <option value="진행">진행</option>
				                <option value="취소">취소</option>
				                <option value="예정">예정</option>
				            </select>
				        </td>	
					</tr>
				    
				    <tr>
						<th>경기일자</th>
				        <td>
				            <input type="date" name="gamedate" required>
				        </td>
					</tr>
					
					<tr>
				        <th>홈팀</th>
				        <td>
				            <select name="home" required>
				                <option value="기아">기아</option>
				                <option value="삼성">삼성</option>
				                <option value="LG">LG</option>
				                <option value="두산">두산</option>
				                <option value="KT">KT</option>
				                <option value="SSG">SSG</option>
				                <option value="롯데">롯데</option>
				                <option value="NC">NC</option>
				                <option value="한화">한화</option>
				                <option value="키움">키움</option>
				            </select>
				        </td>
					</tr>
					
					<tr>
				        <th>홈팀 득점</th>
				        <td id="homeScoreField">
				            <input type="number" name="homescore" value="0">
				        </td>
					</tr>
					
					<tr>
						<th>원정팀</th>
				        <td>
				            <select name="away" required>
				                <option value="기아">기아</option>
				                <option value="삼성">삼성</option>
				                <option value="LG">LG</option>
				                <option value="두산">두산</option>
				                <option value="KT">KT</option>
				                <option value="SSG">SSG</option>
				                <option value="롯데">롯데</option>
				                <option value="NC">NC</option>
				                <option value="한화">한화</option>
				                <option value="키움">키움</option>
				            </select>
				        </td>
					</tr>
					
				    <tr>
						<th>원정팀 득점</th>
				        <td id="awayScoreField">
				            <input type="number" name="awayscore" value="0">
				        </td>
				    </tr>
				    
				    <tr>
				        <th colspan="2">
					        <div class="submitbutton">
					            <input type="submit" value="작성완료">
					            <input type="reset" value="작성취소">
					            <input type="button" onclick="location.href='iljungsetting'" value="목록">
					        </div>
				        </th>
				    </tr>
			    </tbody>
			</table>
		</form>
	</main>
</div>
</body>
</html>