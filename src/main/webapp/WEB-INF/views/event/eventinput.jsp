<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th, td{
text-align: center
}
</style>
<meta charset="UTF-8">
<title>
</title>
</head>
<body>
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
<form action="eventsave" method="post" enctype="multipart/form-data">
<table border="1" align="center" width="800px">
<caption><h3>이벤트 입력</h3></caption>
	<tr>
		<th>제목</th>
		<td style="text-align: left;">
			<input type="text" name="etitle" style="width:725px" required="required">
			<input type="hidden" name="id" value="admin" readonly>
			<input type="hidden" name="nickname" value="관리자" readonly>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td style="text-align: left;">
			<textarea rows="20" cols="100px" name="econtents" required="required">default</textarea>
		</td>
	</tr>
	<tr>
		<th>메인이미지</th>
		<td>
			<input type="file" name="eimagem" required="required">
		</td>
	</tr>
	<tr>
		<th>상세이미지</th>
		<td>
			<input type="file" name="eimaged" required="required">
		</td>
	</tr>
	<tr>
		<th>진행상태</th>
		<td>
			<select name="estate" >
				<option value="진행중">진행중
				<option value="종료">종료
			</select>
		</td>
	</tr>
	<tr>
	<td colspan="2">
	<input type="submit" value="작성완료">
	<input type="reset" value="작성취소">
	<input type="button" onclick="location.href='eventboard'" value="목록">
	</td>
	</tr>
</table>
</form></div></div>
</body>
</html>