<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
 
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Batang&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Song+Myung&display=swap" rel="stylesheet">

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
        padding: 16px;
        text-align: center;
        background-color: #f9f9f9; 
        border-radius: 8px; 
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); 
        transition: transform 0.2s; 
    }
    
     .product:hover {
        transform: scale(1.02); /* 마우스 오버 시 크기 증가 */
    }
                                           
    .product img {       /*상품 이미지 크기*/
        width: 200px; 
        height: 200px;
        object-fit: cover;
    }

   .product-title {    
    font-family: "Noto Sans KR", sans-serif; /* 기본 폰트 설정 */
    font-weight: 300; /* 얇은 두께 설정 */
    font-size: 15px; 
    margin: 15px 0;
    text-align: left; /* 왼쪽 정렬 추가 */
}
    
    .product-price {     /* 가격 폰트 설정 */  
        font-family: "Noto Sans KR", sans-serif; /* 기본 폰트 설정 */
        font-size: 15px;
        color: #d32f2f;
        margin: 10px 0;
        text-align: left; /* 왼쪽 정렬 추가 */
    }
    
 .search-sort-container {
    font-family: "Noto Sans KR", sans-serif; /* 기본 폰트 설정 */
    display: flex;
    justify-content: flex-end;
    margin: 20px;
    margin-right: 330px;
    margin-top: 4px;
}

.search-container input {
    padding: 7px; /* 패딩 추가 */
    border: 1px solid #ccc; /* 테두리 스타일 */
    border-radius: 4px; /* 모서리 둥글게 */
    margin-right: 280px; /* 정렬을 위한 마진 */
    width: 400px; /* 원하는 길이로 설정 */
    font-size: 15px; /* 폰트 크기 설정 */
    
}

.sort-container select {
    padding: 5px; /* 패딩 추가 */
    border: 1px solid #ccc; /* 테두리 스타일 */
    border-radius: 4px; /* 모서리 둥글게 */
}
 
    .divider1 {   /* 상품 경계선 */  
    border: none; 
    border-top: 1px solid #ddd; 
    width: 65%;  
    margin: 20px auto; 
    margin-top: 5px;
    margin-bottom: 45px;  
    }
    
     .divider2 {   /* 상품 경계선 */  
    border: none; 
    border-top: 1px solid #ddd; 
    width: 65%;  
    margin: 20px auto; 
    margin-top: -5px;
    margin-bottom: 18px;   
    }

.divider3 {   /* 상품 경계선 */  
   border: none; 
    border-top: 1px solid #ddd; 
    width: 65%;  
    margin: 20px auto; 
    margin-top: -20px;
    margin-bottom: -5px;   
    }

 .category-container {
        display: flex;
        justify-content: center;
        padding: 16px;
        
    }

    .category-list {
        list-style: none;
        padding: 0;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
    }

    .category-list li {
        margin: 10px;
        padding: 15px;
        border: 1px solid #ddd; /* 네모 테두리 */
        text-align: center;
        transition: background-color 0.3s;
    }

    .category-list li a {
        text-decoration: none;
        color: #333;
        display: block; /* 전체 영역 클릭 가능 */
    }

    .category-list li:hover {
        background-color: #f0f0f0; /* 호버 효과 */
    }

.category-title {
    font-family: "Noto Sans KR", sans-serif;
    font-size: 24px; /* 제목 크기 설정 */
    font-weight: bold; /* 굵게 설정 */
    text-align: center; /* 중앙 정렬 */
    margin-bottom: 1px; /* 아래쪽 마진 추가 */
}

.category-items {
    list-style: none; /* 기본 리스트 스타일 제거 */
    padding: 0; /* 패딩 제거 */
    text-align: center; /* 중앙 정렬 */
}

.category-items li {
    margin: 5px 0; /* 리스트 항목 간의 간격 설정 */
}

.breadcrumb {
    background-color: transparent; /* 배경색 없음 */
    padding: 10px; /* 적당한 패딩 추가 (선택 사항) */
    margin-left: 320px; /* 왼쪽 마진을 20px로 설정하여 약간 오른쪽으로 이동 */
    margin-right: 0; /* 오른쪽 마진 0 */
    text-align: left; /* 텍스트 왼쪽 정렬 */
}

</style>
</head>
<body>
<div class="breadcrumb">
	<c:choose>
	    <c:when test="${scg_code == 'mitt001'}">
	        <span>글러브 > </span><span>투수/올라운드</span>
	    </c:when>
	    <c:when test="${scg_code == 'mitt002'}">
	        <span>글러브 > </span><span>내야수</span>
	    </c:when>
	    <c:when test="${scg_code == 'mitt003'}">
	        <span>글러브 > </span><span>외야수</span>
	    </c:when>
	    <c:when test="${scg_code == 'mitt004'}">
	        <span>글러브 > </span><span>포수 미트</span>
	    </c:when>
	    <c:when test="${scg_code == 'mitt005'}">
	        <span>글러브 > </span><span>어린이용</span>
	    </c:when>
	    <c:when test="${scg_code == 'mitt006'}">
	        <span>글러브 > </span><span>관리용품</span>
	    </c:when>
	    
        <c:when test="${scg_code == 'bat001'}">
            <span>배트 > </span><span>알루미늄 배트</span>
        </c:when>
        <c:when test="${scg_code == 'bat002'}">
            <span>배트 > </span><span>카본/컴포짓</span>
        </c:when>
        <c:when test="${scg_code == 'bat003'}">
            <span>배트 > </span><span>나무배트</span>
        </c:when>
        <c:when test="${scg_code == 'bat004'}">
            <span>배트 > </span><span>펑고배트</span>
        </c:when>
        <c:when test="${scg_code == 'bat005'}">
            <span>배트 > </span><span>유소년용 배트</span>
        </c:when>
        <c:when test="${scg_code == 'bat006'}">
            <span>배트 > </span><span>트레이닝 배트</span>
        </c:when>
        <c:when test="${scg_code == 'bat008'}">
            <span>배트 > </span><span>배트그립</span>
        </c:when>
        <c:when test="${scg_code == 'bat009'}">
            <span>배트 > </span><span>배트용품</span>
        </c:when>
        
	    <c:when test="${scg_code == 'glove001'}">
	        <span>장갑 > </span><span>배팅장갑</span>
	    </c:when>
	    <c:when test="${scg_code == 'glove002'}">
	        <span>장갑 > </span><span>수비장갑</span>
	    </c:when>
	    <c:when test="${scg_code == 'glove003'}">
	        <span>장갑 > </span><span>주루장갑</span>
	    </c:when>
	    <c:when test="${scg_code == 'glove004'}">
	        <span>장갑 > </span><span>방한장갑</span>
	    </c:when>
	    <c:when test="${scg_code == 'glove005'}">
	        <span>장갑 > </span><span>유소년용 장갑</span>
	    </c:when>
	    
	    <c:when test="${scg_code == 'shoes001'}">
	        <span>신발 > </span><span>징 일체형</span>
	    </c:when>
	    <c:when test="${scg_code == 'shoes003'}">
	        <span>신발 > </span><span>인조잔디화</span>
	    </c:when>
	    <c:when test="${scg_code == 'shoes004'}">
	        <span>신발 > </span><span>포인트화</span>
	    </c:when>
	    <c:when test="${scg_code == 'shoes006'}">
	        <span>신발 > </span><span>야구화부속품</span>
	    </c:when>
	    
	    <c:when test="${scg_code == 'bag001'}">
        <span>가방 > </span><span>백팩</span>
	    </c:when>
	    <c:when test="${scg_code == 'bag002'}">
	        <span>가방 > </span><span>크로스백</span>
	    </c:when>
	    <c:when test="${scg_code == 'bag004'}">
	        <span>가방 > </span><span>휠가방</span>
	    </c:when>
	    <c:when test="${scg_code == 'bag005'}">
	        <span>가방 > </span><span>배트가방</span>
	    </c:when>
	    <c:when test="${scg_code == 'bag006'}">
	        <span>가방 > </span><span>볼가방</span>
	    </c:when>
	        
	    <c:when test="${scg_code == 'clothes001'}">
	    <span>의류 > </span><span>티셔츠</span>
	    </c:when>
	    <c:when test="${scg_code == 'clothes002'}">
	        <span>의류 > </span><span>언더셔츠</span>
	    </c:when>
	    <c:when test="${scg_code == 'clothes003'}">
	        <span>의류 > </span><span>슬라이딩팬츠</span>
	    </c:when>
	    <c:when test="${scg_code == 'clothes004'}">
	        <span>의류 > </span><span>롱/숏스판팬츠</span>
	    </c:when>
	    <c:when test="${scg_code == 'clothes005'}">
	        <span>의류 > </span><span>아이싱웨어</span>
	    </c:when>
	    <c:when test="${scg_code == 'clothes006'}">
	        <span>의류 > </span><span>바람막이</span>
	    </c:when>
	    <c:when test="${scg_code == 'clothes008'}">
	        <span>의류 > </span><span>점퍼</span>
	    </c:when>
	    <c:when test="${scg_code == 'clothes009'}">
	        <span>의류 > </span><span>트레이닝복</span>
	    </c:when>
	    <c:when test="${scg_code == 'clothes010'}">
	        <span>의류 > </span><span>맨투맨/후디</span>
	    </c:when>
	    
	    <c:when test="${scg_code == 'protect001'}">
        <span>보호장비 > </span><span>타자헬멧</span>
	    </c:when>
	    <c:when test="${scg_code == 'protect002'}">
	        <span>보호장비 > </span><span>암가드</span>
	    </c:when>
	    <c:when test="${scg_code == 'protect003'}">
	        <span>보호장비 > </span><span>풋가드</span>
	    </c:when>
	    <c:when test="${scg_code == 'protect004'}">
	        <span>보호장비 > </span><span>핸드가드</span>
	    </c:when>
	    <c:when test="${scg_code == 'protect005'}">
	        <span>보호장비 > </span><span>안면마스크</span>
	    </c:when>
	    <c:when test="${scg_code == 'protect006'}">
	        <span>보호장비 > </span><span>기타 보호장비</span>
	    </c:when>
	    
	    <c:when test="${scg_code == 'baseball001'}">
        <span>야구공 > </span><span>경식구</span>
	    </c:when>
	    <c:when test="${scg_code == 'baseball002'}">
	        <span>야구공 > </span><span>연식구</span>
	    </c:when>
	    <c:when test="${scg_code == 'baseball004'}">
	        <span>야구공 > </span><span>스냅볼</span>
	    </c:when>
	    <c:when test="${scg_code == 'baseball007'}">
	        <span>야구공 > </span><span>야구공 보관함</span>
	    </c:when>
	    
	    <c:when test="${scg_code == 'goods001'}">
        <span>굿즈 > </span><span>키링</span>
	    </c:when>
	    <c:when test="${scg_code == 'goods002'}">
	        <span>굿즈 > </span><span>타올</span>
	    </c:when>
	    <c:when test="${scg_code == 'goods003'}">
	        <span>굿즈 > </span><span>인형</span>
	    </c:when>
	    <c:when test="${scg_code == 'goods004'}">
	        <span>굿즈 > </span><span>슬리퍼</span>
	    </c:when>
	    
	    <c:when test="${scg_code == 'etc001'}">
        <span>기타용품 > </span><span>선글라스</span>
	    </c:when>
	    <c:when test="${scg_code == 'etc002'}">
	        <span>기타용품 > </span><span>악세사리</span>
	    </c:when>
	    <c:when test="${scg_code == 'etc003'}">
	        <span>기타용품 > </span><span>손목밴드</span>
	    </c:when>
	    <c:when test="${scg_code == 'etc004'}">
	        <span>기타용품 > </span><span>로진백</span>
	    </c:when>
	    <c:when test="${scg_code == 'etc007'}">
	        <span>기타용품 > </span><span>베이스</span>
	    </c:when>
    </c:choose>
</div>

<hr class="divider3"> <!-- 경계선 추가 -->

<div class="category-container">
    <nav>
        <ul class="category-list">
        
        <c:choose>
        
            <c:when test="${scg_code == 'mitt001' || scg_code == 'mitt002' || scg_code == 'mitt003' 
            || scg_code == 'mitt004' || scg_code == 'mitt005' || scg_code == 'mitt006'}">                   
            <li><a href="pitcherallround">투수/올라운드</a></li>
            <li><a href="infielder">내야수</a></li>
            <li><a href="outfielder">외야수</a></li>
            <li><a href="catchersmitt">포수미트</a></li>
            <li><a href="youth">어린이용/유소년용</a></li>
            <li><a href="glovecare">글러브 관리용품</a></li>
            </c:when>
            
            <c:when test="${scg_code == 'bat001' || scg_code == 'bat002' || scg_code == 'bat003' 
               || scg_code == 'bat004' || scg_code == 'bat005' || scg_code == 'bat006' 
               || scg_code == 'bat007' || scg_code == 'bat008' || scg_code == 'bat009'}"> 
		    <li><a href="arbat">알루미늄 배트</a></li>
			<li><a href="carbonbat">카본/컴포짓</a></li>
			<li><a href="woodbat">나무배트</a></li>
			<li><a href="pungbat">펑고배트</a></li>
			<li><a href="youngbat">유소년용 배트</a></li>
			<li><a href="trainingbat">트레이닝 배트</a></li>
			<li><a href="batgrip">배트그립</a></li>
			<li><a href="bataccessories">배트용품</a></li>
		    </c:when>
             
            <c:when test="${scg_code == 'glove001' || scg_code == 'glove002' || scg_code == 'glove003' 
               || scg_code == 'glove004' || scg_code == 'glove005'}">
		    <li><a href="batting-gloves">배팅장갑</a></li>
		    <li><a href="fielding-gloves">수비장갑</a></li>
		    <li><a href="base-running-gloves">주루장갑</a></li>
		    <li><a href="thermal-gloves">방한장갑</a></li>
		    <li><a href="youth-gloves">유소년용 장갑</a></li>
			</c:when>
                        
			<c:when test="${scg_code == 'shoes001' ||  scg_code == 'shoes003' 
               || scg_code == 'shoes004'  || scg_code == 'shoes006'}">
               <li><a href="integrated-spikes">징 일체형</a></li>		  
			   <li><a href="turf-shoes">인조잔디화</a></li>
			   <li><a href="point-shoes">포인트화</a></li>			 
			   <li><a href="shoe-accessories">야구화부속품</a></li>
            </c:when>
			
			<c:when test="${scg_code == 'bag001' || scg_code == 'bag002' || scg_code == 'bag004' 
			    || scg_code == 'bag005' || scg_code == 'bag006'}">
			    <li><a href="backpacks">백팩</a></li>
			    <li><a href="crossbody-bags">크로스백</a></li>
			    <li><a href="wheeled-bags">휠가방</a></li>
			    <li><a href="bat-bags">배트가방</a></li>
			    <li><a href="ball-bags">볼가방</a></li>
			</c:when>
			
			<c:when test="${scg_code == 'clothes001' || scg_code == 'clothes002' || scg_code == 'clothes003' 
			     || scg_code == 'clothes004' || scg_code == 'clothes005' || scg_code == 'clothes006' 
			     || scg_code == 'clothes008' || scg_code == 'clothes009' 
			     || scg_code == 'clothes010'}">
			    <li><a href="t-shirts">티셔츠</a></li>
			    <li><a href="undershirts">언더셔츠</a></li>
			    <li><a href="sliding-pants">슬라이딩팬츠</a></li>
			    <li><a href="long-short-pants">롱/숏스판팬츠</a></li>
			    <li><a href="icing-wear">아이싱웨어</a></li>
			    <li><a href="windbreakers">바람막이</a></li>
			    <li><a href="jackets">점퍼</a></li>
			    <li><a href="training-wear">트레이닝복</a></li>
			    <li><a href="hoodies">맨투맨/후디</a></li>
			    <li><a href="hats-belts-socks">모자/벨트/양말</a></li>
			</c:when>
            
            <c:when test="${scg_code == 'protect001' || scg_code == 'protect002' || scg_code == 'protect003' 
               || scg_code == 'protect004' || scg_code == 'protect005' || scg_code == 'protect006'}">
			    <li><a href="batter-helmets">타자헬멧</a></li>
			    <li><a href="arm-guards">암가드</a></li>
			    <li><a href="foot-guards">풋가드</a></li>
			    <li><a href="hand-guards">핸드가드</a></li>
			    <li><a href="face-masks">안면마스크</a></li>
			    <li><a href="other-protective-gear">기타 보호장비</a></li>
			</c:when>
            
            <c:when test="${scg_code == 'baseball001' || scg_code == 'baseball002' || scg_code == 'baseball004' 
               || scg_code == 'baseball007'}">
			    <li><a href="hard-balls">경식구</a></li>
			    <li><a href="soft-balls">연식구</a></li>
			    <li><a href="snap-balls">스냅볼</a></li>
			    <li><a href="ball-storage">야구공 보관함</a></li>
			</c:when>
            
            <c:when test="${scg_code == 'goods001' || scg_code == 'goods002' || scg_code == 'goods003' 
               || scg_code == 'goods004'}">
			    <li><a href="keyring">키링</a></li>
			    <li><a href="towel">타올</a></li>
			    <li><a href="doll">인형</a></li>
			    <li><a href="headbands-bracelets">슬리퍼</a></li>
			</c:when>
            
            <c:when test="${scg_code == 'etc001' || scg_code == 'etc002' || scg_code == 'etc003' 
               || scg_code == 'etc004' || scg_code == 'etc007'}">
			    <li><a href="sunglasses">선글라스</a></li>
			    <li><a href="accessories">악세사리</a></li>
			    <li><a href="wristbands">손목밴드</a></li>
			    <li><a href="rosin-bags">로진백</a></li>
			    <li><a href="bases">베이스</a></li>
			</c:when>
                        
          </c:choose>
        
        </ul>
    </nav>
</div>

<hr class="divider2"> <!-- 경계선 추가 -->

<div class="search-sort-container">
    <div class="search-container">
        <input type="text" id="searchInput" oninput="filterProducts()" placeholder="상품명을 입력하세요 🔍">
    </div>

    <div class="sort-container"> 
        <select id="sortSelect" onchange="sortProducts()">
            <option value="default">-정렬방식-</option>
            <option value="priceAsc">가격 낮은 순</option>
            <option value="priceDesc">가격 높은 순</option>
        </select>
    </div>
</div>


<hr class="divider1"> <!-- 경계선 추가 -->

<div class="product-container">
<c:forEach items="${list}" var="aa">
    <div class="product">
        <a href="productdetail?itemnum=${aa.itemnum}">
            <img src="./image/${aa.image1}" alt="Product Image">
        </a>
        <div class="product-title">
             <a href="productdetail?itemnum=${aa.itemnum}" style="text-decoration: none; color: black;">${aa.product}</a>
        </div>
 
 <c:choose>
    <c:when test="${aa.sale > 0}">
        <div class="product-price">[${aa.sale}% 세일중] <fmt:formatNumber value="${aa.price}" type="number" groupingUsed="true"/>원 → <fmt:formatNumber value="${aa.saleprice}" type="number" groupingUsed="true"/>원</div>
    </c:when>
    <c:otherwise>
        <div class="product-price"><fmt:formatNumber value="${aa.price}" type="number" groupingUsed="true"/>원</div>
    </c:otherwise>
</c:choose>

<c:choose>
	<c:when test="${loginstate==true}">
		<div><a href="like_save?itemnum=${aa.itemnum}">👍 따봉</a></div>
	</c:when>
	
	<c:otherwise>
		<div><a href="login?redirect" onclick="showLoginAlert()">👍 따봉</a></div>
	</c:otherwise>
</c:choose>
	
    </div>
</c:forEach>
</div>

<script>
function showLoginAlert() {
    alert("로그인 후 이용해주세요!");
}
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
