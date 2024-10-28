<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Batang&family=Nanum+Gothic&family=Song+Myung&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>관심상품</title>
    
    <style>
        .title{
        font-family: "Nanum Gothic", sans-serif;
        }
     
        /* 상품 배열 하는거 */
        .product-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 30px; 
            max-width: 1200px; 
            margin: 0 auto;
        }
        /* 상품 테두리 */
        .product {
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

        /* 이미지 크기 설정 */
        .product img {
            width: 200px; 
            height: 200px;
            object-fit: cover;
        }

        /* 상품명 스타일 */
        .product-title {
            font-family: "Nanum Gothic", sans-serif;
            font-weight: 300; /* 얇은 두께 설정 */
            font-size: 15px; 
            margin: 15px 0;
            text-align: left; /* 왼쪽 정렬 */
        }

        /* 가격 스타일 */
        .product-price {
            font-family: "Nanum Gothic", sans-serif;
            color: #d32f2f;
            font-size: 15px; 
            margin: 10px 0;
            text-align: left; /* 왼쪽 정렬 */
        }
    #selectAllButton {
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        background-color: #d3d3d3; /* 연한 회색 배경 */
        color: black; /* 검정색 텍스트 */
        cursor: pointer;
        transition: background-color 0.3s;
        font-size: 15px; /* 폰트 크기 */
        margin-right: 10px; /* 간격 조정 */
    }

    #selectAllButton:hover {
        background-color: #c0c0c0; /* 호버 시 조금 어두운 회색 */
    }
        /* 선택 삭제 버튼 스타일 */
        input[type="submit"] {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: black; /* 배경색 설정 */
            color: white; /* 텍스트 색상 */
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #333; /* 호버 시 색상 변화 */
        }
        
         .divider1 {   /* 상품 경계선 */  
	    border: none; 
	    border-top: 1px solid #ddd; 
	    width: 65%;  
	    margin: 20px auto; 
	    margin-top: 20px;
	    margin-bottom: 45px;  
	    }  
    
    .button-container {
      margin-top: 40px; /* 상품 출력 부분과의 간격 */
    }
    
    </style>
    
    <script>
        // 선택 삭제 확인
        function confirmDelete() {
            return confirm('선택한 항목들을 삭제하시겠습니까?');
        }

        // 전체 선택/해제 기능
        function toggleSelectAll() {
    const checkboxes = document.querySelectorAll('input[name="selectedItems"]');
    const allChecked = Array.from(checkboxes).every(checkbox => checkbox.checked);
    checkboxes.forEach((checkbox) => {
        checkbox.checked = !allChecked; // 현재 상태와 반대로 설정
    });
}

    </script>
</head>
<body>
<h1>관심상품</h1> 
<hr class="divider1">
<form action="like_items_delete" method="post" onsubmit="return confirmDelete();">
    
    <div class="product-container">
        <c:forEach items="${list}" var="like">
            <div class="product">
                <!-- 개별 상품 선택 체크박스 -->
                <a href="productdetail?itemnum=${like.itemnum}">
                    <img src="./image/${like.image1}" alt="Product Image" width="100px">
                </a>
                <div class="product-title">${like.product}</div>
                <div class="product-price">
                    <fmt:formatNumber value="${like.price}" type="number" pattern="#,##0"/>원
                </div>
                <input type="checkbox" name="selectedItems" value="${like.likenum}">
            </div>
        </c:forEach>
    </div>
    <!-- 전체 선택 체크박스 -->
<div class="button-container">
    <button type="button" id="selectAllButton" onclick="toggleSelectAll()">전체 선택</button>
    <input type="submit" value="선택 삭제">
</div>

</form>
</body>
</html>
