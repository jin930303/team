<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객센터 문의 게시판</title>
<link href="./css/faq_ask/faqoutput.css" rel="stylesheet"/>
</head>
<body>
<div class="flex_container">
<!-- 사이드 메뉴바 -->
	<div class="sidebar_container">
		<div class="sidebar_title"><h2>문의 내역</h2></div>
		<aside class="sidebar">
			<ul>
				<li><a href="faq_community">고객센터 홈</a></li>
				<c:choose>
					<c:when test="${loginstate == true}">
						<li><a href="faqin">1:1 문의하기</a></li>
					</c:when>
				</c:choose>
				<li><a href="faqout">문의 내역</a></li>
				<li><a href="faq">FAQ</a></li>
				<c:choose>
					<c:when test="${adminloginstate == true}">
					<li><a href="FAQ_in">FAQ 작성</a></li>
					</c:when>
				</c:choose>
			</ul>
		</aside>
	</div>

<!-- 메인 콘텐츠 -->
		<main class="main-container">
			<div class="title">
				<h1>문의 게시판</h1>
			</div>
			
<!-- 문의 리스트 테이블 -->
			<table>
				<thead>
					<tr class="faq-small-title">
						<th width="80px">TAB</th>
						<th width="170px">제목</th>
						<th width="50px">작성자</th>
						<th width="60px">작성일자</th>
						<th width="60px">공개여부</th>
						<th width="50px">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="faq">
						<tr onclick="location.href='faqdetail?cnum=${faq.cnum}&openclose=${faq.openclose}'" class="trlink" id="admincheck">
							<c:choose>
		                        <c:when test="${faq.openclose == '공개'}">
		                            <td>${faq.tab}</td>
		                            <td style="text-align: left;">${faq.title}</td>
		                            <td>${faq.nickname}</td>
									<td>${faq.fdate}</td>
									<td>${faq.openclose}</td>
									<td>${faq.faqcnt}</td>
		                        </c:when>
		                        <c:otherwise>
		                            <td>${faq.tab}</td>
		                            <td style="text-align: left;">비공개</td>
		                            <td>비공개</td>
		                            <td>${faq.fdate}</td>
		                            <td>${faq.openclose}</td>
		                            <td>${faq.faqcnt}</td>
		                        </c:otherwise>
		                    </c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- 페이지 네비게이션 -->
			<div class="pagination">
				<c:if test="${paging.startPage != 1}">
					<a
						href="faqout?nowPage=${paging.startPage-1}&cntPerPage=${paging.cntPerPage}">이전</a>
				</c:if>

				<c:forEach begin="${paging.startPage}" end="${paging.endPage}"
					var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage}">
							<span class="current">${p}</span>
						</c:when>
						<c:otherwise>
							<a href="faqout?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${paging.endPage != paging.lastPage}">
					<a
						href="faqout?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">다음</a>
				</c:if>
			</div>
			<!-- 하단 검색 -->
			<form action="faqsearch" method="post" class="search-bar">
 				<div class="search-container">
			    <!-- 기간 선택 -->
			    <select name="faqkey1" id="faqkey1">
				    <optgroup label="기간 선택">
				        <option value="1">1일</option>
				        <option value="7">1주일</option>
				        <option value="30">1개월</option>
				        <option value="90">3개월</option>
				    </optgroup>
				</select>
				
				<!-- 검색 조건 선택 -->
				<select name="faqkey2" id="faqkey2">
				    <optgroup label="검색 조건 선택">
				        <option value="title">제목</option>
				        <option value="fcontents">내용</option>
				        <option value="nickname">글쓴이</option>
				    </optgroup>
				</select>
				</div>
			    <!-- 검색어 입력 -->
			    <input type="text" name="faqvalue" id="faqvalue" placeholder="검색어를 입력하세요" required>
			
			    <!-- 검색 버튼 -->
			    <button type="submit">검색</button>
			</form>
		</main>
	</div>
</body>
</html>
