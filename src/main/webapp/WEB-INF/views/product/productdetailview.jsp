<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Batang&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Song+Myung&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>상품 상세 페이지</title>
 <style>
 
    body {
    font-family: "Noto Sans KR", sans-serif; /* 기본 폰트 설정 */
    background-color: #f4f4f4; /* 배경 색상 설정 */
}

table {
    width: 70%; /* 테이블 너비 설정 */
    margin: auto; /* 중앙 정렬 */
    background-color: #fff; /* 테이블 배경 색상 */
    border-radius: 10px; /* 모서리 둥글게 */
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

th, td {
    padding: 15px; /* 셀 안쪽 여백 설정 */
    text-align: center; /* 텍스트 중앙 정렬 */
    border-bottom: 1px solid #ddd; /* 하단 경계선 설정 */
}

.main-image {
    width: 500px; /* 이미지 너비 설정 */
    border-radius: 10px; /* 이미지 모서리 둥글게 */   
}

.product-title {
    font-family: "Noto Sans KR", sans-serif; /* 제목 폰트 설정 */
    font-size: 24px; /* 제목 글자 크기 */
    color: #333; /* 제목 글자 색상 */
}

.price {
    font-family: "Noto Sans KR", sans-serif; /* 가격 폰트 설정 */
    font-size: 16px; /* 가격 글자 크기 */
    color: #FF5722; /* 가격 글자 색상 */
}

.option-title {
    font-family: "Noto Sans KR", sans-serif; /* 옵션 제목 폰트 설정 */
    font-size: 16px; /* 옵션 제목 글자 크기 */
    margin: 10px 0; /* 상하 여백 설정 */
}

.count-input {
    font-family: "Noto Sans KR", sans-serif; /* 수량 입력 필드 폰트 설정 */
    width: 50px; /* 수량 입력 필드 너비 설정 */
    margin-left: 10px; /* 왼쪽 여백 설정 */
}

.d-image{
    width: 750px; /* 이미지 너비 설정 */
}

.button {
    background-color: black; /* 기본 버튼 배경 색상 */
    color: white; /* 버튼 글자 색상 */
    border: none; /* 테두리 제거 */
    padding: 12px 20px; /* 버튼 패딩 설정 */
    border-radius: 5px; /* 버튼 모서리 둥글게 */
    cursor: pointer; /* 커서 변경 */
    transition: background-color 0.3s; /* 배경 색상 변화 애니메이션 */
    margin: 5px; /* 여백 설정 */
    font-size: 16px; /* 버튼 글자 크기 */
}

.button:hover {
    background-color: #333; /* 호버 시 배경 색상 변화 */
}

.button1 {
    background-color: white; /* 흰색 버튼 배경 */
    color: black; /* 버튼 글자 색상 */
    border: 1px solid #ccc; /* 테두리 설정 */
    padding: 12px 20px; /* 버튼 패딩 설정 */
    border-radius: 5px; /* 버튼 모서리 둥글게 */
    cursor: pointer; /* 커서 변경 */
    transition: background-color 0.3s; /* 배경 색상 변화 애니메이션 */
    margin: 5px; /* 여백 설정 */
    font-size: 16px; /* 버튼 글자 크기 */
}

.button1:hover {
    background-color: #f0f0f0; /* 호버 시 배경 색상 변화 */
}

.button2 {
    background-color: #be241c; /* 두 번째 버튼 배경 색상 */
    color: white; /* 버튼 글자 색상 */
    border: 1px solid #ccc; /* 테두리 설정 */
    padding: 12px 20px; /* 버튼 패딩 설정 */
    border-radius: 5px; /* 버튼 모서리 둥글게 */
    cursor: pointer; /* 커서 변경 */
    transition: background-color 0.3s; /* 배경 색상 변화 애니메이션 */
    margin: 5px; /* 여백 설정 */
    font-size: 16px; /* 버튼 글자 크기 */
}

.button2:hover {
    background-color: #8e1a14; /* 호버 시 배경 색상 변화 */
}

.detail {
    font-family: "Noto Sans KR", sans-serif; /* 상세 설명 폰트 설정 */
    font-size: 16px; /* 상세 설명 글자 크기 */
    padding: 15px; /* 패딩 설정 */
    margin-top: 80px; /* 상단 여백 설정 */
}

label {
    font-family: "Noto Sans KR", sans-serif; /* 폰트 설정 */
    font-size: 16px; /* 글자 크기 설정 */
    font-weight: normal; /* 폰트 두께 설정 */
}

</style>
    <script>
        function updateTotal() {
            const price = parseFloat("${dto.price}");
            const saleprice = parseFloat("${dto.saleprice}");
            const count = document.getElementById("count").value;
            const total = (saleprice > 0 ? saleprice : price) * count;
            document.getElementById("tot").innerText = "합계: " + total + "원";
        }
        
        function addToCart() {
            const loginState = document.getElementById("loginState").value;
            if (!loginState) {
                alert("로그인 후 이용해주세요.");
                window.location.href = "login";
                return;
            }
            const op1Select = document.getElementById("op1_select");
            if (op1Select && op1Select.value === "") {
                alert("옵션을 선택해주세요.");
                return;
            }
            document.getElementById("productForm").submit();
            alert("장바구니에 상품이 추가되었습니다.");
        }

        function buyNow() {
            const loginState = document.getElementById("loginState").value;
            if (!loginState) {
                alert("로그인 후 이용해주세요.");
                window.location.href = "login";
                return;
            }
            const op1Select = document.getElementById("op1_select");
            if (op1Select && op1Select.value === "") {
                alert("옵션을 선택해 주세요.");
                return;
            }
            document.getElementById("productForm").action = "/team/buydirectitem";
            document.getElementById("productForm").submit();
        }
        
        function formatNumber(num) {
            return num.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }

        function updateTotal() {
            const price = parseFloat("${dto.price}");
            const saleprice = parseFloat("${dto.saleprice}");
            const count = document.getElementById("count").value;
            const total = (saleprice > 0 ? saleprice : price) * count;
            document.getElementById("tot").innerText = "합계: " + formatNumber(total) + "원";
        }

    </script>
</head>
<body>
<% 
    Boolean loginState = (Boolean) session.getAttribute("loginstate");
%>
    <form id="productForm" action="/team/insertcart" method="post" enctype="multipart/form-data">
        <input type="hidden" name="itemnum" id="itemnum" value="${dto.itemnum}">
        <input type="hidden" name="price" id="price" value="${dto.sale > 0 ? dto.saleprice : dto.price}">
        <input type="hidden" name="product" id="product" value="${dto.product}">
        <input type="hidden" name="image1" id="image1" value="${dto.image1}">
        <input type="hidden" id="loginState" value="${sessionScope.loginstate}">
        <input type="hidden" name="id" id="id" value="${sessionScope.dto3.id}">

        <table>
            <tr>
                <td rowspan="6">
                    <img src="./image/${dto.image1}" class="main-image" alt="Main Image">
                </td>
                <td colspan="5" class="product-title">${dto.product}</td>
            </tr>
            <tr>
                <td colspan="5" class="price">
   				 <c:choose>
       				 <c:when test="${dto.sale > 0}">
        				 판매가 [${dto.sale}% 세일중] <fmt:formatNumber value="${dto.price}" pattern="#,###"/>원 → <fmt:formatNumber value="${dto.saleprice}" pattern="#,###"/>원
       				 </c:when>
       			 <c:otherwise>
          			 판매가 <fmt:formatNumber value="${dto.price}" pattern="#,###"/>원
        		</c:otherwise>
  				  </c:choose>
				</td>
            </tr>
            <c:choose>
<c:when test="${dto.cg_code == 'fcg001'}">
    <tr>
        <td colspan="5">
            <div class="option-title" style="display: inline-block; margin-right: 10px;">글러브 옵션</div>
            <c:if test="${dto.scg_code == 'mitt006'}">
                <p>선택할 수 있는 옵션이 없습니다.</p>
                <input type="hidden" name="op1" value="옵션없음">
            </c:if>
            <c:if test="${dto.scg_code != 'mitt006'}">
                <select name="op1" id="op1_select" style="display: inline-block;" >
                    <option value="">[필수] 옵션을 선택해 주세요</option>
                    <option value="우투(왼손착용)">우투(왼손착용)</option>
                    <option value="좌투(오른손착용)">좌투(오른손착용)</option>
                </select>
            </c:if>
        </td>
    </tr>
</c:when>

<c:when test="${dto.cg_code == 'fcg002'}">
    <tr>
        <td colspan="5">
            <div class="option-title" style="display: inline-block; margin-right: 10px;">배트 사이즈</div>
            <c:if test="${dto.scg_code == 'bat008' || dto.scg_code == 'bat009'}">
                <p>선택할 수 있는 옵션이 없습니다.</p>
                <input type="hidden" name="op1" value="옵션없음">
            </c:if>
            <c:if test="${dto.scg_code != 'bat008' && dto.scg_code != 'bat009'}">
                <select name="op1" id="op1_select" style="display: inline-block;" >
                    <option value="">[필수] 옵션을 선택해 주세요</option>
                    <option value="33인치/28온스">33인치/28온스</option>
                    <option value="32인치/27온스">32인치/27온스</option>
                </select>
            </c:if>
        </td>
    </tr>
</c:when>

<c:when test="${dto.cg_code == 'fcg003'}">
    <tr>
        <td colspan="5">
            <div class="option-title" style="display: inline-block; margin-right: 10px;">장갑 사이즈</div>
            <select name="op1" id="op1_select"  style="display: inline-block;">
                <option value="">[필수] 옵션을 선택해 주세요</option>
                <option value="S">S</option>
                <option value="M">M</option>
                <option value="L">L</option>
            </select>
        </td>
    </tr>
</c:when>

<c:when test="${dto.cg_code == 'fcg004'}">
    <tr>
        <td colspan="5">
            <div class="option-title" style="display: inline-block; margin-right: 10px;">신발 사이즈</div>
            <c:if test="${dto.scg_code == 'shoes006'}">
                <p>선택할 수 있는 옵션이 없습니다.</p>
                <input type="hidden" name="op1" id="op1" value="옵션없음">
            </c:if>
            <c:if test="${dto.scg_code != 'shoes006'}">
                <select name="op1" id="op1_select"  style="display: inline-block;">
                    <option value="">[필수] 옵션을 선택해 주세요</option>
                    <option value="250">250</option>
                    <option value="255">255</option>
                    <option value="260">260</option>
                    <option value="265">265</option>
                    <option value="270">270</option>
                    <option value="275">275</option>
                    <option value="280">280</option>
                    <option value="285">285</option>
                    <option value="290">290</option>
                    <option value="295">295</option>
                    <option value="300">300</option>
                </select>
            </c:if>
        </td>
    </tr>
</c:when>

<c:when test="${dto.cg_code == 'fcg006'}">
    <tr>
        <td colspan="5">
            <div class="option-title" style="display: inline-block; margin-right: 10px;">사이즈</div>
            <c:if test="${dto.scg_code == 'clothes010'}">
                <p>선택할 수 있는 옵션이 없습니다.</p>
                <input type="hidden" name="op1" id="op1" value="옵션없음">
            </c:if>
            <c:if test="${dto.scg_code != 'clothes010'}">
                <select name="op1" id="op1_select"  style="display: inline-block;">
                    <option value="">[필수] 옵션을 선택해 주세요</option>
                    <option value="S">S</option>
                    <option value="M">M</option>
                    <option value="L">L</option>
                    <option value="XL">XL</option>
                    <option value="2XL">2XL</option>
                </select>
            </c:if>
        </td>
    </tr>
</c:when>

<c:when test="${dto.cg_code == 'fcg007'}">
    <tr>
        <td colspan="5">
            <div class="option-title" style="display: inline-block; margin-right: 10px;">사이즈</div>
            <c:if test="${dto.scg_code == 'protect001' || dto.scg_code == 'protect005'}">
                <p>선택할 수 있는 옵션이 없습니다.</p>
                <input type="hidden" name="op1" id="op1" value="옵션없음">
            </c:if>
            <c:if test="${dto.scg_code != 'protect001' && dto.scg_code != 'protect005'}">
                <select name="op1" id="op1_select"  style="display: inline-block;">
                    <option value="">[필수] 옵션을 선택해 주세요</option>
                    <option value="S">S</option>
                    <option value="M">M</option>
                    <option value="L">L</option>
                </select>
            </c:if>
        </td>
    </tr>
</c:when>

<c:when test="${dto.cg_code == 'fcg010'}">
    <tr>
        <td colspan="5">
            <div class="option-title" style="display: inline-block; margin-right: 10px;">사이즈</div>
            <c:if test="${dto.scg_code == 'goods004'}">
                <select name="op1" id="op1_select"  style="display: inline-block;">
                    <option value="">[필수] 옵션을 선택해 주세요</option>
                    <option value="250">250</option>
                    <option value="255">255</option>
                    <option value="260">260</option>
                    <option value="265">265</option>
                    <option value="270">270</option>
                    <option value="275">275</option>
                    <option value="280">280</option>
                    <option value="285">285</option>
                    <option value="290">290</option>
                    <option value="295">295</option>
                    <option value="300">300</option>
                </select>
            </c:if>
            <c:if test="${dto.scg_code != 'goods004'}">
                <p>선택할 수 있는 옵션이 없습니다.</p>
                <input type="hidden" name="op1" id="op1" value="옵션없음">
            </c:if>
        </td>
    </tr>
</c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="5">선택할 수 있는 옵션이 없습니다.</td>
                        <input type="hidden" name="op1" value="옵션없음">
                    </tr>
                </c:otherwise>
            </c:choose>

            <tr>
                <td colspan="5">
                    <label for="count" style="font-size: 16;">수량:</label>
                    <input type="number" id="count" name="count" min="1" value="1" onchange="updateTotal()" oninput="updateTotal()" class="count-input">
                </td>
            </tr>
           <tr>
    <td colspan="5" id="tot">
        <c:choose>
            <c:when test="${dto.sale == 0}">
                합계: <fmt:formatNumber value="${dto.price}" pattern="#,###"/>원
            </c:when>
            <c:otherwise>
                합계: <fmt:formatNumber value="${dto.saleprice}" pattern="#,###"/>원
            </c:otherwise>
        </c:choose>
    </td>
</tr>
            <tr>
                <td colspan="5">
                    <button type="button" class="button" onclick="buyNow()">바로구매</button>
                    <button type="button" class="button1" onclick="addToCart()">장바구니</button>
                    <button type="button" class="button2" onclick="location.href='like_save?itemnum=${dto.itemnum}'">찜하기</button>
                </td>
            </tr>
            
            <tr>
                <td colspan="5">
                   <div class="detail">
                   PRODUCT DETAIL / 상품 상세정보
                   </div>
                </td>
            </tr>
            
            <tr>
                <td colspan="5" align="center">
                    <img src="./image/${dto.dimage}" class="d-image" alt="상세 이미지">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
