<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
  <h1>장바구니</h1>
    <table>
        <thead>
            <tr>
                <th>상품 번호</th>
                <th>상품 이름</th>
                <th>가격</th>
                <th>수량</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${sessionScope.cart}">
                <tr>
                    <td>${item.itemnum}</td>
                    <td>${item.product}</td>
                    <td>${item.price}원</td>
                    <td>${item.count}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>