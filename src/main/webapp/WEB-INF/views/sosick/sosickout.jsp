<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
    function delsosick(snum) {
        if (confirm('삭제하시면 복구할 수 없습니다.\n정말로 삭제하시겠습니까?')) {
            location.href = 'sosickdelete?snum=' + snum;
        }
    }
</script>
<link href="./css/sosick/sosickout.css" rel="stylesheet"/> 
<meta charset="UTF-8">
<title>
</title>
</head>
<body>
<div class="flex_container">
	<!-- 사이드 메뉴바 -->
	<div class="sidebar_container">
		<div class="sidebar_title"><h2>야구소식</h2></div>
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
		<div class="title">
			<h1>야구소식</h1>
		</div>
		<table>
			<thead>
				<tr>
					<th>제목</th>
					<th width="130px">작성일자</th>
					<th width="80px">조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>[${list.stag}] ${list.stitle}</td>
					<td>${list.sdate}</td>
					<td>${list.scnt}</td>
				</tr>	
				<c:choose>
					<c:when test="${list.simage==null}">
						<tr>
							<td colspan="4" class="mainimage">
								<pre>${list.scontents}</pre>
							</td>
						</tr>
					</c:when>
					
					<c:otherwise>
						<tr>
							<td colspan="4" class="mainimage">
					    		<img src="./image/${list.simage}">
					    		<br>
					   			<pre>${list.scontents}</pre>
							</td>
				   		</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
			<c:choose>
				<c:when test="${adminloginstate==true}">
					<tr>	
						<td colspan="3">
							<div class="submitbutton">
								<input type="button" onclick="location.href='sosickboard'" value="목록">
								<input type="button" onclick="delsosick(${list.snum})" value="삭제">
								<input type="button" onclick="location.href='sosickupdateview?snum=${list.snum}'" value="수정">
							</div>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<tr>	
						<td colspan="3">
							<div class="submitbutton">
								<input type="button" onclick="location.href='sosickboard'" value="목록">
							</div>
						</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</main>
</div>
</body>
</html>