<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
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
    font-family: "Nanum Gothic", sans-serif;
    font-weight: 300; /* 얇은 두께 설정 */
    font-size: 15px; 
    margin: 15px 0;
    text-align: left; /* 왼쪽 정렬 추가 */
}
    
    .product-price {     /* 가격 폰트 설정 */  
        font-family: "Nanum Gothic", sans-serif;
        color: #d32f2f;
        font-size: 15px; 
        margin: 10px 0;
        text-align: left; /* 왼쪽 정렬 추가 */
    }
     .divider1 {   /* 상품 경계선 */  
	    border: none; 
	    border-top: 1px solid #ddd; 
	    width: 65%;  
	    margin: 20px auto; 
	    margin-top: 20px;
	    margin-bottom: 45px;  
	    }  
    </style>
</head>
<body>
<h1>검색상품</h1>
<hr class="divider1"> 
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
</body>
</html>