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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
    function delboard(cnum) {
        if (confirm('삭제하시면 복구할 수 없습니다.\n정말로 삭제하시겠습니까?')) {
            location.href = 'boarddelete?cnum=' + cnum;
        }
    }
</script>
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
<table border="1" width="800px" align="center">
<caption><h2>자유게시판</h2></caption>
	<tr>
		<th colspan="5" style="text-align: left;">[${list.tab}] ${list.title}</th><th colspan="3">${list.nickname}</th>
	</tr>	
	<tr>	
		<td>글번호</td><td>${list.cnum}</td><td>작성일</td><td>${list.cdate}</td><td>추천</td><th>${list.clike}</th><td>조회</td><td>${list.ccnt}</td>
	</tr>
	<tr>
		<c:choose>
			<c:when test="${list.cimage==null}">
				<td colspan="8">
					<pre style="text-align: left;">${list.ccontents}</pre>
				</td>
			</c:when>
			<c:otherwise>
				<td colspan="8" style="text-align: center;">
					<img src="./image/${list.cimage}" style="width:700px; display: block; margin: 0 auto;">
					<pre style="text-align: left;">${list.ccontents}</pre>
				</td>
			</c:otherwise>
		</c:choose>
	</tr>
	<tr>	
		<td colspan="8">
			${list.clike}<a href="boardlike?cnum=${list.cnum}"><img src="./image/좋아요.png" style="width:50px; height:50px;"></a>
			<a href="boardhate?cnum=${list.cnum}"><img src="./image/싫어요.png" style="width:50px; height:50px;"></a>${list.chate}
		</td>
	</tr>
	
<c:choose>
<c:when test="${adminloginstate==true}">
	<tr>	
		<td colspan="8">
			<input type="button" onclick="location.href='board'" value="목록">
			<input type="button" onclick="delboard(${list.cnum})" value="삭제">
			<input type="button" onclick="location.href='boardupdateview?cnum=${list.cnum}'" value="수정">
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
<input type="hidden" value="관리자" name="nickname" readonly>
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
</c:when>

<c:when test="${list.nickname!=sessionScope.dto3.nickname}">
	<tr>	
		<td colspan="8">
			<input type="button" onclick="location.href='board'" value="목록">
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
<input type="hidden" value="${sessionScope.dto3.nickname}" name="nickname" readonly>
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
</c:when>

<c:when test="${list.nickname==sessionScope.dto3.nickname}">
	<tr>
		<td colspan="8">
			<input type="button" onclick="location.href='board'" value="목록">
			<input type="button" onclick="delboard(${list.cnum})" value="삭제">
			<input type="button" onclick="location.href='boardupdateview?cnum=${list.cnum}'" value="수정">
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
<input type="hidden" value="${sessionScope.dto3.nickname}" name="nickname" readonly>
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
</c:when>
<c:otherwise>
	<tr>	
		<td colspan="8">
			<input type="button" onclick="location.href='board'" value="목록">
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
</c:otherwise>
</c:choose>
</table></div></div>
</body>
</html>