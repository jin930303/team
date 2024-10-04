<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="faqupdate2" method="post" enctype="multipart/form-data">
	<table>
	<caption><span>문의글 수정</span></caption>
		<tr>
			<td><input type="number" name="cnum" value="${dto.cnum}" readonly></td>
		</tr>
		<tr>
			<th>문의 종류</th>
			<td>
				<select name="tab">
					<option value="상품옵션 문의">상품옵션</option>
					<option value="교환/환불 문의">교환/환불</option>
					<option value="배송 문의">배송 문의</option>
					<option value="기타 문의">기타 문의</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" value="${dto.title}"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="nickname" value="${dto.nickname}"></td>
		</tr>
		<tr>
			<th>문의 내용</th>
			<td>
				<textarea rows="10" cols="25" name="fcontents">${dto.fcontents}</textarea>
			</td>
		</tr>
		<tr>
			<th>첨부이미지</th>
			
			<td>
				<input type="file" name="fimage1">
				<input type="file" name="fimage2">
				<input type="file" name="fimage3">
			</td>
			<td>
				<img src="./image/${dto.fimage1}" width="80px" height="70px">
				<img src="./image/${dto.fimage2}" width="80px" height="70px">
				<img src="./image/${dto.fimage3}" width="80px" height="70px">
			</td>
		</tr>
		<tr>
			<td><input type="submit" value="수정 완료"></td>
		</tr>
	</table>
</form>
</body>
</html>