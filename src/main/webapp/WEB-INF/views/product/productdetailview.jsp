<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Detail Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        table {
            margin: 50px auto;
            width: 90%;
            max-width: 1200px;
            border-collapse: collapse;
        }
        td, th {
            padding: 10px;
            border: 1px solid #ddd;
        }
        .main-image {
            width: 500px;
            height: 550px;
        }
        .product-title {
            font-size: 18px;
            font-weight: bold;
        }
        .price {
            color: black;
            font-size: 20px;
        }
        .option-title {
            font-size: 16px;
            font-weight: bold;
            margin-top: 20px;
            margin-left: 5px;
        }
        .option-container {
            margin: 15px 5px;
        }
        .responsive-image {
            width: 100%;
            height: auto;
            max-width: 1000px;
        }
    </style>
    
    <script>
        function updateTotal() {
            const price = parseFloat("${dto.price}");
            const count = document.getElementById("count").value;
            const total = price * count;
            document.getElementById("tot").innerText = "합계: " + total + "원";
        }

        function toggleOptions() {
            const productType = document.getElementById("productType").value;
            const batOptions = document.getElementById("batOptions");
            const gloveOptions = document.getElementById("gloveOptions");
            
            if (productType === "bat") {
                batOptions.style.display = "block";
                gloveOptions.style.display = "none";
            } else if (productType === "glove") {
                batOptions.style.display = "none";
                gloveOptions.style.display = "block";
            } else {
                batOptions.style.display = "none";
                gloveOptions.style.display = "none";
            }
        }
    </script>  
    
</head>
<body>
    <form action="" method="post" enctype="multipart/form-data">
        <table>
            <tr>
                <td rowspan="6">
                    <img src="./image/${dto.image1}" class="main-image" alt="Main Image">
                </td>
                <td colspan="6" class="product-title">${dto.product}</td>
            </tr>
            <tr>
                <td colspan="6" class="price">판매가 ${dto.price}원</td>
            </tr>
            
            <!-- 제품 유형 선택 -->
            <tr>
                <td colspan="6">
                    <div class="option-title">제품 유형 선택</div>
                    <select id="productType" onchange="toggleOptions()">
                        <option value="">[필수] 제품 유형을 선택해 주세요</option>
                        <option value="bat">배트</option>
                        <option value="glove">글러브</option>
                    </select>
                </td>
            </tr>
            
            <!-- 배트 옵션 선택 영역 -->
            <tr id="batOptions" style="display:none;">
                <td colspan="6">
                    <div class="option-title">배트 사이즈</div>
                    <select name="op1" id="op1">
                        <option value="">[필수] 옵션을 선택해 주세요</option>
                        <option value="33인치/28온스">33인치/28온스</option>
                        <option value="32인치/27온스">32인치/27온스</option>
                    </select>
                </td>
            </tr>
            
            <!-- 글러브 옵션 선택 영역 -->
            <tr id="gloveOptions" style="display:none;">
                <td colspan="6">
                    <div class="option-title">글러브 선택</div>
                    <select name="op2" id="op2">
                        <option value="">[필수] 옵션을 선택해 주세요</option>
                        <option value="우투(왼손착용)">우투(왼손착용)</option>
                        <option value="좌투(오른손착용)">좌투(오른손착용)</option>
                    </select>
                </td>
            </tr>
            
            <!-- 수량 선택 영역 -->
            <tr>
                <td colspan="6">  
                    <label for="count">수량:</label>
                    <input type="number" id="count" name="count" min="1" value="1" onchange="updateTotal()" oninput="updateTotal()">
                </td>
            </tr>
            
            <!-- 합계 -->
            <tr>
                <td colspan="6" id="tot">합계: ${dto.price}원</td>
            </tr>
            
            <!-- 구매 선택 영역 -->
            <tr>
                <td colspan="6">
                    <a href="" onclick="alert('구매 페이지로 이동합니다.'); return true;">바로구매</a>
                </td>
            </tr>
           
            <!-- 상세 이미지 -->
            <tr>
                <td colspan="4" align="center">
                    <img src="./image/${dto.dimage}" class="responsive-image" alt="Detailed Image">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
