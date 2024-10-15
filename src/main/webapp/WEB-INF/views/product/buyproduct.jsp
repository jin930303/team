<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 페이지</title>
</head>
<body>

  <!-- 로그인 상태 체크 -->
  <c:if test="${empty sessionScope.loginstate or sessionScope.loginstate == false}">
      <h2>로그인 후 구매가 가능합니다.</h2>
      <a href="login">로그인 페이지로 이동</a>
  </c:if>

  <!-- 로그인한 경우 -->
  <c:if test="${not empty sessionScope.loginstate and sessionScope.loginstate == true}">
      <h1>구매하기</h1>

      <!-- 선택된 상품이 없을 경우 처리 -->
      <c:if test="${empty sessionScope.itemsToBuy}">
          <p>선택한 상품이 없습니다.</p>
          <form action="cart" method="post">
              <button type="submit">장바구니로 돌아가기</button>
          </form>
      </c:if>

      <!-- 선택된 상품이 있을 경우 처리 -->
      <c:if test="${not empty sessionScope.itemsToBuy}">
          <form action="confirmPurchase" method="post">
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
                      <c:forEach var="item" items="${sessionScope.itemsToBuy}">
                          <tr>
                              <td>${item.product}</td>
                              <td><img src="./image/${item.image1}" alt="${item.product}" width="100"></td>
                              <td>${item.op1}</td>
                              <td>${item.count}</td>
                              <td>${item.price}원</td>
                              <td>${item.price * item.count}원</td>
                          </tr>
                      </c:forEach>
                  </tbody>
              </table>

              <!-- 결제 또는 구매 버튼 -->
              <button type="submit">구매 완료</button>
          </form>
      </c:if>
  </c:if>

  <!-- 장바구니로 돌아가기 버튼 -->
  <form action="cart" method="post">
      <button type="submit">장바구니로 돌아가기</button>
  </form>
</body>
</html>
