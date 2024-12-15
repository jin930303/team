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

<link href="./css/iljung/iljungupdateview.css" rel="stylesheet"/>
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