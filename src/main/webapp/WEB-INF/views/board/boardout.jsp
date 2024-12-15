<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
function delboard(cnum) {
	if (confirm('삭제하시면 복구할 수 없습니다.\n정말로 삭제하시겠습니까?')) {
		location.href = 'boarddelete?cnum=' + cnum;
	}
}
    
function delreply(cnum) {
	if (confirm('삭제하시면 복구할 수 없습니다.\n정말로 삭제하시겠습니까?')) {
		location.href = 'replydelete?cnum=' + cnum;
	}
}
</script>
<link href="./css/board/boardout.css" rel="stylesheet"/>
<meta charset="UTF-8">
<title>
</title>
</head>
<body>
<div class="flex_container">
	<!-- 사이드 메뉴바 -->
	<div class="sidebar_container">
		<div class="sidebar_title"><h2>자유게시판</h2></div>
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
		<div class="title"><h1>" ${list.nickname} " 님의 게시글</h1></div>
		<table>
			<tr>
				<th>제 목</th>
				<th width="130px">작성일자</th>
				<th width="80px">추천수</th>
				<th width="80px">조회수</th>
			</tr>
			<tr>	
				<td>[${list.tab}] ${list.title}</td>
				<td>${list.cdate}</td>
				<td>${list.clike}</td>
				<td>${list.ccnt}</td>
			</tr>

			<tr>
			<c:choose>

				<c:when test="${list.cimage==null}">
					<td colspan="4" class="mainimage">
						<pre>${list.ccontents}</pre>
					</td>
				</c:when>

				<c:otherwise>
					<td colspan="4" class="mainimage">
						<img src="./image/${list.cimage}"><br>
						<pre>${list.ccontents}</pre>
					</td>
				</c:otherwise>
			</c:choose>
			</tr>

			<tr>	
				<td colspan="4" class="likehate">
					${list.clike}
					<a href="boardlike?cnum=${list.cnum}">
						<img src="./image/좋아요.png"></a>
					<a href="boardhate?cnum=${list.cnum}">
						<img src="./image/싫어요.png"></a>
					${list.chate}
				</td>
			</tr>
			

			<c:choose>
				<c:when test="${(adminloginstate==true&&list.nickname=='관리자') || (loginstate==true&&list.nickname==sessionScope.dto3.nickname)}">
					<tr>	
						<td colspan="4">
							<input type="button" onclick="location.href='board'" value="목록">
							<input type="button" onclick="location.href='boardupdateview?cnum=${list.cnum}'" value="수정">
							<input type="button" onclick="delboard(${list.cnum})" value="삭제">
						</td>
					</tr>
				</c:when>
				
				<c:when test="${adminloginstate==true&&list.nickname!='관리자'}">
					<tr>	
						<td colspan="4">
							<input type="button" onclick="location.href='board'" value="목록">
							<input type="button" onclick="delboard(${list.cnum})" value="삭제">
						</td>
					</tr>
				</c:when>
				
				<c:when test="${loginstate==true&&list.nickname!=sessionScope.dto3.nickname}">
					<tr>	
						<td colspan="4">
							<input type="button" onclick="location.href='board'" value="목록">
						</td>
					</tr>
				</c:when>
				
				<c:otherwise>
					<tr>	
						<td colspan="4">
							<input type="button" onclick="location.href='board'" value="목록">
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		
		<c:choose>
			<c:when test="${adminloginstate==true}">
				<table>	
				<div class="title"><h1>댓글</h1></div>
					<tr>
						<th width="150px">닉네임</th>
						<th>내 용</th>
					</tr>
					
					<c:forEach var="reply" items="${reply}">
						<tr>
							<td>${reply.nickname}</td>
							<td style="text-align:left;">${reply.ccontents}</td>
							<td style="width:100px; text-align:right;">
								<input type="button" onclick="delreply(${reply.cnum})" value="댓글삭제">
							</td>
						</tr>
					</c:forEach>
				</table>
				
				<form action="boardreplysave" method="post">
						<input type="hidden" value="${list.cnum}" name="cnum" readonly>
						<input type="hidden" value="관리자" name="nickname" readonly>
						<input type="hidden" value="${list.cgroup}" name="cgroup" readonly>
						<input type="hidden" value="${list.step}" name="step" readonly>
						<input type="hidden" value="${list.indent}" name="indent" readonly>
					
					<table>
						<tr>
							<td>관리자</td>
							<td>
								<textarea rows="1" cols="60" name="ccontents"></textarea>
							</td>
							<td class="submitbutton">
								<input type="submit" value="댓글등록">
								<input type="reset" value="작성취소">
							</td>
						</tr>
					</table>
				</form>
			</c:when>
			
			<c:when test="${loginstate==true}">
				<table>	
				<div class="title"><h1>댓글</h1></div>
					<tr>
						<th width="150px">닉네임</th>
						<th>내 용</th>
					</tr>
					
					<c:forEach var="reply" items="${reply}">
						<tr>
							<td>${reply.nickname}</td>
					<c:choose>
						<c:when test="${reply.nickname==sessionScope.dto3.nickname}">
							<td style="text-align:left;">${reply.ccontents}</td>
							<td style="width:100px; text-align:right;">
								<input type="button" onclick="delreply(${reply.cnum})" value="댓글삭제">
							</td>
						</c:when>
							
						<c:when test="${reply.nickname!=sessionScope.dto3.nickname}">
							<td style="text-align:left;">${reply.ccontents}</td>
						</c:when>
					</c:choose>
						</tr>
					</c:forEach>
				</table>
				
				<form action="boardreplysave" method="post">
						<input type="hidden" value="${list.cnum}" name="cnum" readonly>
						<input type="hidden" value="${sessionScope.dto3.nickname}" name="nickname" readonly>
						<input type="hidden" value="${list.cgroup}" name="cgroup" readonly>
						<input type="hidden" value="${list.step}" name="step" readonly>
						<input type="hidden" value="${list.indent}" name="indent" readonly>
					
					<table>
						<tr>
							<td>${sessionScope.dto3.nickname}</td>
							<td>
								<textarea rows="1" cols="60" name="ccontents"></textarea>
							</td>
							<td class="submitbutton">
								<input type="submit" value="댓글등록">
								<input type="reset" value="작성취소">
							</td>
						</tr>
					</table>
				</form>
			</c:when>
			
			<c:otherwise>
				<table>
				<div class="title"><h1>댓글</h1></div>
						<tr>
							<th width="150px">닉네임</th>
							<th>내 용</th>
						</tr>
						
					<c:forEach var="reply" items="${reply}">
						<tr>
							<td>${reply.nickname}</td>
							<td style="text-align:left;">${reply.ccontents}</td>
						</tr>
					</c:forEach>
				</table>
				
				<table>
					<tr>
						<td width="800px">
							<textarea rows="1" cols="60" readonly>댓글은 로그인 후 작성할 수 있습니다...</textarea>
						</td>
					</tr>
				</table>
			</c:otherwise>
		</c:choose>
	</main>
</div>
</body>
</html>