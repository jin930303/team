<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<table border="1" width="900px" height="200px" align="center">
<caption>상품정보출력</caption>

<tr>
<th>상품번호</th><th>메인이미지</th><th>카테고리1</th><th>카테고리2</th>
<th>상품명</th><th>가격</th><th>상세이미지</th>

</tr>
<c:forEach items="${list}" var="aa">
<tr>
  <td>${aa.itemnum}</td>
  <td>
    <a href="productdetail?itemnum=${aa.itemnum}">
        <img src="./image/${aa.image1}" width="50" height="50" alt="Product Image">
    </a>
</td>
  <td>${aa.cat1}</td>
  <td>${aa.cat2}</td>
  <td>${aa.product}</td>
  <td>${aa.price}</td>
  <td><img src="./image/${aa.dimage}" width="50px" height="50px"></td>
</tr>
</c:forEach>
</table >
</body>
</html>