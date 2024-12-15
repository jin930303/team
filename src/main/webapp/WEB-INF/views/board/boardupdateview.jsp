<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    }
}

window.onload = function() {
    toggleStateOptions();  // 페이지 로드 시 초기 상태 설정
};
</script>
<link href="./css/board/boardupdateview.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>
</title>
</head>
<body>
<div class="flex_container">
<!-- 사이드 메뉴바 -->
	<div class="sidebar_container">
		<div class="sidebar_title"><h2>자유게시판</h2></div>
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
		<form action="boardupdate" method="post" enctype="multipart/form-data">
			<div class="title">
				<h1>자유게시판 UPDATE</h1>
			</div>
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
						<input type="hidden" name="cnum" value="${list.cnum}" readonly>
						<input type="text" name="title" value="${list.title}" required="required">
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
						<textarea rows="20" cols="100px" name="ccontents" required="required">${list.ccontents}</textarea>
					</td>
				</tr>
				
				<tr>
					<th rowspan="2">파일첨부</th>
					<td id="imagestateon">
						<select name="fileonoff" onchange="toggleStateOptions()">
							<option value="fileo">파일첨부
							<option value="filex">파일없음
						</select>
						<input type="file" name="cimage">
					</td>
					<td id="imagestateoff">
						첨부된 파일없음
					</td>
				</tr>
				
				<tr>
					<td colspan="2">
						<div class="submitbutton">
							<input type="submit" value="수정완료">
							<input type="reset" value="다시작성">
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