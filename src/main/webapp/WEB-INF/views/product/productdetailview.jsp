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
            width: 90%; /* 화면의 90%를 차지하도록 설정 */
            max-width: 1200px; /* 최대 너비 설정 */
            border-collapse: collapse;
        }
        td, th {
            padding: 10px;
            border: 1px solid #ddd;
        }
        /* 메인 이미지 스타일 */
        .main-image {
            width: 500px;
            height: 550px;
        }
        /* 제품 제목 스타일 */
        .product-title {
            font-size: 18px;
            font-weight: bold;
        }
        /* 가격 스타일 */
        .price {
            color: black;
            font-size: 20px;
        }
        /* 옵션 스타일 */
        .option-title {
            font-size: 16px;
            font-weight: bold;
            margin-top: 20px;
            margin-left: 5px;
        }
        .option-container {
            margin: 15px 5px;
        }
        .option-label {
            margin-right: 15px;
            font-size: 14px;
        }
        .option-radio {
            margin-right: 5px;
        }
        /* 필수 옵션 안내 스타일 */
        .option-note {
            font-size: 12px;
            color: grey;
            margin-left: 5px;
        }
        /* 상세 이미지 스타일 */
        .responsive-image {
            width: 100%; /* 테이블 셀 너비에 맞춰 100%로 조정 */
            height: auto; /* 자동 높이 비율 유지 */
            max-width: 1000px; /* 이미지의 최대 너비 설정 */
        }
    </style>
</head>
<body>
		    <!-- 제품 상세 페이지 폼 -->
		    <form action="" method="post" enctype="multipart/form-data">
		    <table>
           
            <!-- 제품 기본 정보 -->
            <tr>
                <td rowspan="5">
                    <!-- 메인 이미지 -->
                    <img src="./image/${dto.image1}" class="main-image" alt="Main Image">
                </td>
                <td colspan="5" class="product-title">${dto.product}</td>
            </tr>
            
            <tr>
                <td colspan="5" class="price">판매가 ${dto.price}원</td>
            </tr>
            
             <!-- 옵션 선택 영역 -->
            <tr>
			    <td colspan="5">
			        <div class="option-title">배트사이즈</div>
			        <select name="op1" id="op1">
			            <!-- 배트 옵션 -->
			            <option value="">[필수] 옵션을 선택해 주세요</option>
			            <option value="33인치/28온스">33인치/28온스</option>
			            <option value="32인치/27온스">32인치/27온스</option>
			        </select>
			    </td>
			</tr>
			
             <!-- 수량 선택 영역 -->
            <tr>
                <td colspan="5" class="count">  
                <label for="count">수량:</label>
                <input type="number" id="count" name="count" min="1" value="1"></td>
            </tr>
           
            <!-- 구매 선택 영역 -->
              <tr>
              <td colspan="5">
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
