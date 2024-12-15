<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" >
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Batang&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Song+Myung&display=swap" rel="stylesheet">
<script>
	function showLoginAlert() {
		alert("로그인 후 이용해주세요!");
	}
</script>
<link href="./css/main.css" rel="stylesheet"/> 
  
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="main-container"><br>
	<div id="myCarousel" class="carousel slide" data-ride="carousel">

	<!-- Wrapper for slides -->
	<div class="carousel-inner" role="listbox">
		<div class="item active">
			<a href="main">
				<img src="./image/메인1.JPG" alt="SWINGS">
			</a>
        	<div class="carousel-caption"></div>
		</div>
		<div class="item">
			<a href="trainingbat">
        		<img src="./image/메인2.JPG" alt="나무배트">
			</a>
			<div class="carousel-caption"></div>
		</div>
		<div class="item">
			<a href="pitcherallround">
        		<img src="./image/메인3.JPG" alt="글러브-투수">
			</a>
			<div class="carousel-caption"></div>
		</div>
		<div class="item">
			<a href="hard-balls">
        		<img src="./image/메인4.JPG" alt="야구공">
			</a>
			<div class="carousel-caption"></div>
		</div>
		<div class="item">
			<a href="pitcherallround">
        		<img src="./image/글러브-투수.jpg" alt="글러브-투수">
			</a>
			<div class="carousel-caption"></div>
		</div>

		<div class="item">
			<a href="outfielder">
        		<img src="./image/글러브-야수.jpg" alt="글러브-야수">
			</a>
			<div class="carousel-caption"></div>
		</div>

		<div class="item">
			<a href="eventdetail?evnum=4">
				<img src="./image/5만원무료배송.jpg" alt="무료배송">
			</a>
			<div class="carousel-caption"></div>
		</div>
      
		<div class="item">
			<a href="eventdetail?evnum=2">
				<img src="./image/자수이벤트-메인.jpg" alt="자수이벤트">
			</a>
			<div class="carousel-caption"></div>
		</div>

		<div class="item">
			<a href="eventdetail?evnum=5">
				<img src="./image/할인1.jpg" alt="할인">
			</a>
			<div class="carousel-caption"></div>
		</div>
      
		<div class="item">
			<a href="eventdetail?evnum=3">
				<img src="./image/자사몰 오픈 감사 이벤트.jpg" alt="오픈이벤트">
			</a>
			<div class="carousel-caption"></div>
		</div>
	</div>
	
	<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
			<li data-target="#myCarousel" data-slide-to="3"></li>
			<li data-target="#myCarousel" data-slide-to="4"></li>
			<li data-target="#myCarousel" data-slide-to="5"></li>
			<li data-target="#myCarousel" data-slide-to="6"></li>
			<li data-target="#myCarousel" data-slide-to="7"></li>
			<li data-target="#myCarousel" data-slide-to="8"></li>
			<li data-target="#myCarousel" data-slide-to="9"></li>
			<li data-target="#myCarousel" data-slide-to="10"></li>
		</ol>

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

<div class="product-container-total">
	<div class="product-container-title-best">
		BEST
	<br>
	<p>가장 인기 많은 상품</p>
	</div>
		<div class="product-container">
			<c:forEach items="${list}" var="aa" varStatus="status" end="3">
			<div class="product">
				<a href="productdetail?itemnum=${aa.itemnum}">
					<img src="./image/${aa.image1}" alt="Product Image">
				</a>
				<div class="product-title">
					<a href="productdetail?itemnum=${aa.itemnum}" style="text-decoration: none; color: black;">${aa.product}</a>
				</div>
		<div style="display: flex; justify-content: space-between; align-items: center;">
				<c:choose>
    <c:when test="${aa.sale > 0}">
        <div class="product-price">
            [${aa.sale}%] <span style="text-decoration: line-through; font-size: 13px; color: #aaaaaa;"> 
            <fmt:formatNumber value="${aa.price}" type="number" groupingUsed="true"/></span> 
            <fmt:formatNumber value="${aa.saleprice}" type="number" groupingUsed="true"/>원
        </div>
    </c:when>
    <c:otherwise>
        <div class="product-price"><fmt:formatNumber value="${aa.price}" type="number" groupingUsed="true"/>원</div>
    </c:otherwise>
</c:choose>

	
				<c:choose>
					<c:when test="${loginstate==true}">
						<div><a href="like_save?itemnum=${aa.itemnum}">👍 따봉</a></div>
					</c:when>
		
					<c:otherwise>
						<div><a href="login?redirect" onclick="showLoginAlert()">👍 따봉</a></div>
					</c:otherwise>
				</c:choose>
    		</div>
       </div>
		</c:forEach>
	</div>
	<div class="product-container-more"><a href="bestitem"><br>더보기</a></div>
</div>

<div class="product-container-total">
	<div class="product-container-title">
		NEW
		<br>
		<p>새로운 상품</p>
	</div>
	<div class="product-container">
		<c:forEach items="${list1}" var="aa1" varStatus="status" end="3">
    	<div class="product">
        	<a href="productdetail?itemnum=${aa1.itemnum}">
            	<img src="./image/${aa1.image1}" alt="Product Image">
        	</a>
	        <div class="product-title">
	             <a href="productdetail?itemnum=${aa1.itemnum}" style="text-decoration: none; color: black;">${aa1.product}</a>
	        </div>
	   <div style="display: flex; justify-content: space-between; align-items: center;">
			<c:choose>
    <c:when test="${aa1.sale > 0}">
        <div class="product-price">
            [${aa1.sale}%] <span style="text-decoration: line-through; font-size: 13px; color: #aaaaaa;"> 
            <fmt:formatNumber value="${aa1.price}" type="number" groupingUsed="true"/></span> 
            <fmt:formatNumber value="${aa1.saleprice}" type="number" groupingUsed="true"/>원
        </div>
    </c:when>
    <c:otherwise>
        <div class="product-price"><fmt:formatNumber value="${aa1.price}" type="number" groupingUsed="true"/>원</div>
    </c:otherwise>
</c:choose>

			
			<c:choose>
				<c:when test="${loginstate==true}">
					<div><a href="like_save?itemnum=${aa1.itemnum}">👍 따봉</a></div>
				</c:when>
				<c:otherwise>
					<div><a href="login?redirect" onclick="showLoginAlert()">👍 따봉</a></div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>	
		</c:forEach>
	</div>
	<div class="product-container-more"><a href="newitem"><br>더보기</a></div>
</div>

<div class="product-container-total">
	<div class="product-container-title">
		SALE
		<br>
		<p>할인중인 상품</p>
	</div>
	<div class="product-container">
		<c:forEach items="${list2}" var="aa2" varStatus="status" end="3">
		<div class="product">
	        <a href="productdetail?itemnum=${aa2.itemnum}">
	            <img src="./image/${aa2.image1}" alt="Product Image">
	        </a>
        	<div class="product-title">
          	   <a href="productdetail?itemnum=${aa2.itemnum}" style="text-decoration: none; color: black;">${aa2.product}</a>
			</div>
 
 <div style="display: flex; justify-content: space-between; align-items: center;">
			<c:choose>
    <c:when test="${aa2.sale > 0}">
        <div class="product-price">
            [${aa2.sale}%] <span style="text-decoration: line-through; font-size: 13px; color: #aaaaaa;"> 
            <fmt:formatNumber value="${aa2.price}" type="number" groupingUsed="true"/></span> 
            <fmt:formatNumber value="${aa2.saleprice}" type="number" groupingUsed="true"/>원
        </div>
    </c:when>
    <c:otherwise>
        <div class="product-price"><fmt:formatNumber value="${aa2.price}" type="number" groupingUsed="true"/>원</div>
    </c:otherwise>
</c:choose>


			<c:choose>
				<c:when test="${loginstate==true}">
					<div><a href="like_save?itemnum=${aa2.itemnum}">👍 따봉</a></div>
				</c:when>
				
				<c:otherwise>
					<div><a href="login?redirect" onclick="showLoginAlert()">👍 따봉</a></div>
				</c:otherwise>
			</c:choose>	    
	    </div>
	  </div>  
		</c:forEach>
	</div>
	
	<div class="product-container-more"><a href="saleitem"><br>더보기</a></div>
</div>

</body>
</html>