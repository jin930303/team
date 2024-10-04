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
<table border="1" width="650px" align="center">
	<tr>
		<th colspan="5" style="text-align: left;">[${list.tab}] ${list.title}</th><th colspan="3">${list.nickname}</th>
	</tr>	
	<tr>	
		<td>글번호</td><td>${list.cnum}</td><td>작성일</td><td>${list.cdate}</td><td>추천</td><th>${list.clike}</th><td>조회</td><td>${list.ccnt}</td>
	</tr>
	<tr>	
		<td colspan="8" style="text-align: left;"><img src="./image/${list.cimage}" width="50%" height="50%"><br><pre>${list.ccontents}</pre>
		</td>
	</tr>
	<tr>	
		<td colspan="8">
			<input type="button" onclick="location.href='boardlike?cnum=${list.cnum}'" value="좋아요">
			<input type="button" onclick="location.href='boardhate?cnum=${list.cnum}'" value="싫어요">
		</td>
	</tr>
	<tr>	
		<td colspan="8">
			<input type="button" onclick="location.href='board'" value="목록">
			<input type="button" onclick="location.href='boardupdateview?cnum=${list.cnum}'" value="수정하기">
			<input type="button" onclick="location.href='boarddelete?cnum=${list.cnum}'" value="삭제학기">
		</td>
	</tr>

<tr>
	<th colspan="8" style="text-align:left;">댓글</th>
</tr>
<c:forEach var="reply" items="${reply}">
    <tr>
		<td colspan="2">${reply.nickname}</td>
		<td colspan="6" style="text-align: left;">☞ ${reply.ccontents}</td>
	</tr>
</c:forEach>
<form action="boardreplysave" method="post">
<input type="hidden" value="${list.cnum}" name="cnum" readonly>
<input type="hidden" value="${list.cgroup}" name="cgroup" readonly>
<input type="hidden" value="${list.step}" name="step" readonly>
<input type="hidden" value="${list.indent}" name="indent" readonly>
<tr>
	<td colspan="8" align="center">
		<textarea rows="1" cols="60" name="ccontents"></textarea>
		<input type="submit" value="댓글등록">
		<input type="reset" value="작성취소">
	</td>
</tr>
</form>
</table>
</body>
</html>