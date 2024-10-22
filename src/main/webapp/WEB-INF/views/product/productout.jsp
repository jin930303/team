<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Grid</title>
<style>

    .product-container {   /*상품 배열 하는거*/
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); 
        gap: 30px; 
        max-width: 1200px; 
        margin: 0 auto;
    }
    
    .product {            /*상품 테두리*/
        border: 1px solid #ddd;
        padding: 20px;
        text-align: center;
        background-color: #f9f9f9; 
        border-radius: 8px; 
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); 
        transition: transform 0.2s; 
    }
    
     .product:hover {
        transform: scale(1.05); /* 마우스 오버 시 크기 증가 */
    }
                                           
    .product img {       /*상품 이미지 크기*/
        width: 200px; 
        height: 200px;
        object-fit: cover;
    }

    .product-title {     /* 상품명 폰트 설정 */    
        font-weight: bold;
        font-size: 24px; 
        margin: 15px 0;
    }
    
    .product-price {     /* 가격 폰트 설정 */  
        color: #d32f2f;
        font-size: 20px; 
        margin: 10px 0;
    }
    
    .sort-container { 	 /* 정렬 방식 위치 설정 */  
        display: flex;
        justify-content: flex-end;
        margin: 20px;
        margin-right: 330px;
        margin-top: 60px;
    }

    .search-container {   /* 검색 위치 설정 */  
        margin: 20px;
        display: flex;
        justify-content: flex-end;
        margin-right: 330px;
        margin-bottom: 60px;
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
 
 <c:choose>
    <c:when test="${aa.sale > 0}"> <!-- sale이 0보다 큰 경우 -->
        <div class="product-price">[${aa.sale}% 세일중] ${aa.price}원 → ${aa.saleprice}원</div>
    </c:when>
    <c:otherwise>
        <div class="product-price">${aa.price}원</div> <!-- 기본 가격 -->
    </c:otherwise>
</c:choose>

        <c:choose>
            <c:when test="${loginstate eq true}">
                <c:set var="isLiked" value="false" />
                <c:forEach items="${like}" var="like">
                    <c:if test="${sessionScope.dto3.id eq like.id && aa.itemnum eq like.itemnum}">
                        <c:set var="isLiked" value="true" />
                    </c:if>
                </c:forEach>

                <c:choose>
                    <c:when test="${isLiked eq true}">
                        <div>
                            <a href="like_save?itemnum=${aa.itemnum}">
                               👍 따봉
                            </a>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div>
                            <a href="like_save?itemnum=${aa.itemnum}"> 	
                                👍 따봉
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </c:when>

            <c:otherwise>
                <div>
                 👍 따봉
                </div>
            </c:otherwise>
        </c:choose>
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
    //검색옵션
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
</script>

</body>
</html>
