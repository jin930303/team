<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function confirmproduct(){
	if(confirm("구매를 확정하시겠습니까?")){
		alert("구매가 완료 되었습니다.");
		location.href="/team/main";
	}
}
</script>
    <meta charset="UTF-8">
    <title>구매 확인 페이지</title>
</head>
<body>
    <h1>구매 확인</h1>
    <table border="1">
        <tr>
            <th>상품명</th>
            <td>${product}</td>
        </tr>
        <tr>
            <th>상품번호</th>
            <td>${itemnum}</td>
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