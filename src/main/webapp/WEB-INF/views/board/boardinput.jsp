<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th, td{
text-align: center
}
</style>
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

<meta charset="UTF-8">
<title>
</title>
</head>
<body onload="toggleStateOptions();">  <!-- 페이지 로드 시 상태 체크 -->
<div class="container">
<aside class="sidebar">
	<h2>커뮤니티</h2>
		<ul>
			<li><a href="gongjiboard">공지사항</a></li>
			<li><a href="eventboard">이벤트</a></li>
			<li><a href="board">자유게시판</a></li>
			<li><a href="sosickboard">야구소식</a></li>
			<li><a href="iljung">경기일정</a></li>
		</ul>
	<div class="kborank">
		<h3>2024시즌 KBO순위</h3>
		<table style="width:310px">
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
<div class="maindata">
<form action="boardsave" method="post" enctype="multipart/form-data">
<table border="1" align="center" width="800px">
<caption><h2>글쓰기</h2></caption>
	<tr height="35px">
		<th>태그</th>
		<td style="text-align: left;">
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

	<tr height="35px">
		<th>제목</th>
		<td style="text-align: left;">
			<input type="text" name="title" style="width:725px" required="required">
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
		<td style="text-align: left;">
			<textarea rows="20" cols="100px" name="ccontents" required="required"></textarea>
		</td>
	</tr>
	
	<tr height="35px">
		<th rowspan="2">파일첨부</th>
		<td>
			<select name="fileonoff" onchange="toggleStateOptions()">
				<option value="fileo">파일첨부
				<option value="filex">파일없음
			</select>
		</td>
	
	<tr height="35px">
		<td id="imagestateon">
			<input type="file" name="cimage">
		</td>
		<td id="imagestateoff" style="display: none;">
			첨부된 파일없음
		</td>
	</tr>
	
	<tr height="35px">
		<td colspan="2">
			<input type="submit" value="작성완료">
			<input type="reset" value="작성취소">
			<input type="button" onclick="location.href='board'" value="목록">
		</td>
	</tr>
</table>
</form>
</div></div>
</body>
</html>