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
<form action="gongjisave" method="post" enctype="multipart/form-data">
<table border="1" align="center" width="1500px">
<caption><h3>공지사항 입력</h3></caption>
	<tr>
		<th>제목</th>
		<td style="text-align: left;">
			<input type="text" name="gtitle" style="width:1250px" required="required">
			<input type="hidden" name="id" value="${list.id}" readonly>
			<input type="hidden" name="nickname" value="${list.nickname}" readonly>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td style="text-align: left;">
			<textarea rows="20" cols="175px" name="gcontents" required="required"></textarea>
		</td>
	</tr>
	<tr>
		<th>파일첨부</th>
		<td>
			<input type="file" name="gimage" required="required">
		</td>
	</tr>
	<tr>
	<td colspan="2">
	<input type="submit" value="작성완료">
	<input type="reset" value="작성취소">
	<input type="button" onclick="location.href='gongjiboard'" value="목록">
	</td>
	</tr>
</table>
</form>
</body>
</html>