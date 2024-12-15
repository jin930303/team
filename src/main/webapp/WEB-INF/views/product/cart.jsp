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
<title>장바구니</title>
<link href="./css/product/cart.css" rel="stylesheet"/> 

<script type="text/javascript">
  function validateSelection(action) {
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
      return false;  
    }
    
    if(action === 'delete'){
      var selectedItems = [];
      for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
        	 var itemnum = checkboxes[i].value; // itemnum 값
             var cartnum = checkboxes[i].getAttribute('data-cartnum'); // data-cartnum 값
          selectedItems.push({ itemnum: itemnum, cartnum: cartnum });
        }
      }

      if(selectedItems.length > 0){
        $.ajax({
          type: 'post',
          url: 'deleteitems',
          contentType: 'application/json',
          data: JSON.stringify({ items: selectedItems }),  
          async: true,  
          success: function(response) {
            alert("선택한 상품이 삭제되었습니다.");
            location.reload();  
          },
          error: function(xhr, status, error) {
            alert("상품 삭제에 실패했습니다.");
          }
        });
      }
      return false;  
    }
    
    var form = document.getElementById("cartForm");
    form.action = action === 'buy' ? 'buy' : 'delete';
    return true;
  }
</script>
</head>
<body>
<div class="flex_container">

	<div class="sidebar_container">
		<div class="sidebar_title"><h2>장바구니</h2></div>
		<aside class="sidebar">
			<ul>
				<li><a href="myinfo">마이페이지</a></li>
				<li><a href="cart">장바구니</a></li>
				<li><a href="like_product">관심상품</a></li>
				<li><a href="update?id=${sessionScope.dto3.id}">회원정보 수정</a></li>
				<li><a href="delete?id=${sessionScope.dto3.id}&pw=${sessionScope.dto3.pw}">회원탈퇴</a></li>
			</ul>
		</aside>
	</div>
	
	<main class="main-container">
		<div class="title">
			<h1>" ${sessionScope.dto3.nickname} " 님의 장바구니</h1>
		</div>

		<form id="cartForm" method="post" action="#">
			<input type="hidden" id="loginState" value="${loginstate}"> 
			<c:choose>
				<c:when test="${empty items}">
					<p><h1>장바구니에 상품이 없습니다.</h1></p>
				</c:when>
				<c:otherwise>
					<table>
	                	<thead>
	                   		<tr>
			        			<th>상품명</th>
			                    <th>상품이미지</th>
			                    <th width="130px">옵션</th>
								<th width="60px">수량</th>
								<th width="130px">가격</th>
								<th width="130px">총 가격</th>
								<th width="60px">선택</th> 
	                    	</tr>
                		</thead>
						<tbody>
							<c:forEach var="item" items="${items}">
			                	<tr>
			                    	<td>${item.product}</td>
			                        <td><img src="./image/${item.image1}" alt="${item.image1}" width="100"></td>
			                        <td>${item.op1}</td>
			                        <td>${item.count}</td>
			                        <td><fmt:formatNumber value="${item.price}" type="number" pattern="#,##0"/> 원</td>
			                        <td><fmt:formatNumber value="${item.price * item.count}" type="number" pattern="#,##0"/> 원</td>
			                        <td><input type="checkbox" name="selectedItems" value="${item.itemnum}" data-cartnum="${item.cartnum}"></td> 
			                        
								</tr>
							</c:forEach>
		               	</tbody>
		           	</table>
					<div class="submitbutton">
			            <button type="submit" onclick="return validateSelection('buy');">선택한 상품 구매</button>
			            <button type="submit" onclick="return validateSelection('delete');">선택한 상품 삭제</button>
					</div>
				</c:otherwise>
			</c:choose>
		</form>
	</main>
</div>
</body>
</html>
