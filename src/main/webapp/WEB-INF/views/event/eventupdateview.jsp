<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function toggleStateOptions1() {
    var mainimageonoff = document.querySelector('select[name="mainimageonoff"]').value;  // 선택된 select 값
    var mainimagestateon = document.getElementById("mainimagestateon");
    var mainimagestateoff = document.getElementById("mainimagestateoff");

    if (mainimageonoff === 'fileo') {
    	mainimagestateon.style.display = '';  // 파일첨부 시 보이기
    	mainimagestateoff.style.display = 'none';
    } 
    else {
    	mainimagestateon.style.display = 'none';  // 파일없음 선택 시 숨기기
    	mainimagestateoff.style.display = '';  
    }
}

function toggleStateOptions2() {
    var detailimageonoff = document.querySelector('select[name="detailimageonoff"]').value;  // 선택된 select 값
    var detailimagestateon = document.getElementById("detailimagestateon");
    var detailimagestateoff = document.getElementById("detailimagestateoff");

    if (detailimageonoff === 'fileo') {
    	detailimagestateon.style.display = '';  // 파일첨부 시 보이기
    	detailimagestateoff.style.display = 'none';
    } 
    else {
    	detailimagestateon.style.display = 'none';  // 파일없음 선택 시 숨기기
    	detailimagestateoff.style.display = '';  
    }
}

window.onload = function() {
    toggleStateOptions1();  // 페이지 로드 시 초기 상태 설정
    toggleStateOptions2();
};
</script>
<link href="./css/event/eventupdateview.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>
</title>
</head>
<body>
<div class="flex_container">
<!-- 사이드 메뉴바 -->
	<div class="sidebar_container">
		<div class="sidebar_title"><h2>EVENT</h2></div>
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
		<form action="eventupdate" method="post" enctype="multipart/form-data">
			<div class="title">
				<h1>EVENT UPDATE</h1>
			</div>
			<table>
				<tr>
					<th>제목</th>
					<td colspan="2">
						<input type="text" name="etitle" value="${list.etitle}" required="required">
						<input type="hidden" name="id" value="admin" readonly>
						<input type="hidden" name="nickname" value="관리자" readonly>
						<input type="hidden" name="evnum" value="${list.evnum}" readonly>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td colspan="2">
						<textarea rows="20" cols="100px" name="econtents" required="required">${list.econtents}</textarea>
					</td>
				</tr>
				<tr>
					<th>메인이미지</th>
					<td id="mainimagestateon">
						<select name="mainimageonoff" onchange="toggleStateOptions1()">
							<option value="fileo">이미지 변경 필요
							<option value="filex">이미지 변경 불필요
						</select>
						<input type="file" name="eimagemu">
					</td>
				</tr>
				
				<tr>
					<th>상세이미지</th>
					<td id="detailimagestateon">
						<select name="detailimageonoff" onchange="toggleStateOptions2()">
							<option value="fileo">이미지 변경 필요
							<option value="filex">이미지 변경 불필요
						</select>
						<input type="file" name="eimagedu">
					</td>
				</tr>
				
				<tr>
					<th>진행상태</th>
					<td colspan="2">
						<select name="estate">
							<option value="진행중">진행중
							<option value="종료">종료
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="3">
					<div class="submitbutton">
						<input type="submit" value="수정완료">
						<input type="reset" value="다시작성">
						<input type="button" onclick="location.href='eventboard'" value="목록">
					</div>
					</td>
				</tr>
			</table>
		</form>
	</main>
</div>
</body>
</html>