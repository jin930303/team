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
<table border="1" width="1000px" align="center">
<caption><h3>이벤트</h3></caption>
	<tr>
		<th>제목</th><td colspan="3">[${list.estate}] ${list.etitle}</td>
	</tr>	
	<tr>	
		<th>작성일시</th><td>${list.edate}</td><th>조회수</th><td>${list.ecnt}회</td>
	</tr>	
	<tr>    
	    <c:choose>
	        <c:when test="${list.econtents=='default'}">
	            <td colspan="4" style="text-align: center;">
	                <img src="./image/${list.eimaged}" style="display: block; margin: auto;">
	            </td>
	        </c:when>
	        <c:otherwise>
	            <td colspan="4" style="text-align: center;">
	                <img src="./image/${list.eimaged}" style="display: block; margin: auto;">
	                <br>
	                <pre>${list.econtents}</pre>
	            </td>
	        </c:otherwise>
	    </c:choose>
	</tr>
<c:choose>
<c:when test="${adminloginstate==true}">
	<tr>	
		<td colspan="4">
			<input type="button" onclick="location.href='eventboard'" value="목록">
			<input type="button" onclick="location.href='eventdelete?evnum=${list.evnum}'" value="삭제">
			<input type="button" onclick="location.href='eventupdateview?evnum=${list.evnum}'" value="수정">
		</td>
	</tr>
</c:when>
<c:otherwise>
	<tr>	
		<td colspan="4">
			<input type="button" onclick="location.href='eventboard'" value="목록">
		</td>
	</tr>
</c:otherwise>
</c:choose>
</table>
</body>
</html>