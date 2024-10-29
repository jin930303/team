<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script>
    window.addEventListener('scroll', function() {
        var floatingMenu = document.getElementById('floating-menu');  // 사이드바 요소
        var carousel = document.getElementById('myCarousel');  // 캐러셀 요소
        var carouselBottom = carousel.getBoundingClientRect().bottom;  // 캐러셀의 하단 위치

        // 캐러셀의 끝부분이 화면 위로 올라가면 사이드바를 보이게 설정
        if (carouselBottom <= 0) {
            floatingMenu.style.position = 'fixed';
            floatingMenu.style.top = '250px';  // 고정된 위치 설정
            floatingMenu.style.visibility = 'visible';  // 사이드바 보이게 함
        } else {
            // 캐러셀이 화면에 있을 때는 사이드바를 보이지 않도록 설정
            floatingMenu.style.visibility = 'hidden';
        }
    });
</script>


<% 
    Boolean loginState = (Boolean) session.getAttribute("loginstate")||(Boolean) session.getAttribute("adminloginstate");
    System.out.println("Login state in main.jsp: " + loginState);
%>
  <style>
      /* 팝업창 스타일 */
       .popup-overlay {
           position: fixed;
           top: 0;
           left: 0;
           width: 100%;
           height: 100%;
           display: none;
       }
       .popup-content {
           position: absolute;
           top: 20px;
           left: 20px;
           background: white;
           padding: 20px;
           width: 300px;
           border-radius: 8px;
           text-align: center;
       }
       .close-btn {
           cursor: pointer;
           color: red;
       }
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
    width: 100%;
    margin: auto;
  }
  .main-container{
    display: flex !important;
    justify-content: center; /* 가로 중앙 정렬 */
    align-items: center;     /* 세로 중앙 정렬 (필요할 경우) */
    width: 100%;
    height: 100%;            /* 부모 요소에 맞추기 위해 높이 설정 */
    margin: 0 auto !important; /* 상하 여백을 없애고 가로 중앙에 배치 */

  }
  </style>
  
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main-container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
      <a href="outfielder">
        <img src="./image/메인이미지.jpg" alt="글러브야수" style="height:100%; width:auto;">
		</a>
        <div class="carousel-caption">
        </div>
      </div>
      
      <div class="item">
      <a href="pitcherallround">
        <img src="./image/메인이미지.jpg" alt="글러브투수" style="height:100%; width:auto;">
        </a>
        <div class="carousel-caption">
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<table style="width: 100%; height: 500px;">
    <caption><h3>Best</h3></caption>
    <tr>
        <c:forEach items="${list}" var="pro" varStatus="status" end="3">
            <td>
                <a href="productdetail?itemnum=${pro.itemnum}">
                <img src="./image/${pro.image1}" style="width: 300px; height: 300px;"></a>
                <div><a href="productdetail?itemnum=${pro.itemnum}">${pro.product}</a></div>
		<c:choose>
			<c:when test="${pro.sale>0}">
				<div>[${pro.sale}% 세일중] ${pro.price}원 → ${pro.saleprice}원</div>
			</c:when>
			<c:otherwise>
				<div>${pro.price}원</div>
			</c:otherwise>
		</c:choose>
            </td>
            <c:if test="${status.index % 4 == 3}"> <!-- 4개마다 새로운 행을 추가 -->
                </tr><tr>
            </c:if>
        </c:forEach>
    </tr>
    <tr>
        <td colspan="4" style="text-align: right;"> <!-- colspan 속성으로 열을 병합 -->
            <a href="bestitem" style="text-decoration: none;">더보기</a>
        </td>
    </tr>
</table>

<table style="width: 100%; height: 500px;">
    <caption><h3>New</h3></caption>
    <tr>
        <c:forEach items="${list1}" var="pro1" varStatus="status" end="3">
            <td>
                <a href="productdetail?itemnum=${pro1.itemnum}">
                <img src="./image/${pro1.image1}" style="width: 300px; height: 300px;"></a>
                <div><a href="productdetail?itemnum=${pro1.itemnum}">${pro1.product}</a></div>
		<c:choose>
			<c:when test="${pro1.sale>0}">
				<div>[${pro1.sale}% 세일중] ${pro1.price}원 → ${pro1.saleprice}원</div>
			</c:when>
			<c:otherwise>
				<div>${pro1.price}원</div>
			</c:otherwise>
		</c:choose>
            </td>
            <c:if test="${status.index % 4 == 3}"> <!-- 4개마다 새로운 행을 추가 -->
                </tr><tr>
            </c:if>
        </c:forEach>
    </tr>
    <tr>
        <td colspan="4" style="text-align: right;"> <!-- colspan 속성으로 열을 병합 -->
            <a href="newitem" style="text-decoration: none;">더보기</a>
        </td>
    </tr>
</table>

</body>
</html>