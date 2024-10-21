<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
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
    <button onclick="location.href='/team/confirmPurchase'">구매 확정</button>
</body>
</html>