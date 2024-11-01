<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Grid</title>
<style>
    .product-container {   
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); 
        gap: 30px; 
        max-width: 1200px; 
        margin: 0 auto;
    }
    
    .product {            /*상품 테두리*/
        border: 1px solid #be241c;
        padding: 15px;
        text-align: center;
        background-color: #f9f9f9; 
        border-radius: 8px; 
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); 
        transition: transform 0.2s ease, border 0.2s ease; 
    }
    
     .product:hover {
        transform: scale(1.02); /* 마우스 오버 시 크기 증가 */
        border: 1px solid #be241c;
        border-top: 12px solid #be241c;
    }
                                           
    .product img {       /*상품 이미지 크기*/
        width: 230px; 
        height: 230px;
        object-fit: cover;
    }

    .product-title {    
    font-family: "Noto Sans KR", sans-serif; /* 기본 폰트 설정 */
    font-weight: 300; /* 얇은 두께 설정 */
    font-size: 15px; 
    margin: 15px 0;
    text-align: left; /* 왼쪽 정렬 추가 */
    height: 50px; 
    }
    
    .product-price {     /* 가격 폰트 설정 */  
        font-family: "Noto Sans KR", sans-serif; /* 기본 폰트 설정 */
        font-size: 15px;
        color: #d32f2f;
        margin: 10px 0;
        text-align: left; /* 왼쪽 정렬 추가 */
    }
    
    .search-container {
    display: flex;
    justify-content: center; /* 가로 중앙 정렬 */
    align-items: center; /* 세로 중앙 정렬 (필요시) */
    padding: 20px; /* 적절한 여백 추가 (선택 사항) */
    padding-top: 50px;
    }
    
    .search-container input {
    padding: 10px; /* 패딩을 약간 늘림 */
    border: 1px solid #ccc; /* 더 부드러운 테두리 색상 */
    width: 400px; /* 원하는 길이로 설정 */
    font-size: 16px; /* 폰트 크기 조정 */
    border-radius: 20px; /* 모서리 둥글게 */
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 부드러운 그림자 추가 */
    transition: border-color 0.3s, box-shadow 0.3s; /* 애니메이션 효과 추가 */
	}
	
	.search-container input:focus {
    border-color: #be241c; /* 포커스 시 테두리 색상 변경 */
    	box-shadow: 0 0 8px rgba(255, 0, 0, 0.5); /* 포커스 시 빨간색 그림자 효과 */
    outline: none; /* 기본 아웃라인 제거 */
	}

	.search-container input::placeholder {
    color: #999; /* 플레이스홀더 색상 조정 */
    font-style: italic; /* 이탤릭체로 스타일 변경 */
    }

   .sort-container {
    display: flex; /* Flexbox 사용 */
    justify-content: flex-end; /* 오른쪽 정렬 */
    margin: 20px 0; /* 여백 조정 */
    margin-right: 330px;
	}

	.sort-container select {
    padding: 5px; /* 패딩 추가 */
    border: 1px solid #ddd; /* 테두리 스타일 */
    border-radius: 4px; /* 모서리 둥글게 */
    margin-right: 0; /* 오른쪽 여백 제거 */
	}

    .category-container {
        display: flex;
        justify-content: center;
        padding: 8px;
        margin-bottom: -50px;     
    }

    .category-button { 
        margin: 5px; 
        padding: 10px 15px;
        border: 1px solid #ddd; 
        background-color: #f9f9f9; 
        color: black; 
        border-radius: 5px; 
        font-family: 'Roboto', sans-serif; 
        font-weight: 300; 
        transition: background-color 0.3s; 
    }

    .category-button:hover {
        background-color: #e0e0e0; 
    }

    .action-button {     
        background-color: #007bff; 
        color: white;
        border: none;
        padding: 10px 15px;
        cursor: pointer;
        margin: 5px;
        border-radius: 5px;
        transition: background-color 0.3s, transform 0.2s;
    }

    .action-button:hover {
        background-color: #0056b3; 
        transform: translateY(-2px); 
    }

    .delete-button {
        background-color: #d32f2f; 
    }

    .delete-button:hover {
        background-color: #c62828; 
    }

    .edit-button {  
        background-color: #444; 
        color: white; 
    }
    
    .edit-button:hover {
        background-color: #333; 
    }
    
   .category-line {
	border-bottom: 2px solid #be241c;
	margin: 0 auto;
    width: 65%;
    padding-top: 40px;
    padding-bottom: 30px;
}
</style>



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
