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
    
<style>
 
    .h1 {
        font-family: "Nanum Gothic", sans-serif; /* 폰트 설정 */
        text-align: center; /* 제목을 중앙 정렬 */
        color: black; /* 제목 색상을 검은색으로 설정 */
        margin-bottom: 20px; /* 아래 여백 설정 */
        font-weight: bold; /* 글씨를 굵게 설정 */
    }

    .product-container {
        display: grid; /* 그리드 레이아웃 사용 */
        grid-template-columns: repeat(auto-fill, minmax(250px, 1fr)); /* 자동으로 열을 채움 */
        gap: 30px; /* 상품 간 간격 */
        max-width: 1200px; /* 최대 너비 설정 */
        margin: 0 auto; /* 중앙 정렬 */
    }

    .product {
        border: 1px solid #ddd; /* 테두리 색상 */
        padding: 16px; /* 내부 여백 설정 */
        text-align: center; /* 텍스트 중앙 정렬 */
        background-color: #f9f9f9; /* 배경색 설정 */
        border-radius: 8px; /* 모서리 둥글게 */
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
        transition: transform 0.2s; /* 크기 변화 애니메이션 */
    }

    .product:hover {
        transform: scale(1.02); /* 마우스 오버 시 크기 증가 */
    }

    .product img {
        width: 230px; /* 이미지 너비 */
        height: 200px; /* 이미지 높이 */
        object-fit: cover; /* 비율에 맞게 크기 조정 */
    }

    .product-title {
        font-family: "Nanum Gothic", sans-serif; /* 폰트 설정 */
        font-weight: 300; /* 얇은 두께 설정 */
        font-size: 15px; /* 폰트 크기 */
        margin: 15px 0; /* 여백 설정 */
        text-align: left; /* 왼쪽 정렬 */
        height: 50px;
    }

    .product-price {
        font-family: "Nanum Gothic", sans-serif; /* 폰트 설정 */
        color: #d32f2f; /* 가격 색상 설정 */
        font-size: 15px; /* 폰트 크기 */
        margin: 10px 0; /* 여백 설정 */
        text-align: left; /* 왼쪽 정렬 */
    }

    /* 전체 선택 버튼 스타일 */
    #selectAllButton {
        padding: 10px 20px; /* 내부 여백 설정 */
        border: none; /* 테두리 제거 */
        border-radius: 5px; /* 모서리 둥글게 */
        background-color: #be241c; /* 연한 회색 배경 */
        color: white; /* 검정색 텍스트 */
        cursor: pointer; /* 포인터 커서 */
        transition: background-color 0.3s; /* 배경색 변화 애니메이션 */
        font-size: 15px; /* 폰트 크기 */
        margin-right: 10px; /* 오른쪽 여백 설정 */
    }

    #selectAllButton:hover {
        background-color: #8e1a14; /* 호버 시 조금 어두운 회색 */
    }

    input[type="submit"] {
        padding: 10px 20px; /* 내부 여백 설정 */
        border: none; /* 테두리 제거 */
        border-radius: 5px; /* 모서리 둥글게 */
        background-color: #be241c; /* 배경색 설정 */
        color: white; /* 텍스트 색상 */
        cursor: pointer; /* 포인터 커서 */
        transition: background-color 0.3s; /* 배경색 변화 애니메이션 */
    }

    input[type="submit"]:hover {
        background-color: #8e1a14; /* 호버 시 색상 변화 */
    }

    .divider1 {  
        border-top: 1px solid #ddd; /* 상단 테두리 설정 */
        width: 65%; /* 너비 설정 */
        margin: 30px auto; /* 위아래 여백 설정, 중앙 정렬 */
    }  

    .button-container {
        margin-top: 40px; /* 상품 출력 부분과의 간격 */
    }
     /* 기존 코드 유지, 체크박스 숨김 */
    input[type="checkbox"] {
        display: none; /* 체크박스 숨김 */
    }

    /* 체크 상태 표시를 위한 스타일 */
    .product.selected {
        background-color: #e0f7fa; /* 선택 시 배경색 변경 */
        border-color: #0097a7; /* 테두리 색상 변경 */
    }
</style>

    
   <script>
    function confirmDelete() {
        return confirm('선택한 항목들을 삭제하시겠습니까?');
    }

    function toggleSelectAll() {
        const checkboxes = document.querySelectorAll('input[name="selectedItems"]');
        const allChecked = Array.from(checkboxes).every(checkbox => checkbox.checked);
        
        checkboxes.forEach((checkbox) => {
            checkbox.checked = !allChecked; // 현재 상태와 반대로 설정
            const product = checkbox.closest('.product');

            // 체크 상태에 따라 클래스 추가/제거
            if (checkbox.checked) {
                product.classList.add('selected');
            } else {
                product.classList.remove('selected');
            }
        });
    }

    document.addEventListener('DOMContentLoaded', function() {
        document.querySelectorAll('.product').forEach((product) => {
            product.addEventListener('click', function() {
                const checkbox = product.querySelector('input[type="checkbox"]');
                checkbox.checked = !checkbox.checked;

                // 체크 여부에 따라 선택된 스타일 적용
                if (checkbox.checked) {
                    product.classList.add('selected');
                } else {
                    product.classList.remove('selected');
                }
            });
        });
    });
</script>
</head>
<body>
<h1>관심상품</h1> 
<hr class="divider1">
<form action="like_items_delete" method="post" onsubmit="return confirmDelete();">
    <div class="product-container">
        <c:forEach items="${list}" var="like">
            <div class="product">
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
    <div class="button-container">
        <button type="button" id="selectAllButton" onclick="toggleSelectAll()">전체 선택</button>
        <input type="submit" value="선택 삭제">
    </div>
</form>
</body>
</html>
