<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 상세페이지 하단 문의 답변내용 기재 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="faqreply" method="post" enctype="multipart/form-data">
		<table align="center" width="900px" border="1">
			<c:forEach items="${list}" var="faq">
				<caption>
					<h1>${faq.nickname}님의문의 내용</h1>
				</caption>
				<input type="hidden" value="${faq.cnum}" name="cnum">
				<tr>
					<th colspan="4" id="cnum">${faq.cnum}${faq.tab} ${faq.fdate}</th>
				</tr>
				<tr>
					<th>제 목</th>
					<td>${faq.title}</td>
					<th>작성자</th>
					<td>${faq.nickname}</td>
				<tr>
					<td colspan="4">${faq.fcontents}</td>
				</tr>
				<tr>
					<td colspan="4"><img src="./image/${faq.fimage1}" width="80px"
						height="70px"> <img src="./image/${faq.fimage2}"
						width="80px" height="70px"> <img
						src="./image/${faq.fimage3}" width="80px" height="70px"></td>
				</tr>
				<tr>
					<td colspan="4"><input type="submit" value="(관리자 문의 답변)">
						<input type="button" value="문의글 수정"
						onclick="location.href='faqupdate?cnum=${faq.cnum}'"> <input
						id="deletecheck" type="button" value="문의글 삭제"
						onclick="location.href='faqdelete?cnum=${faq.cnum}'"> <input
						type="button" value="돌아가기" onclick="location.href='./faqout'">
					</td>
				</tr>
			</c:forEach>
		</table>

		<table align="center" width="900px" border="1">
			<caption>
				<br>
				<h2>↳ Q&A : 답변 드립니다.</h2>
			</caption>
			<c:forEach items="${replylist}" var="replylist">
				<tr>
					<th>문의 종류</th>
					<td>${replylist.tab}</td>
				</tr>
				<tr>
					<th>답변 제목</th>
					<td>${replylist.title}</td>
					<th>문의 일자</th>
					<td>${replylist.fdate}</td>
				</tr>
				<tr>
					<td colspan="4">${replylist.nickname}님, 안녕하세요.<br>
						${replylist.fcontents}<br> 이라는 문의 내용을 확인했습니다. <br> 이에
						아래와 같이 답변 드리겠습니다.<br> 답변 내용 : ${replylist.fcontents}
					</td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>