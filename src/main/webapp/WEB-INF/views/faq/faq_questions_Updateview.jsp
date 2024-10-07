<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	font-family: Arial, sans-serif;
	background-color: #f9f9f9;
	color: #333;
}

.container {
	width: 60%;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	border: 1px solid #ddd;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
	margin: 20px 0;
}

caption {
	font-size: 22px;
	font-weight: bold;
	margin-bottom: 10px;
	text-align: left;
	color: #333;
}

th, td {
	padding: 12px;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f4f4f4;
	text-align: left;
}

td {
	background-color: #fff;
}

input[type="text"], textarea, select {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type="file"] {
	margin-bottom: 10px;
}

input[type="submit"] {
	background-color: #333;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #555;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form action="faq_admin_update2" method="post"
			enctype="multipart/form-data">
			<table>
				<caption><h2>FAQ : 수정</h2></caption>
				<tr>
					<th>FAQ 번호 <span id="noinput">*입력불가</span></th>
					<td><input type="text" name="cnum" value="${dto.cnum}" readonly>
					</td>
				</tr>
				<tr>
					<th>FAQ 종류 <span id="noinput">*입력불가</span></th>
					<td><input type="text" name="tab" value="FAQ" readonly>
					</td>
				</tr>
				<tr>
					<th>FAQ 제목</th>
					<td><input type="text" name="title" value="${dto.title}"></td>
				</tr>
				<tr>
					<th>FAQ 작성자 <span id="noinput">*입력불가</span></th>
					<td><input type="text" value="운영자" name="nickname" readonly></td>
				</tr>
				<tr>
					<th>FAQ 내용</th>
					<td><textarea rows="10" cols="25" name="fcontents">${dto.fcontents}</textarea>
					</td>
				</tr>
				<tr>
					<th>FAQ 첨부 이미지</th>
					<td>
						<img src="./image/${dto.fimage1}" width="300px">
						<input type="file" name="fimage1"> 
						<img src="./image/${dto.fimage2}" width="300px">
						<input type="file" name="fimage2"> 
						<img src="./image/${dto.fimage3}" width="300px">
						<input type="file" name="fimage3"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;"><input
						type="submit" value="수정 완료"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>