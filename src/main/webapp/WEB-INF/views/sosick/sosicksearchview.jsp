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
<meta charset="UTF-8">
<title>
</title>
</head>
<body>
<table border="1" width="1500px" align="center">
<caption><h2>야구소식</h2></caption>
	<tr>
		<th>번호</th><th style="border: 600px;">제목</th><th>작성자</th><th>작성일</th><th>조회</th>
	</tr>
<c:forEach items="${list}" var="sosick">
	<tr>
		<td>${sosick.snum}</td><td style="text-align: left; border: 600px;"><a href="sosickdetail?snum=${sosick.snum}">[${sosick.stag}] ${sosick.stitle}</a></td>
		<td>${sosick.nickname}</td><td>${sosick.sdate}</td><td>${sosick.scnt}</td>
	</tr>
</c:forEach>
<!-- 페이징처리 4444444444-->
<tr style="border-left: none;border-right: none;border-bottom: none">
   <td colspan="8" style="text-align: center;">
   
   <c:if test="${paging.startPage!=1 }">
      <a href="sosicksearchview?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}"></a>
   </c:if>   
      <c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b><span style="color: red;">${p}</span></b>
            </c:when>   
            <c:when test="${p != paging.nowPage }">
               <a href="sosicksearchview?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
            </c:when>   
         </c:choose>
      </c:forEach>
      
      <c:if test="${paging.endPage != paging.lastPage}">
      <a href="sosicksearchview?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage }">  </a>
   </c:if>
   
   </td>
</tr>
<!-- 페이징처리 4444444444-->
	<tr>
		<td colspan="7" align="left">
			<form action="sosicksearchsave" method="post">
				<select name="sosickkey" >
					<option value="stitle">제목
					<option value="scontents">내용
					<option value="nickname">글쓴이
				</select>
				<input type="text" name="svalue" style="width: 250px" placeholder="검색어를 입력해주세요.">
				<input type="submit" value="찾기">
				<input type="button" onclick="location.href='sosickinput'" value="글쓰기">
				<input type="button" onclick="location.href='sosickboard'" value="목록">
			</form>
		</td>
	</tr>
</table>
</body>
</html>