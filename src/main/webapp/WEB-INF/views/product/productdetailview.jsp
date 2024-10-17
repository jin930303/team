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
        
        function addToCart() {
        	const loginState = document.getElementById("loginState").value;

        	 if (loginState === null || loginState === "false") {  // 로그인 상태가 false인 경우
        	        alert("로그인 후 이용해주세요.");
        	        window.location.href = "login"; // 로그인 페이지로 리다이렉트
        	        return;
        	    }
        	
        	// 옵션 선택 확인
            const op1Select = document.getElementById("op1_select");
            if (op1Select && op1Select.value === "") {
                alert("옵션을 선택해주세요.");
                return;
            }
            
            console.log("Selected option: " + op1Select.value);  // 로그 추가
         // 선택한 옵션 값을 히든 필드에 설정
            document.getElementById("op1").value = op1Select ? op1Select.value : "";
         
            document.getElementById("productForm").submit();  // 폼 제출
            alert("장바구니에 상품이 추가되었습니다.");
            window.location.reload();
        }
        
        function buyNow() {
            const loginState = document.getElementById("loginState").value;

            if (loginState === null || loginState === "false") {  // 로그인 상태가 false인 경우
                alert("로그인 후 이용해주세요.");
                window.location.href = "login"; // 로그인 페이지로 리다이렉트
                return;
            }

         // 옵션 선택 확인 (옵션 선택이 없는 경우)
            const op1Select = document.getElementById("op1_select");
            if (op1Select && op1Select.value === "") {
                alert("옵션을 선택해주세요.");
                return;
            }

            // 폼의 히든 필드에 선택된 옵션 값을 넣습니다.
            document.getElementById("op1").value = op1Select ? op1Select.value : "";
            
            // 상품 폼의 액션을 "buySelectedItems"로 설정하여 바로 구매를 처리하도록 합니다.
            document.getElementById("productForm").action = "/team/buydirectitem";
            document.getElementById("productForm").submit();  // 폼 제출
        }
        
    </script>  
</head>
<body>
 <% 
    Boolean loginState = (Boolean) session.getAttribute("loginstate");
    System.out.println("Login state in productdetailview.jsp: " + loginState);  // 로그로 상태 확인
  %>
    <form id="productForm" action="/team/insertcart" method="post" enctype="multipart/form-data">
        <input type="hidden" name="itemnum" id="itemnum" value="${dto.itemnum}">
        <input type="hidden" name="price" id="price" value="${dto.price}">
        <input type="hidden" name="product" id="product" value="${dto.product}">
        <input type="hidden" name="op1" id="op1" value="${param.op1}">
        <input type="hidden" name="image1" id="image1" value="${dto.image1}">
         <!-- 로그인 상태 히든 필드 -->
       <input type="hidden" id="loginState" value="${sessionScope.loginstate}">
       <input type="hidden" name="id"id="id" value="${sessionScope.dto3.id}">
       
        
        
       
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
            
            
            <c:choose>                           
               <c:when test="${dto.cg_code == 'fcg001'}">
			    	<tr id="mittOptions" style="display:block;">
			        	<td colspan="6">
			            	<div class="option-title">글러브 옵션</div>
			            	<c:if test="${dto.scg_code == 'mitt006'}">
			                <p>선택할 수 있는 옵션이 없습니다.</p>
			            </c:if>
				            <c:if test="${dto.scg_code != 'mitt006'}">
				                <select name="op1" id="op1_select" onchange="this.options[this.selectedIndex].value = this.value;">
				                    <option value="">[필수] 옵션을 선택해 주세요</option>
				                    <option value="우투(왼손착용)">우투(왼손착용)</option>
				                    <option value="좌투(오른손착용)">좌투(오른손착용)</option>
				                </select>
				            </c:if>
				        </td>
				    </tr>
				</c:when>
         
               <c:when test="${dto.cg_code == 'fcg002'}">
				    <tr id="batOptions" style="display:block;">
				        <td colspan="6">
				            <div class="option-title">배트 사이즈</div>
				            <c:if test="${dto.scg_code == 'bat008' || dto.scg_code == 'bat009'}">
				                <p>선택할 수 있는 옵션이 없습니다.</p>
				            </c:if>
				            <c:if test="${dto.scg_code != 'bat008' && dto.scg_code != 'bat009'}">
				                <select name="op1" id="op1_select"  onchange="this.options[this.selectedIndex].value = this.value;">
				                   <option value="">[필수] 옵션을 선택해 주세요</option>
				                    <option value="33인치/28온스">33인치/28온스</option>
				                    <option value="32인치/27온스">32인치/27온스</option>
				                </select>
				            </c:if>
				        </td>
				    </tr>
				</c:when>
                
                <c:when test="${dto.cg_code == 'fcg003'}">
                    <tr id="gloveOptions" style="display:block;">
                        <td colspan="6">
                            <div class="option-title">장갑 사이즈</div>
                            <select name="op1" id="op1_select"  onchange="this.options[this.selectedIndex].value = this.value;">
                                <option value="">[필수] 옵션을 선택해 주세요</option>
                                <option value="S">S</option>
                                <option value="M">M</option>
                                <option value="L">L</option>
                            </select>
                        </td>
                    </tr>
                </c:when>
                
                <c:when test="${dto.cg_code == 'fcg004'}">
				    <tr id="shoesOptions" style="display:block;">
				        <td colspan="6">
				            <div class="option-title">신발 사이즈</div>
				            <c:if test="${dto.scg_code == 'shoes006'}">
				                <p>선택할 수 있는 옵션이 없습니다.</p>
				            </c:if>
				            <c:if test="${dto.scg_code != 'shoes006'}">
				                <select name="op1" id="op1_select"  onchange="this.options[this.selectedIndex].value = this.value;">
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
				    <tr id="clothesOptions" style="display:block;">
				        <td colspan="6">
				            <div class="option-title">사이즈</div>
				            <c:if test="${dto.scg_code == 'clothes010'}">
				                <p>선택할 수 있는 옵션이 없습니다.</p>
				            </c:if>
				            <c:if test="${dto.scg_code != 'clothes010'}">
				                <select name="op1" id="op1_select"  onchange="this.options[this.selectedIndex].value = this.value;">
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
				    <tr id="gloveOptions" style="display:block;">
				        <td colspan="6">
				            <div class="option-title">사이즈</div>
				            <c:if test="${dto.scg_code == 'protect001' || dto.scg_code == 'protect005'}">
				                <p>선택할 수 있는 옵션이 없습니다.</p>
				            </c:if>
				            <c:if test="${dto.scg_code != 'protect001' && dto.scg_code != 'protect005'}">
				                <select name="op1" id="op1_select"  onchange="this.options[this.selectedIndex].value = this.value;">
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
				    <tr id="gloveOptions" style="display:block;">
				        <td colspan="6">
				            <div class="option-title">사이즈</div>
				            <c:if test="${dto.scg_code == 'goods004'}">
				                <select name="op1" id="op1_select"  onchange="this.options[this.selectedIndex].value = this.value;">
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
				            </c:if>
				        </td>
				    </tr>
				</c:when>
				                               
                <c:otherwise>
                    <tr>
                        <td colspan="6">선택할 수 있는 옵션이 없습니다.</td>
                    </tr>
                </c:otherwise>                
            </c:choose>
           
            <tr>
                <td colspan="6">  
                    <label for="count">수량:</label>
                    <input type="number" id="count" name="count" min="1" value="1" onchange="updateTotal()" oninput="updateTotal()">
                </td>
            </tr>
            
            
            <tr>
                <td colspan="6" id="tot">합계: ${dto.price}원</td>
            </tr>
            
            
            <tr>
                <td colspan="6">
                    <button type="button" onclick="addToCart()">장바구니</button>
                    <a href="javascript:void(0);" onclick="buyNow()">바로구매</a>
                </td>
            </tr>
           
           
            <tr>
                <td colspan="4" align="center">
                    <img src="./image/${dto.dimage}" class="responsive-image" alt="Detailed Image">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
