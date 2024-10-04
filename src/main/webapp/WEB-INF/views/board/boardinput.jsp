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
<title>Insert title here</title>
</head>
<body>
<form action="boardsave" method="post" enctype="multipart/form-data">
<table border="1" align="center" width="1500px">
<caption><h3>글쓰기</h3></caption>
	<tr>
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
	<tr>
		<th>제목</th>
		<td style="text-align: left;">
			<input type="text" name="title" style="width:1250px" required="required">
			<input type="hidden" name="nickname" value="${list.nickname}" readonly>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td style="text-align: left;">
			<textarea rows="20" cols="175px" name="ccontents" required="required"></textarea>
		</td>
	</tr>
		<tr>
		<th>파일첨부</th>
		<td>
			<input type="file" name="cimage" required="required">
		</td>
	</tr>
	<tr>
	<td colspan="2">
	<input type="submit" value="작성완료">
	<input type="reset" value="작성취소">
	<input type="button" onclick="location.href='board'" value="목록">
	</td>
	</tr>
</table>
</form>
</body>
</html>