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

    /* Delete button styling */
    .delete-button {
        background-color: #d32f2f; /* 빨간색 배경 */
        color: white; /* 글자색 흰색 */
        border: none; /* 테두리 없애기 */
        padding: 8px 12px; /* 패딩 */
        cursor: pointer; /* 커서 모양 변경 */
        margin-top: 10px; /* 버튼 위쪽 여백 */
    }

    .delete-button:hover {
        background-color: #c62828; /* 호버 시 색상 변경 */
    }
</style>
</head>

<body>

<div class="sort-container"> 
    <select id="sortSelect" onchange="sortProducts()">
        <option value="default">-정렬방식-</option>
        <option value="priceAsc">가격 낮은 순</option>
        <option value="priceDesc">가격 높은 순</option>
    </select>
</div>

<div class="search-container">
    <input type="text" id="searchInput" oninput="filterProducts()" placeholder="상품명을 입력하세요 🔍">
</div>

<div class="product-container">
    <c:forEach items="${list}" var="aa">
        <div class="product">
            <a href="productdetail?itemnum=${aa.itemnum}">
                <img src="./image/${aa.image1}" alt="Product Image">
            </a>
            <div class="product-title">${aa.product}</div>
            <div class="product-price">${aa.price}원</div>
            <button class="delete-button" onclick="confirmDelete('${aa.itemnum}')">삭제</button>
        </div>
    </c:forEach>
</div>

<script>
    function sortProducts() {
        const select = document.getElementById("sortSelect");
        const sortBy = select.value;
        const productContainer = document.querySelector(".product-container");
        const products = Array.from(productContainer.children);

        // 가격에 따라 정렬 옵션
        products.sort((a, b) => {
            const priceA = parseInt(a.querySelector(".product-price").textContent.replace("원", "").trim());
            const priceB = parseInt(b.querySelector(".product-price").textContent.replace("원", "").trim());

            if (sortBy === "priceAsc") {
                return priceA - priceB;
            } else if (sortBy === "priceDesc") {
                return priceB - priceA;
            }
            return 0; // 기본값: 변경 없음
        });

        // 정렬된 상품을 다시 추가
        products.forEach(product => productContainer.appendChild(product));
    }

    function filterProducts() { 
        const input = document.getElementById("searchInput").value.toLowerCase();
        const productContainer = document.querySelector(".product-container");
        const products = Array.from(productContainer.children);

        products.forEach(product => {
            const title = product.querySelector(".product-title").textContent.toLowerCase();
            if (title.includes(input)) {
                product.style.display = ""; // 보여주기
            } else {
                product.style.display = "none"; // 숨기기
            }
        });
    }

    function confirmDelete(itemnum) {
        if (confirm("정말로 이 상품을 삭제하시겠습니까?")) {
            window.location.href = "productdelete?itemnum=" + itemnum;
        }
    }
</script>

</body>
</html>
