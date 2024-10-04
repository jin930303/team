<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
    width: 100%;
    margin: auto;
  }
  </style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">

      <div class="item active">
        <img src="./image/박병호.jpg" alt="박병호" style="height:500px; width:400px;">
        <div class="carousel-caption">
        </div>
      </div>

      <div class="item">
        <img src="./image/테임즈.jpg" alt="테임즈" style="height:500px; width:400px;">
        <div class="carousel-caption">
        </div>
      </div>
    
      <div class="item">
        <img src="./image/김도영.jpg" alt="김도영" style="height:500px; width:400px;">
        <div class="carousel-caption">
        </div>
      </div>

      <div class="item">
        <img src="./image/김하성.jpg" alt="김하성" style="height:500px; width:400px;">
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
                <div>${pro.product}</div>
                <div>${pro.price}원</div>
            </td>
            <c:if test="${status.index % 4 == 3}"> <!-- 4개마다 새로운 행을 추가 -->
                </tr><tr>
            </c:if>
        </c:forEach>
    </tr>
    <tr>
        <td colspan="4" style="text-align: right;"> <!-- colspan 속성으로 열을 병합 -->
            <a href="#" style="text-decoration: none;">더보기</a>
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
                <div>${pro1.product}</div>
                <div>${pro1.price}원</div>
            </td>
            <c:if test="${status.index % 4 == 3}"> <!-- 4개마다 새로운 행을 추가 -->
                </tr><tr>
            </c:if>
        </c:forEach>
    </tr>
    <tr>
        <td colspan="4" style="text-align: right;"> <!-- colspan 속성으로 열을 병합 -->
            <a href="#" style="text-decoration: none;">더보기</a>
        </td>
    </tr>
</table>

</body>
</html>