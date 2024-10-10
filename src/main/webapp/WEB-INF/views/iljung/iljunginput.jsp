<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th{
    text-align: center;
}
td{
    text-align: left;
}
</style>
<meta charset="UTF-8">
<title>일정 입력</title>
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
</head>
<body onload="toggleStateOptions(); toggleScoreFields();">  <!-- 페이지 로드 시 상태 체크 -->
<form action="iljungsave" method="post">
<table border="1" align="center" width="350px">
<caption><h3>일정 입력</h3></caption>
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
        <td colspan="3">
            <select name="gamestate" onchange="toggleScoreFields()" required>
                <option value="진행">진행</option>
                <option value="취소">취소</option>
                <option value="예정">예정</option>
            </select>
        </td>	
	</tr>
    
    <tr>
		<th>경기일자</th>
        <td colspan="3">
            <input type="date" name="gamedate" required>
        </td>
	</tr>
	
	<tr>
        <th>홈팀</th>
        <td colspan="3">
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
        <td id="homeScoreField" colspan="3">
            <input type="number" name="homescore" style="width:50px" value="0">
        </td>
	</tr>
	
	<tr>
		<th>원정팀</th>
        <td colspan="3">
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
        <td id="awayScoreField" colspan="3">
            <input type="number" name="awayscore" style="width:50px" value="0">
        </td>
    </tr>
    
    <tr>
        <th colspan="8">
            <input type="submit" value="작성완료">
            <input type="reset" value="작성취소">
            <input type="button" onclick="location.href='iljung'" value="목록">
        </th>
    </tr>
    
</table>
</form>
</body>
</html>