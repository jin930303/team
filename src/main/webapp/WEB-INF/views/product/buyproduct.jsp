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

      <!-- 상품이 선택된 경우 -->
      <c:if test="${not empty sessionScope.itemToBuy}">
          <h1>구매하기</h1>

          <form action="buydirectitem" method="post">
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
                      <tr>
                          <td>${itemToBuy.product}</td>
                          <td><img src="./image/${itemToBuy.image1}" alt="${itemToBuy.product}" width="100"></td>
                          <td>${itemToBuy.op1}</td>
                          <td>
                              <!-- 수량을 변경할 수 있는 입력창 -->
                              <input type="number" name="count" value="${itemToBuy.count}" min="1" />
                          </td>
                          <td>${itemToBuy.price}원</td>
                          <td>${itemToBuy.price * itemToBuy.count}원</td>
                      </tr>
                  </tbody>
              </table>

              <!-- 장바구니에서 바로 구매 -->
              <input type="hidden" name="itemnum" value="${itemToBuy.itemnum}" />
              <input type="hidden" name="op1" value="${itemToBuy.op1}" />

              <button type="submit">구매 완료</button>
          </form>

      </c:if>

      <!-- 상품이 선택되지 않은 경우 -->
      <c:if test="${empty sessionScope.itemToBuy}">
          <p>선택한 상품이 없습니다.</p>
          <form action="cart" method="post">
              <button type="submit">장바구니로 돌아가기</button>
          </form>
      </c:if>

  </c:if>

</body>
</html>
