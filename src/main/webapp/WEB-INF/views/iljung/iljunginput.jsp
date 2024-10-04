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
<form action="iljungsave" method="post">
<table border="1" align="center" width="800px">
<caption><h3>일정 입력</h3></caption>
	<tr>
		<th>경기일자</th><th>홈팀</th><th>홈팀 득점</th><th>원정팀</th><th>원정팀 득점</th><th>경기진행</th>
	</tr>
	<tr>
		<td>
			<input type="date" name="gamedate" required>
		</td>
		<td>
			<select name="home" required>
				<option value="기아">기아
				<option value="삼성">삼성
				<option value="LG">LG
				<option value="두산">두산
				<option value="KT">KT
				<option value="SSG">SSG
				<option value="롯데">롯데
				<option value="NC">NC
				<option value="한화">한화
				<option value="키움">키움
			</select>
		</td>
		<td>
			<input type="number" name="homescore" style="width:150px">
		</td>
		<td>
			<select name="away" required>
				<option value="기아">기아
				<option value="삼성">삼성
				<option value="LG">LG
				<option value="두산">두산
				<option value="KT">KT
				<option value="SSG">SSG
				<option value="롯데">롯데
				<option value="NC">NC
				<option value="한화">한화
				<option value="키움">키움
			</select>
		</td>
 		<td>
			<input type="number" name="awayscore" style="width:150px">
		</td>
		<td>
			<select name="gamestate" required>
				<option value="진행">진행
				<option value="취소">취소
			</select>
		</td>
	</tr>
	<tr>
	<td colspan="6">
	<input type="submit" value="작성완료">
	<input type="reset" value="작성취소">
	<input type="button" onclick="location.href='iljung'" value="목록">
	</td>
	</tr>
</table>
</form>
</body>
</html>