<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="./css/event/eventsearchview.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>
</title>
</head>
<body>
<div class="flex_container">
<!-- 사이드 메뉴바 -->
	<div class="sidebar_container">
		<div class="sidebar_title"><h2>EVENT</h2></div>
		<aside class="sidebar">
				<ul>
					<li><a href="gongjiboard">공지사항</a></li>
					<li><a href="eventboard">이벤트</a></li>
					<li><a href="board">자유게시판</a></li>
					<li><a href="sosickboard">야구소식</a></li>
					<li><a href="iljung">경기일정</a></li>
				</ul>
			<div class="kborank">
				<h4>2024시즌 KBO순위</h4>
				<table>
					<thead>
						<tr>
							<th>순위</th><th>팀</th><th>승</th><th>패</th><th>무</th><th>승률</th>
						</tr>
					</thead>
					<tbody>
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
					</tbody>
				</table>
			</div>
		</aside>
	</div>
	
<!-- 메인 콘텐츠 -->	
	<main class="main-container">
			<c:choose>
				<c:when test="${empty list}">
					<div class="title">
						<h1>EVENT</h1>
						<div class="ascdesc">
							<a href="eventing">[진행중] </a>
							<a href="eventend">[종료] </a>
							최신 
							<a href="eventdayup"><strong>▲</strong></a>
							<a href="eventdaydown"><strong>▼</strong></a>
							조회수 
							<a href="eventviewup"><strong>▲</strong></a>
							<a href="eventviewdown"><strong>▼</strong></a>
						</div>
					</div>	
				</c:when>
				<c:otherwise>
					<div class="title">
						<h1>"${svalue}"로 검색한 결과</h1>
						<div class="ascdesc">
							<a href="eventing">[진행중] </a>
							<a href="eventend">[종료] </a>
							최신 
							<a href="eventdayup"><strong>▲</strong></a>
							<a href="eventdaydown"><strong>▼</strong></a>
							조회수 
							<a href="eventviewup"><strong>▲</strong></a>
							<a href="eventviewdown"><strong>▼</strong></a>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			
		<table>	
			<c:choose>
			    <c:when test="${empty list}">
					<tr>
						<td colspan="6">"${svalue}"로 검색한 결과가 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>
						<c:forEach items="${list}" var="event" varStatus="status" end="9">
						<td class="event-container" onclick="location.href='eventdetail?evnum=${event.evnum}'">
						    <div class="eventbox">
						        <div class="eventimage">
						            <strong>${event.estate}</strong> 
						            <a href="eventdetail?evnum=${event.evnum}">
						                <img src="./image/${event.eimagem}">
						            </a>
						        </div>
						        <div class="eventtitle">
						            <span>${event.etitle} </span>
						        </div>
						    </div>
						</td>
						<c:if test="${status.index % 3 == 2}">
						    </tr><tr>
						</c:if>
						</c:forEach>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
			
<!-- 페이징 -->
		<div class="pagination">
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
		</div>
<!-- 하단 검색 -->
		<form action="eventsearchsave" method="post" class="search-bar">
			<div class="search-container">
				<select name="eventkey" >
					<option value="etitle">제목
					<option value="econtents">내용
				</select>
			</div>
				<input type="text" name="svalue" placeholder="검색어를 입력해주세요.">
				<button type="submit">검색</button>
			<c:choose>
				<c:when test="${adminloginstate==true}">
					<input type="button" onclick="location.href='eventinput'" value="글쓰기">
					<input type="button" onclick="location.href='eventboard'" value="목록">
				</c:when>
				<c:otherwise>
					<input type="button" onclick="location.href='eventboard'" value="목록">
				</c:otherwise>
			</c:choose>
		</form>
	</main>
</div>
</body>
</html>