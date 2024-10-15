<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script type="text/javascript">
  // 전체 선택/해제 기능
  function toggleSelectAll(checkbox) {
    var checkboxes = document.getElementsByName('selectedItems');
    for (var i = 0; i < checkboxes.length; i++) {
      checkboxes[i].checked = checkbox.checked;
    }
  }

  // 선택된 상품이 없는 경우 경고 메시지 표시
  function validateSelection() {
    var checkboxes = document.getElementsByName('selectedItems');
    var selected = false;

    for (var i = 0; i < checkboxes.length; i++) {
      if (checkboxes[i].checked) {
        selected = true;
        break;
      }
    }

    if (!selected) {
      alert("상품을 선택하세요.");
      return false;  // 폼 전송을 막음
    }

    // 로그인 체크 (세션에 loginstate 속성이 없으면 로그인되지 않은 상태)
    if (document.getElementById('loginState').value == "false") {
      alert("로그인 후 구매가 가능합니다.");
      window.location.href = "login";  // 로그인 페이지로 리디렉션
      return false;
    }

    return true;  // 폼 전송 허용
  }
</script>
</head>
<body>
  <h1>장바구니</h1>

  <!-- 로그인 상태에 따라 경고 메시지 처리 -->
  <c:if test="${not empty loginError}">
    <script type="text/javascript">
      alert("${loginError}");  // 로그인 안된 상태로 넘어가면 경고 메시지 띄우기
    </script>
  </c:if>

  <!-- 장바구니가 비어있을 때 처리 -->
  <c:if test="${empty sessionScope.cart or empty sessionScope.cart.size()}">
      <p>장바구니에 아이템이 없습니다.</p>
  </c:if>

  <!-- 장바구니에 아이템이 있을 때 처리 -->
  <c:if test="${not empty sessionScope.cart and not empty sessionScope.cart.size()}">
      <form action="buySelectedItems" method="post" onsubmit="return validateSelection()"> <!-- 선택된 항목만 구매하는 폼 -->

      <!-- 전체 선택/해제 체크박스 -->
      <label><input type="checkbox" onclick="toggleSelectAll(this)"> 전체 선택/해제</label><br><br>

      <table>
          <thead>
              <tr>
                  <th>선택</th> <!-- 선택 체크박스 열 -->
                  <th>상품명</th>
                  <th>상품이미지</th>
                  <th>옵션</th>
                  <th>수량</th>
                  <th>가격</th>
                  <th>총 가격</th>
                  <th>삭제</th> <!-- 삭제 버튼 열 -->
              </tr>
          </thead>
          <tbody>
              <c:forEach var="item" items="${sessionScope.cart}">
                  <tr>
                      <!-- 개별 선택 체크박스 -->
                      <td><input type="checkbox" name="selectedItems" value="${item.itemnum}"></td>
                      <td>${item.product}</td>
                      <td><img src="./image/${item.image1}" alt="${item.product}" width="100"></td>
                      <td>${item.op1}</td>
                      <td>${item.count}</td>
                      <td>${item.price}원</td>
                      <td>${item.price * item.count}원</td>
                      <!-- 각 항목 삭제 버튼 -->
                      <td>
                          <form action="deleteCartItem" method="post">
                              <input type="hidden" name="itemnum" value="${item.itemnum}">
                              <button type="submit">삭제</button>
                          </form>
                      </td>
                  </tr>
              </c:forEach>
          </tbody>
      </table>

      <!-- 총 금액 계산 -->
      <c:set var="totalPrice" value="0" />
      <c:forEach var="item" items="${sessionScope.cart}">
          <c:set var="totalPrice" value="${totalPrice + (item.price * item.count)}" />
      </c:forEach>

      <p>총 금액: ${totalPrice}원</p>

      <!-- 선택된 항목만 구매하는 버튼 -->
      <button type="submit">선택한 상품 구매</button>

      <!-- 전체 삭제 버튼 -->
      </form>
      <form action="clearCart" method="post">
          <button type="submit">전체 삭제</button>
      </form>

      <!-- 로그인 상태를 체크하기 위한 hidden 필드 -->
      <input type="hidden" id="loginState" value="${sessionScope.loginstate}"/>

  </c:if>
</body>
</html>
