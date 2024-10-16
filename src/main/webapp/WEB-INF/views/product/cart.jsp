<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 로그인 상태 확인 --%>
<c:choose>
    <c:when test="${loginstate != true}">
        <script type="text/javascript">
            alert("로그인 후 이용해주세요.");
            window.location.href = "login?redirect=cart"; // 로그인 페이지로 리다이렉트
        </script>
    </c:when>
</c:choose>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script type="text/javascript">
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
	
    var loginState = document.getElementById("loginState").value;
    
    
    return true;  // 폼 전송 허용
  }
</script>
</head>
<body>
  <h1>장바구니</h1>

  <!-- 장바구니가 비어있을 때 처리 -->
  <c:if test="${empty sessionScope.cart or empty sessionScope.cart.size()}">
      <p>장바구니가 비어있습니다.</p>
  </c:if>

  <!-- 장바구니에 아이템이 있을 때 처리 -->
  <c:if test="${not empty sessionScope.cart and not empty sessionScope.cart.size()}">
      <!-- 선택된 항목 구매 및 삭제를 위한 단일 폼 -->
      <form action="processSelectedItems" method="post" onsubmit="return validateSelection()">
      
      <table>
          <thead>
              <tr>
                  <th>선택</th>
                  <th>상품명</th>
                  <th>상품이미지</th>
                  <th>옵션</th>
                  <th>수량</th>
                  <th>가격</th>
                  <th>총 가격</th>
              </tr>
          </thead>
          <tbody>
              <c:forEach var="item" items="${sessionScope.cart}">
                  <tr>
                      
                      <td><input type="checkbox" name="selectedItems" value="${item.itemnum}"></td>
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

      
      <c:set var="totalPrice" value="0" />
      <c:forEach var="item" items="${sessionScope.cart}">
          <c:set var="totalPrice" value="${totalPrice + (item.price * item.count)}" />
      </c:forEach>

      <p>총 금액: ${totalPrice}원</p>

      
      <button type="submit" name="action" value="buy">선택한 상품 구매</button>

      
      <button type="submit" name="action" value="delete">선택한 상품 삭제</button>

      </form>
  </c:if>
</body>
</html>
