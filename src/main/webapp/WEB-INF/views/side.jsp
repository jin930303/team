<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/side.css" rel="stylesheet"/> 
</head>
<body>
	<div id="floating-menu">
		<ul>
			<li>
				<img src="./image/야구공.jfif" height="180px">
			</li>			
		</ul>
		<ul>
			<li><a href="cart">CART</a></li>
			<li><a href="https://open.kakao.com/o/suixDsUg">KAKAO</a></li>
			<li><a href="like_product">LIKE</a></li>
			<li><a href="myinfo">MYPAGE</a></li>
			<li class="scroll-button"
				onclick="window.scrollTo({top: 0, behavior: 'smooth'});">▲</li>
			<li class="scroll-button"
				onclick="window.scrollTo({top: document.body.scrollHeight, behavior: 'smooth'});">▼</li>
		</ul>
	</div>
</body>
</html>