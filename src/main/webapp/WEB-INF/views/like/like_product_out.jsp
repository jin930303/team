<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Batang&family=Nanum+Gothic&family=Song+Myung&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
<link href="./css/like/like_product_out.css" rel="stylesheet"/>
   <script>
    function confirmDelete() {
        return confirm('선택한 항목들을 삭제하시겠습니까?');
    }

    function toggleSelectAll() {
        const checkboxes = document.querySelectorAll('input[name="selectedItems"]');
        const allChecked = Array.from(checkboxes).every(checkbox => checkbox.checked);
        
        checkboxes.forEach((checkbox) => {
            checkbox.checked = !allChecked; // 현재 상태와 반대로 설정
            const product = checkbox.closest('.product');

            // 체크 상태에 따라 클래스 추가/제거
            if (checkbox.checked) {
                product.classList.add('selected');
            } else {
                product.classList.remove('selected');
            }
        });
    }

    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.product').forEach((product) => {
            product.addEventListener('click', function() {
                const checkbox = product.querySelector('input[type="checkbox"]');
                checkbox.checked = !checkbox.checked;

                // 체크 여부에 따라 선택된 스타일 적용
                if (checkbox.checked) {
                    product.classList.add('selected');
                } else {
                    product.classList.remove('selected');
                }
            });
        });
    });
</script>
</head>
<body>
<div class="flex_container">

	<div class="sidebar_container">
		<div class="sidebar_title"><h2>관심상품</h2></div>
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
			<h1>" ${sessionScope.dto3.nickname} " 님의 관심상품</h1>
		</div>
		<form action="like_items_delete" method="post" onsubmit="return confirmDelete();">
		    <div class="product-container">
		        <c:forEach items="${list}" var="like">
		            <div class="product">
		                <a href="productdetail?itemnum=${like.itemnum}">
		                    <img src="./image/${like.image1}" alt="Product Image" width="100px">
		                </a>
		                <div class="product-title">${like.product}</div>
				<c:choose>
				    <c:when test="${like.sale > 0}">
				        <div class="product-price">
				            [${like.sale}%] <span style="text-decoration: line-through; font-size: 13px; color: #aaaaaa;"> 
				            <fmt:formatNumber value="${like.price}" type="number" groupingUsed="true"/></span> 
				            <fmt:formatNumber value="${like.saleprice}" type="number" groupingUsed="true"/>원
				        </div>
				    </c:when>
				    <c:otherwise>
				        <div class="product-price"><fmt:formatNumber value="${like.price}" type="number" groupingUsed="true"/>원</div>
				    </c:otherwise>
				</c:choose>
		                <input type="checkbox" name="selectedItems" value="${like.likenum}">
		            </div>
		        </c:forEach>
		    </div>
		    <div class="button-container">
		        <button type="button" id="selectAllButton" onclick="toggleSelectAll()">전체 선택</button>
		        <input type="submit" value="선택 삭제">
		    </div>
		</form>
	</main>
</div>
</body>
</html>
