<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			headerToolbar : {
				left : 'prev',
				center : 'title',
				right : 'next'
			},
			locale : 'ko', // 한국어 설정
			initialView : 'dayGridMonth',
			events : {
				url : 'gameiljung', // 서버에서 일정 데이터를 불러옴
				method : 'POST',
				dataType : 'json',
			},
			dayCellContent : function(info) {
				var number = document.createElement("a");
				number.classList.add("fc-daygrid-day-number");
				number.innerHTML = info.dayNumberText.replace("일", "").replace(
						"日", "");
				return {
					html : number.outerHTML
				};
			},
			eventDidMount : function(info) {
				// 이벤트 제목에 '취소'가 포함되어 있는지 확인
				if (info.event.title.includes("취소")) {
					info.el.style.backgroundColor = 'red';
					info.el.style.borderColor = 'red';
				} else if (info.event.title.includes("예정")) {
					info.el.style.backgroundColor = 'orange';
					info.el.style.borderColor = 'orange';
				}

				else if (info.event.title.includes("TB")
						|| info.event.title.includes("WC")
						|| info.event.title.includes("PO")
						|| info.event.title.includes("KS")) {
					info.el.style.backgroundColor = 'green';
					info.el.style.borderColor = 'green';
				}

			}
		});

		calendar.render();
	});
</script>
<link href="./css/iljung/iljung.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title></title>
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
		<div class="title">
			<h1>KBO 일정</h1>
		</div>
		<div class="calendar-container">
			<div id="calendar"></div>
		</div>
		<c:choose>
			<c:when test="${adminloginstate==true}">
				<div class="calendar-button">
					<input type="button" onclick="location.href='iljungsetting'" value="일정변경"> 
					<input type="button" onclick="location.href='iljunginput'" value="일정추가">
				</div>
			</c:when>
		</c:choose>
	</main>
</div>
</body>
</html>