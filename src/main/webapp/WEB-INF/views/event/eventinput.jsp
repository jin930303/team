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
<form action="eventsave" method="post" enctype="multipart/form-data">
<table border="1" align="center" width="1500px">
<caption><h3>이벤트 입력</h3></caption>
	<tr>
		<th>제목</th>
		<td style="text-align: left;">
			<input type="text" name="etitle" style="width:1250px" required="required">
			<input type="hidden" name="id" value="admin" readonly>
			<input type="hidden" name="nickname" value="관리자" readonly>
		</td>
	</tr>
	<tr>
		<th>내용</th>
		<td style="text-align: left;">
			<textarea rows="20" cols="175px" name="econtents" required="required">default</textarea>
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
</form>
</body>
</html>