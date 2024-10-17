<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
/* General styling for grid layout */
.product-container {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
	/* 상품 카드 크기 증가 */
	gap: 30px; /* 상품 간격 더 넓힘 */
	max-width: 1200px; /* 그리드 전체 폭 더 넓힘 */
	margin: 0 auto;
}

.product {
	border: 1px solid #ddd;
	padding: 30px; /* 상품 카드 패딩 증가 */
	text-align: center;
}

/* Increased image size */
.product img {
	width: 200px; /* 이미지 크기 더 크게 설정 */
	height: 200px;
	object-fit: cover;
}

.product a {
	text-decoration: none;
	color: inherit;
}

/* Increased font size for the product title */
.product-title {
	font-weight: bold;
	font-size: 24px; /* 상품명 폰트 크기 증가 */
	margin: 15px 0;
}

/* Increased font size for the product price */
.product-price {
	color: #d32f2f;
	font-size: 20px; /* 가격 폰트 크기 증가 */
	margin: 10px 0;
}

/* Right-align the sort select dropdown */
.sort-container {
	display: flex;
	justify-content: flex-end; /* 오른쪽 정렬 */
	margin: 20px;
}

.sort-container select {
	margin-left: 10px; /* select와 다른 요소 사이에 공간 추가 */
}

/* Search container styling */
.search-container {
	margin: 20px;
	display: flex;
	justify-content: flex-end; /* 오른쪽 정렬 */
}

.search-container input {
	margin-left: 10px; /* input과 label 사이 공간 추가 */
	padding: 4px;
}
</style>
<!-- 
<script>
    function deleteFaq(cnum) {
        if (confirm('삭제하시면 복구할 수 없습니다.\n정말로 삭제하시겠습니까?')) {
            location.href = 'like_items_delete?likenum=' + likenum;
        }
    }
</script>
 -->
<meta charset="UTF-8">
<title>찜 목록</title>
</head>
<body>
<form action="like_items_delete" method="post">
	<div class="product-container">
		<c:forEach items="${list}" var="like">
			<div class="product">
			<input type="checkbox" name="selectedItems" value="${like.likenum}">
				<a href="productdetail?itemnum=${like.itemnum}">
					<img src="./image/${like.image1}" alt="Product Image" width="100px">
				</a>
				<div class="product-title">${like.product}</div>
				<div class="product-price">${like.price}원</div>
			</div>
		</c:forEach>
	</div>
	<input type="submit" value="선택 삭제">
</form>
</body>
</html>