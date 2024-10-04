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
<caption><h3>공지사항</h3></caption>
	<tr>
		<th>제목</th><td colspan="3">${list.gtitle}</td>
	</tr>	
	<tr>	
		<th>작성자</th><td colspan="3">${list.nickname}</td>
	</tr>
	<tr>	
		<th>작성일시</th><td>${list.gdate}</td><th>조회수</th><td>${list.gcnt}</td>
	</tr>	
	<tr>	
		<c:choose>
			<c:when test="${list.gimage ne null}">
				<td colspan="4" style="text-align: left;"><pre>${list.gcontents}</pre><br>
				<img src="./image/${list.gimage}"></td>
			</c:when>
			<c:otherwise>
				<td colspan="4" style="text-align: left;"><pre>${list.gcontents}</pre></td>
			</c:otherwise>
		</c:choose>
	</tr>
	<tr>	
		<td colspan="4">
			<input type="button" onclick="location.href='gongjiboard'" value="목록">
			<input type="button" onclick="location.href='gongjidelete?gnum=${list.gnum}'" value="삭제">
			<input type="button" onclick="location.href='gongjiupdateview?gnum=${list.gnum}'" value="수정">
		</td>
		
	</tr>
</table>
</body>
</html>