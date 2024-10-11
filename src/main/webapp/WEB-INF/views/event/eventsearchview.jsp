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
<table border="1" width="1000px" align="center">
<caption><h2>Event</h2></caption>
<c:choose>
<c:when test="${adminloginstate==true}">
	<tr>
		<td align="left" colspan="3">
			<form action="eventsearchsave" method="post">
				<select name="eventkey" >
					<option value="etitle">제목
					<option value="econtents">내용
				</select>
				<input type="text" name="svalue" style="width: 250px" placeholder="검색어를 입력해주세요.">
				<input type="submit" value="찾기">
				<input type="button" onclick="location.href='eventinput'" value="추가">
				<input type="button" onclick="location.href='eventboard'" value="전체보기">
				<input type="button" onclick="location.href='eventing'" value="진행중">
				<input type="button" onclick="location.href='eventend'" value="종료">
			</form>
		</td>
	</tr>
</c:when>
<c:otherwise>
	<tr>
		<td align="left" colspan="3">
			<form action="eventsearchsave" method="post">
				<select name="eventkey" >
					<option value="etitle">제목
					<option value="econtents">내용
				</select>
				<input type="text" name="svalue" style="width: 250px" placeholder="검색어를 입력해주세요.">
				<input type="submit" value="찾기">
				<input type="button" onclick="location.href='eventboard'" value="전체보기">
				<input type="button" onclick="location.href='eventing'" value="진행중">
				<input type="button" onclick="location.href='eventend'" value="종료">
			</form>
		</td>
	</tr>
</c:otherwise>
</c:choose>
    <tr>
        <c:forEach items="${list}" var="event" varStatus="status" end="6">
            <td>
                <a href="eventdetail?evnum=${event.evnum}">
                <img src="./image/${event.eimagem}" style="width: 300px; height: 300px;"></a>
                <div><a href="eventdetail?evnum=${event.evnum}">[${event.estate}] ${event.etitle}</div>
            </td>
            <c:if test="${status.index % 3 == 2}"> <!-- 4개마다 새로운 행을 추가 -->
                </tr><tr>
            </c:if>
        </c:forEach>
            </tr>
<!-- 페이징처리 4444444444-->
<tr style="border-left: none;border-right: none;border-bottom: none">
   <td colspan="8" style="text-align: center;">
   
   <c:if test="${paging.startPage!=1 }">
      <a href="eventsearchview?nowPage=${paging.startPage-1 }&cntPerPage=${paging.cntPerPage}"></a>
   </c:if>   
      <c:forEach begin="${paging.startPage }" end="${paging.endPage}" var="p"> 
         <c:choose>
            <c:when test="${p == paging.nowPage }">
               <b><span style="color: red;">${p}</span></b>
            </c:when>   
            <c:when test="${p != paging.nowPage }">
               <a href="eventsearchview?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
            </c:when>   
         </c:choose>
      </c:forEach>
      
      <c:if test="${paging.endPage != paging.lastPage}">
      <a href="eventsearchview?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage }">  </a>
   </c:if>
   
   </td>
</tr>
<!-- 페이징처리 4444444444-->
</table>
</body>
</html>