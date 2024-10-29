<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<<<<<<< HEAD
<script type="text/javascript">
function confirmproduct(){
	if(confirm("구매를 확정하시겠습니까?")){
		alert("구매가 완료 되었습니다.");
		location.href="/team/main";
	}
}
</script>
=======
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
>>>>>>> refs/heads/lte
    <meta charset="UTF-8">
    <title>구매 확인 페이지</title>

</head>
<body>
    <h1>구매 확인</h1>
    <table>
        <tr>
            <th>상품번호</th>
            <td>${itemnum}</td>
        </tr>
        <tr>
            <th>상품명</th>
            <td>${product}</td>
        </tr>
        <tr>
            <th>옵션</th>
            <td>${op1}</td>
        </tr>
        <tr>
            <th>수량</th>
            <td>${count}</td>
        </tr>
        <tr>
            <th>가격</th>
            <td>${price}원</td>
        </tr>
    </table>
    <br>
    <button onclick="confirmproduct()">구매 확정</button>
</body>
</html>
