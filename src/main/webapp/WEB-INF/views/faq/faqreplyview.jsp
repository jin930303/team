<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="faqreplysave" method="post">
		<table align="center" width="900px" border="1">
			<c:forEach items="${faqlist}" var="faq">
				<caption>
					<h1>FAQ : 문의내용 답변</h1>
				</caption>
				<input type="hidden" value="${faq.cnum}" name="cnum">
				<input type="hidden" value="${faq.groups}" name="groups">
				<input type="hidden" value="${faq.step}" name="step">
				<input type="hidden" value="${faq.indent}" name="indent">


				<!-- 문의 답변 -> 탭, 답변 일자, 답변 내용, 답변 제목 -->
				<tr>
					<th colspan="2">${faq.fdate}</th>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" value="운영자" name="nickname" readonly></td>
				</tr>
				<tr>
					<th>${faq.tab}/ 문의내용 재선택</th>
					<td><select name="tab">
							<option value="회원관련 문의">회원관련 문의</option>
							<option value="이벤트/혜택">이벤트/혜택</option>
							<option value="상품옵션 문의">상품옵션</option>
							<option value="교환/환불 문의">교환/환불</option>
							<option value="배송 문의">배송 문의</option>
							<option value="기타 문의">기타 문의</option>
					</select></td>
				</tr>
				<tr>
					<th>답변 제목</th>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<td colspan="2">${faq.nickname}님, 안녕하세요.<br>
						${faq.fcontents}<br> 이라는 문의 내용을 확인했습니다. <br> 이에 아래와 같이
						답변 드리겠습니다.<br> <textarea rows="10" cols="30" name="fcontents"></textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="문의 답변 등록">
						<input type="reset" value="다시 작성"></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>