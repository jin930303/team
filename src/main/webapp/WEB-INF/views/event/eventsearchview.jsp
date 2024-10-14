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
<div class="container">
<aside class="sidebar">
	<h2>커뮤니티</h2>
		<ul>
			<li><a href="gongjiboard">공지사항</a></li>
			<li><a href="eventboard">이벤트</a></li>
			<li><a href="board">자유게시판</a></li>
			<li><a href="sosickboard">야구소식</a></li>
			<li><a href="iljung">경기일정</a></li>
		</ul>
	<div class="kborank">
		<h3>2024시즌 KBO순위</h3>
		<table style="width:310px">
			<tr>
				<th>순위</th><th>팀</th><th>승</th><th>패</th><th>무</th><th>승률</th>
			</tr>
			<tr>
				<td>1</td><td>기아</td><td>87</td><td>55</td><td>2</td><td>0.613</td>
			</tr>
			<tr>
				<td>2</td><td>삼성</td><td>78</td><td>64</td><td>2</td><td>0.549</td>
			</tr>
			<tr>
				<td>3</td><td>LG</td><td>76</td><td>66</td><td>2</td><td>0.535</td>
			</tr>
			<tr>
				<td>4</td><td>두산</td><td>74</td><td>68</td><td>2</td><td>0.521</td>
			</tr>
			<tr>
				<td>5</td><td>KT</td><td>72</td><td>70</td><td>2</td><td>0.507</td>
			</tr>
			<tr>
				<td>6</td><td>SSG</td><td>72</td><td>70</td><td>2</td><td>0.507</td>
			</tr>
			<tr>
				<td>7</td><td>롯데</td><td>66</td><td>74</td><td>4</td><td>0.471</td>
			</tr>
			<tr>
				<td>8</td><td>한화</td><td>66</td><td>76</td><td>2</td><td>0.465</td>
			</tr>
			<tr>
				<td>9</td><td>NC</td><td>61</td><td>81</td><td>2</td><td>0.430</td>
			</tr>
			<tr>
				<td>10</td><td>키움</td><td>58</td><td>86</td><td>0</td><td>0.403</td>
			</tr>
		</table>
	</div>
</aside>
<div class="maindata">
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
</table></div></div>
</body>
</html>