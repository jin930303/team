<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Grid</title>
 <link href="./css/product/productdeleteout.css" rel="stylesheet"/> 



</head>

<body>

<div class="search-container">
      <input type="text" id="searchInput" oninput="filterProducts()" placeholder="상품명을 입력하세요                                             🔍">
</div>


<!-- 카테고리 버튼 추가 -->
<div class="category-container">
    <button class="category-button" onclick="filterByCategory('')">모두 보기</button>
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

<!-- 정렬 및 검색 부분 -->

<div class="category-line"></div>

<div class="sort-container"> 
        <select id="sortSelect" onchange="sortProducts()">
            <option value="default">-정렬방식-</option>
            <option value="priceAsc">가격 낮은 순</option>
            <option value="priceDesc">가격 높은 순</option>
        </select>
</div>    

<div class="product-container">
    <c:forEach items="${list}" var="aa">
        <div class="product" data-cg_code="${aa.cg_code}"> <!-- 각 상품에 cg_code 추가 -->
            <a href="productdetail?itemnum=${aa.itemnum}">
                <img src="./image/${aa.image1}" alt="Product Image">
            </a>
            <div class="product-title">${aa.product}</div>
            <c:choose>
                <c:when test="${aa.sale > 0}"> <!-- sale이 0보다 큰 경우 -->
                    <div class="product-price">
                        <fmt:formatNumber value="${aa.price}" type="currency" currencySymbol="" /> [${aa.sale}% 세일중] 
                        <fmt:formatNumber value="${aa.saleprice}" type="currency" currencySymbol="" />원
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="product-price">
                        <fmt:formatNumber value="${aa.price}" type="currency" currencySymbol="" />원
                    </div> <!-- 기본 가격 -->
                </c:otherwise>
            </c:choose>
            <button class="action-button edit-button" onclick="window.location.href='producteupdate?itemnum=${aa.itemnum}'">수정</button>
            <button class="action-button delete-button" onclick="confirmDelete('${aa.itemnum}')">삭제</button>
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
