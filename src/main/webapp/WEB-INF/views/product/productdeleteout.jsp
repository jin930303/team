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
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
        gap: 30px;
        max-width: 1200px;
        margin: 0 auto;
    }

    .product {
        border: 1px solid #ddd;
        padding: 30px;
        text-align: center;
    }

    .product img {
        width: 200px;
        height: 200px;
        object-fit: cover;
    }

    .product a {
        text-decoration: none;
        color: inherit;
    }

    .product-title {
        font-weight: bold;
        font-size: 24px;
        margin: 15px 0;
    }

    .product-price {
        color: #d32f2f;
        font-size: 20px;
        margin: 10px 0;
    }

    .sort-container {
        display: flex;
        justify-content: flex-end;
        margin: 20px;
    }

    .search-container {
        margin: 20px;
        display: flex;
        justify-content: flex-end;
    }

    .delete-button {
        background-color: #d32f2f;
        color: white;
        border: none;
        padding: 8px 12px;
        cursor: pointer;
        margin-top: 10px;
    }

    .delete-button:hover {
        background-color: #c62828;
    }

    .category-container {
        display: flex;
        justify-content: center; /* 중앙 정렬 */
        margin: 20px;
        flex-wrap: wrap; /* 여러 줄로 감싸기 */
    }

    .category-button {
        margin: 10px; /* 버튼 간격 조정 */
        padding: 10px 15px;
        border: none;
        background-color: #ccc; /* 회색 배경 */
        color: black; /* 글자색 검정 */
        cursor: pointer;
        border-radius: 5px; /* 모서리 둥글게 */
    }

    .category-button:hover {
        background-color: #bbb; /* 호버 시 색상 변경 */
    }
</style>
</head>

<body>

<!-- 카테고리 버튼 추가 -->
<div class="category-container">
    <button class="category-button" onclick="filterByCategory('')">모두 보기</button> <!-- 모든 상품 보기 버튼 -->
    <button class="category-button" onclick="filterByCategory('fcg001')">글러브</button>
    <button class="category-button" onclick="filterByCategory('fcg002')">배트</button>
    <button class="category-button" onclick="filterByCategory('fcg003')">장갑</button>
    <button class="category-button" onclick="filterByCategory('fcg004')">야구화</button>
    <button class="category-button" onclick="filterByCategory('fcg005')">가방</button>
    <button class="category-button" onclick="filterByCategory('fcg006')">의류</button>
    <button class="category-button" onclick="filterByCategory('fcg007')">보호장비</button>
    <button class="category-button" onclick="filterByCategory('fcg008')">야구공</button>
    <button class="category-button" onclick="filterByCategory('fcg010')">굿즈</button>
    <button class="category-button" onclick="filterByCategory('fcg011')">기타용품</button>
</div>

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
        <div class="product" data-cg_code="${aa.cg_code}"> <!-- 각 상품에 cg_code 추가 -->
            <a href="productdetail?itemnum=${aa.itemnum}">
                <img src="./image/${aa.image1}" alt="Product Image">
            </a>
            <div class="product-title">${aa.product}</div>
            <div class="product-price">${aa.price}원</div>
            <button class="edit-button" onclick="window.location.href='producteupdate?itemnum=${aa.itemnum}'">수정</button>
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

        products.sort((a, b) => {
            const priceA = parseInt(a.querySelector(".product-price").textContent.replace("원", "").trim());
            const priceB = parseInt(b.querySelector(".product-price").textContent.replace("원", "").trim());

            if (sortBy === "priceAsc") {
                return priceA - priceB;
            } else if (sortBy === "priceDesc") {
                return priceB - priceA;
            }
            return 0;
        });

        products.forEach(product => productContainer.appendChild(product));
    }

    function filterProducts() { 
        const input = document.getElementById("searchInput").value.toLowerCase();
        const productContainer = document.querySelector(".product-container");
        const products = Array.from(productContainer.children);

        products.forEach(product => {
            const title = product.querySelector(".product-title").textContent.toLowerCase();
            if (title.includes(input)) {
                product.style.display = ""; 
            } else {
                product.style.display = "none"; 
            }
        });
    }

    function filterByCategory(cg_code) {
        const productContainer = document.querySelector(".product-container");
        const products = Array.from(productContainer.children);

        products.forEach(product => {
            const productCode = product.dataset.cg_code;
            if (cg_code === "" || productCode === cg_code) {
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
