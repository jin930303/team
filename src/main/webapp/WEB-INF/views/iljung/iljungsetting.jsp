<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
    function deliljung(gamedate, gameresult) {
        if (confirm('삭제하시면 복구할 수 없습니다.\n정말로 삭제하시겠습니까?')) {
            location.href = 'iljungdelete?gamedate=' + gamedate + '&gameresult=' + gameresult;
        }
    }
</script>
<link href="./css/iljung/iljungsetting.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>KBO 일정</title>
</head>
<body>
<div class="flex_container">
	<!-- 사이드 메뉴바 -->
	<div class="sidebar_container">
		<div class="sidebar_title"><h2>경기일정</h2></div>
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
	</div>
	<!-- 메인 콘텐츠 -->
	<main class="main-container">
		<div class="title">
			<h1>KBO 일정 UPDATE</h1>
		</div>
		<table>
			<thead>
				<tr>
					<th>경기날짜</th>
					<th>경기내용</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="iljung">
					<tr>
						<td>${iljung.gamedate}</td>
						<td>${iljung.gameresult}</td>
						<td>
							<input type="button" value="수정" onclick="location.href='iljungupdateview?gamedate=${iljung.gamedate}&&gameresult=${iljung.gameresult}'">
							<input type="button" value="삭제" onclick="deliljung('${iljung.gamedate}', '${iljung.gameresult}')">
						</td>
				    </tr>
				</c:forEach>
			</tbody>
		</table>
			
<!-- 페이징 -->
		<div class="pagination">		   
			<!-- '이전' 화살표 (처음 페이지로 이동) -->
		    <c:if test="${paging.startPage > 1}">
		        <a href="iljungsetting?nowPage=1&cntPerPage=${paging.cntPerPage}">&laquo;</a>
		    </c:if>
		
		    <!-- '이전' 화살표 (10페이지 이전으로 이동) -->
		    <c:if test="${paging.startPage > 10}">
		        <a href="iljungsetting?nowPage=${paging.startPage - 10}&cntPerPage=${paging.cntPerPage}">&lt;</a>
		    </c:if>
		
		    <!-- 페이지 번호 목록 -->
		    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
		        <c:choose>
		            <c:when test="${p == paging.nowPage}">
		                <b><span class="current">${p}</span></b>
		            </c:when>
		            <c:otherwise>
		                <a href="iljungsetting?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
		            </c:otherwise>
		        </c:choose>
		    </c:forEach>
		
		    <!-- '다음' 화살표 (10페이지 다음으로 이동) -->
		    <c:if test="${paging.endPage + 10 <= paging.lastPage}">
		        <a href="iljungsetting?nowPage=${paging.startPage + 10}&cntPerPage=${paging.cntPerPage}">&gt;</a>
		    </c:if>
		
		    <!-- '다음' 화살표 (마지막 페이지로 이동) -->
		    <c:if test="${paging.endPage < paging.lastPage}">
		        <a href="iljungsetting?nowPage=${paging.lastPage}&cntPerPage=${paging.cntPerPage}">&raquo;</a>
		    </c:if>
		</div>	
			   
<!-- 하단 버튼-->
		<div class="submitbutton">
			<input type="button" onclick="location.href='iljung'" value="돌아가기">
		</div>
	</main>
</div>
</body>
</html>