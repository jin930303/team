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
<caption><h2>자유게시판</h2></caption>
	<tr>
		<th>번호</th><th colspan="2">제목</th><th>작성자</th><th>작성일</th><th>조회</th>
	</tr>
<c:forEach items="${list}" var="board">
	<tr>
		<td>${board.cnum}</td>
		<td>${board.tab}</td><td style="text-align: left;"><a href="boarddetail?cnum=${board.cnum}">${board.title}</a></td>
		<td>${board.nickname}</td><td>${board.cdate}</td><td>${board.ccnt}</td>
	</tr>
</c:forEach>
<!-- 페이징처리 4444444444-->
<tr style="border-left: none;border-right: none;border-bottom: none">
   <td colspan="8" style="text-align: center;">
   
   <c:if test="${paging.startPage!=1 }">
      <a href="board?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}"></a>
   </c:if>   
      <c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b><span style="color: red;">${p}</span></b>
            </c:when>   
            <c:when test="${p != paging.nowPage }">
               <a href="board?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
            </c:when>   
         </c:choose>
      </c:forEach>
      
      <c:if test="${paging.endPage != paging.lastPage}">
      <a href="board?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage }">  </a>
   </c:if>
   
   </td>
</tr>
<!-- 페이징처리 4444444444-->
	<tr>
		<td colspan="7" align="left">
			<form action="boardsearchsave" method="post">
				<select name="boardkey" >
					<option value="ctitle">제목
					<option value="ccontents">내용
					<option value="nickname">글쓴이
				</select>
				<input type="text" name="svalue" style="width: 250px" placeholder="검색어를 입력해주세요.">
				<input type="submit" value="찾기">
				<input type="button" onclick="location.href='board'" value="목록">
				<input type="button" onclick="location.href='boardinput'" value="글쓰기">
			</form>
		</td>
	</tr>
</table>
</body>
</html>