<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색결과</title>
     <link href="./css/product/searchresult.css" rel="stylesheet"/>   
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