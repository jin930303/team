<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
th,td{
text-align: center;
}
</style>
<meta charset="UTF-8">
<title>
</title>
</head>
<body>
<table border="1" width="1500px" align="center">
<caption><h3>야구소식</h3></caption>
	<tr>
		<th>제목</th><td style="text-align: left;">[${list.stag}] ${list.stitle}</td>
		<th>작성자</th><td>${list.nickname}</td>
	</tr>	
	<tr>	
		<th>작성일시</th><td>${list.sdate}</td><th>조회수</th><td>${list.scnt}</td>
	</tr>	
	<tr>	
		<td colspan="4" style="text-align: left;"><img src="./image/${list.simage}"><br><pre>${list.scontents}</pre></td>
	</tr>
	<tr>	
		<td colspan="4">
			<input type="button" onclick="location.href='sosickboard'" value="목록">
			<input type="button" onclick="location.href='sosickdelete?snum=${list.snum}'" value="삭제">
			<input type="button" onclick="location.href='sosickupdateview?snum=${list.snum}'" value="수정">
		</td>
		
	</tr>
</table>
</body>
</html>