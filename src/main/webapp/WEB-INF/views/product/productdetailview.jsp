<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>상품 상세 페이지</title>
 <style>
    body {
        font-family: 'Roboto', sans-serif; /* Roboto 폰트 적용 */
        background-color: #f4f4f4;
        margin: 0;
        padding: 20px;
    }
    table {
        width: 70%;
        margin: auto;
        border-collapse: collapse;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }
    th, td {
        padding: 15px;
        text-align: center;
        border-bottom: 1px solid #ddd;
        font-family: 'Roboto', sans-serif; /* Roboto 폰트 적용 */
    }
    th {
        background-color: #007BFF;
        color: white;
    }
  .main-image {
        width: 600px; /* 크기를 키움 (예: 500px) */
        border-radius: 10px;
        display: block; /* 이미지 중앙 정렬을 위해 추가 */
        margin: 0 auto; /* 중앙 정렬 */
    }
    .product-title {
        font-size: 24px;
        font-weight: bold;
        color: #333;
    }
    .price {
        font-size: 20px;
        color: #FF5722;
    }
    .option-title {
        font-size: 18px;
        font-weight: bold;
        margin: 10px 0;
    }
    .count-input {
        width: 50px;
        margin-left: 10px;
    }
  .button {
        background-color: black; /* 검은색 */
        color: white;
        border: none;
        padding: 12px 20px; /* 사이즈를 키움 */
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
        margin: 5px;
        font-family: 'Roboto', sans-serif; /* Roboto 폰트 적용 */
        font-size: 16px; /* 글자 크기 조정 */
    }

    .button:hover {
        background-color: #333; /* 호버 시 약간 밝아짐 */
    }

    .button1 {
        background-color: white; /* 흰색 */
        color: black; /* 글자 색상 */
        border: 1px solid #ccc; /* 테두리 추가 */
        padding: 12px 20px; /* 사이즈를 키움 */
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
        margin: 5px;
        font-family: 'Roboto', sans-serif; /* Roboto 폰트 적용 */
        font-size: 16px; /* 글자 크기 조정 */
    }

    .button1:hover {
        background-color: #f0f0f0; /* 호버 시 약간 밝아짐 */
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
            document.getElementById("op1").value = op1Select ? op1Select.value : "옵션없음";
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
            document.getElementById("op1").value = op1Select ? op1Select.value : "";
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
        <input type="hidden" name="op1" id="op1" value="${param.op1}">
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
        <c:when test="${dto.sale == 0}">
            판매가 <fmt:formatNumber value="${dto.price}" pattern="#,###"/>원
        </c:when>
        <c:otherwise>
            판매가 [${dto.sale}% 세일중] <fmt:formatNumber value="${dto.price}" pattern="#,###"/>원 → <fmt:formatNumber value="${dto.saleprice}" pattern="#,###"/>원
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
                <select name="op1" id="op1_select" style="display: inline-block;">
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
                <select name="op1" id="op1_select" style="display: inline-block;">
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
            <select name="op1" id="op1_select" onchange="this.options[this.selectedIndex].value = this.value;" style="display: inline-block;">
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
                <select name="op1" id="op1_select" onchange="this.options[this.selectedIndex].value = this.value;" style="display: inline-block;">
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
                <select name="op1" id="op1_select" onchange="this.options[this.selectedIndex].value = this.value;" style="display: inline-block;">
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
                <select name="op1" id="op1_select" onchange="this.options[this.selectedIndex].value = this.value;" style="display: inline-block;">
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
                <select name="op1" id="op1_select" onchange="this.options[this.selectedIndex].value = this.value;" style="display: inline-block;">
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
                    <label for="count">수량:</label>
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
                </td>
            </tr>
            <tr>
                <td colspan="5" align="center">
                    <img src="./image/${dto.dimage}" class="main-image" alt="상세 이미지">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
