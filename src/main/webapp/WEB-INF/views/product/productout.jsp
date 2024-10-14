<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Grid</title>
<style>
    /* General styling for grid layout */
    .product-container {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); /* 상품 카드 크기 증가 */
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
</style>
</head>

<body>

<div style="margin: 20px;"> 
    <select id="sortSelect" onchange="sortProducts()">
        <option value="default">-정렬방식-</option>
        <option value="priceAsc">가격 낮은 순</option>
        <option value="priceDesc">가격 높은 순</option>
    </select>
</div>

<div class="product-container">
    <c:forEach items="${list}" var="aa">
        <div class="product">
            <a href="productdetail?itemnum=${aa.itemnum}">
                <img src="./image/${aa.image1}" alt="Product Image">
            </a>
            <div class="product-title">${aa.product}</div>
            <div class="product-price">${aa.price}원</div>
        </div>
    </c:forEach>
</div>

</body>
</html>
