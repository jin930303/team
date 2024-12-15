<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Batang&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Song+Myung&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>구매 완료</title>
   <link href="./css/product/phurchaseConfirmation.css" rel="stylesheet"/>   
</head>
<body>
    <h1>구매가 완료되었습니다!</h1>
    <p>선택하신 상품이 성공적으로 구매되었습니다. 감사합니다!</p>
    <table>
        <thead>
            <tr>
                <th>상품명</th>
                <th>상품이미지</th>
                <th>옵션</th>
                <th>수량</th>
                <th>가격</th>
                <th>총 가격</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${purchasedItems}">
                <tr>
                    <td>${item.product}</td>
                    <td><img src="./image/${item.image1}" alt="${item.image1}" width="100"></td>
                    <td>${item.op1}</td>
                    <td>${item.count}</td>
                    <td><fmt:formatNumber value="${item.price}" type="number" pattern="#,##0원"/></td>
                    <td><fmt:formatNumber value="${item.price * item.count}" type="number" pattern="#,##0원"/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <p>총 금액: <strong><fmt:formatNumber value="${totalPrice}" type="number" pattern="#,##0원"/></strong></p>
    <a class="action-button" href="${pageContext.request.contextPath}/main">메인 페이지로 돌아가기</a>

</body>
</html>
