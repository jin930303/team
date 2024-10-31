<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Batang&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Song+Myung&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>장바구니</title>
<style type="text/css">
/* 목차+게시판 컨테이너 */
.flex_container {
	width: 100%;
	display: flex;
	justify-content: center;
	margin: 0 auto;
}

.sidebar {
	width: 250px;
	border: 1px solid #ddd;
	border-top: none; /* 타이틀과 경계선 중복 방지 */
	padding: 20px;
    margin-right: 20px;
    border-bottom-right-radius: 10px;
    border-bottom-left-radius: 10px;
	
}
.sidebar_container {
	width: 250px;
    display: block; /* 상하로 정렬 */
    margin-right: 60px; /* 오른쪽에 여백 */
}

/* 상단 타이틀 부분 */
.sidebar_title {
    background-color: #be241c; /* 상단 배경색 */
    padding: 60px;
    text-align: center;
    border: 2px thin #303030;
    border-top-right-radius: 10px;
    border-top-left-radius: 10px;
}

/* 타이틀 내부 h2 스타일링 */
.sidebar_title h2 {
    margin: 0;
    color: white;
    font-weight: bold;
    font-size: 22px;
}

/* 목차 링크의 리스트 스타일 없애면 리스트별 . 생김 */
.sidebar ul {
	list-style: none;
	padding: 0;
	margin-bottom: 30px;
}

/* 목차 리스트 사이 간격 */
.sidebar ul li {
	margin-bottom: 15px;
	
}

/* 목차 리스트 별 버튼 모양 */
.sidebar ul li a {
	text-decoration: none;
	color: #333;
	font-size: 14px;
	display: block;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	transition: border 0.3s ease; /* 테두리 변경 시 부드러운 전환 */
	transition: font 0.3s ease;
	transition: background-color 0.3s ease;
}

.sidebar ul li a:hover {
	background-color: #f9f4f4;
	font-weight: bold;
	color: black;
}
</style>

<style>

/* 메인 컨테이너 */
.main-container {
    flex: 1;
    max-width: 1100px;
    padding: 20px 60px;
    border-right: 1px solid #ddd;
    border-left: 1px solid #ddd;
}

.title h1 {
    font-family: "Noto Sans KR", sans-serif;
    text-align: left; /* 제목을 중앙 정렬 */
    padding: 30px;
    margin-bottom: 30px; /* 아래 여백 설정 */
	border-bottom: 2px solid #be241c;
}

table {
    width: 1000px; /* 테이블 너비 설정 */
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
    text-align: center; /* 텍스트 중앙 정렬 */
    margin: 0 auto 20px; /* 중앙에 위치하도록 설정 */ 
}

th, td {
    font-family: "Noto Sans KR", sans-serif;
    padding: 16px; /* 셀의 패딩 설정 */
    text-align: left; /* 텍스트 왼쪽 정렬 */
    border-bottom: 1px solid #ddd; /* 하단 테두리 설정 */
    font-size: 15px;
}

th {
    background-color: #be241c; /* 헤더 배경색을 어두운 회색으로 설정 */
    color: white; /* 헤더 글자색을 흰색으로 설정 */
}

tr:hover {
    background-color: #f1f1f1; /* 마우스를 올렸을 때 행 배경색 변경 */
}

img {
    border-radius: 5px; /* 이미지에 둥근 모서리 적용 */
}

/* 버튼 스타일 */
.action-button {
    background-color: #be241c; /* 버튼 배경색 */
    color: white; /* 버튼 글자색을 흰색으로 설정 */
    border: none; /* 테두리 제거 */
    padding: 10px 15px; /* 버튼 내부 여백 설정 */
    text-align: center; /* 텍스트 중앙 정렬 */
    cursor: pointer; /* 커서를 포인터로 변경 */
    border-radius: 5px; /* 버튼에 둥근 모서리 적용 */
    transition: background-color 0.3s; /* 배경색 변화에 애니메이션 추가 */
    margin-top: 30px; /* 상단 여백 설정 */
}

.action-button:hover {
    background-color: #8e1a14; /* 마우스를 올렸을 때 버튼 배경색 변경 */
}
</style>

<script type="text/javascript">
  function validateSelection(action) {
    var checkboxes = document.getElementsByName('selectedItems');
    var selected = false;

    for (var i = 0; i < checkboxes.length; i++) {
      if (checkboxes[i].checked) {
        selected = true;
        break;
      }
    }

    if (!selected) {
      alert("상품을 선택하세요.");
      return false;  
    }
    
    if(action === 'delete'){
      var selectedItems = [];
      for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) {
          selectedItems.push(checkboxes[i].value);
        }
      }

      if(selectedItems.length > 0){
        $.ajax({
          type: 'post',
          url: 'deleteitems',
          contentType: 'application/json',
          data: JSON.stringify({ items: selectedItems }),  
          async: true,  
          success: function(response) {
            alert("선택한 상품이 삭제되었습니다.");
            location.reload();  
          },
          error: function(xhr, status, error) {
            alert("상품 삭제에 실패했습니다.");
          }
        });
      }
      return false;  
    }
    
    var form = document.getElementById("cartForm");
    form.action = action === 'buy' ? 'buy' : 'delete';
    return true;
  }
</script>
</head>
<body>
<div class="flex_container">

	<div class="sidebar_container">
		<div class="sidebar_title"><h2>장바구니</h2></div>
		<aside class="sidebar">
			<ul>
				<li><a href="cart">장바구니</a></li>
				<li><a href="like_product">관심상품</a></li>
				<li><a href="update?id=${sessionScope.dto3.id}">회원정보 수정</a></li>
				<li><a href="delete?id=${sessionScope.dto3.id}&pw=${sessionScope.dto3.pw}">회원탈퇴</a></li>
			</ul>
		</aside>
	</div>
	
	<main class="main-container">
		<div class="title">
			<h1>" ${sessionScope.dto3.nickname} " 님의 장바구니</h1>
		</div>

		<form id="cartForm" method="post" action="#">
			<input type="hidden" id="loginState" value="${loginstate}"> 
			<c:choose>
				<c:when test="${empty items}">
					<p>장바구니에 상품이 없습니다.</p>
				</c:when>
				<c:otherwise>
					<table>
                		<thead>
                    		<tr>
		                        <th>상품명</th>
		                        <th>상품이미지</th>
		                        <th>옵션</th>
		                        <th>수량</th>
		                        <th>가격</th>
		                        <th>총 가격</th>
		                        <th>선택</th> 
                    		</tr>
                		</thead>
						<tbody>
							<c:forEach var="item" items="${items}">
		                        <tr>
		                            <td>${item.product}</td>
		                            <td><img src="./image/${item.image1}" alt="${item.image1}" width="100"></td>
		                            <td>${item.op1}</td>
		                            <td>${item.count}</td>
		                            <td><fmt:formatNumber value="${item.price}" type="number" pattern="#,##0"/> 원</td>
		                            <td><fmt:formatNumber value="${item.price * item.count}" type="number" pattern="#,##0"/> 원</td>
		                            <td><input type="checkbox" name="selectedItems" value="${item.itemnum}"></td> 
		                        </tr>
                    		</c:forEach>
		                </tbody>
		            </table>
					<div class="submitbutton">
			            <button type="submit" class="action-button" onclick="return validateSelection('buy');">선택한 상품 구매</button>
			            <button type="submit" class="action-button" onclick="return validateSelection('delete');">선택한 상품 삭제</button>
					</div>
				</c:otherwise>
			</c:choose>
		</form>
	</main>
</div>
</body>
</html>
