<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* 우측 사이드바 */
#floating-menu {
    position: fixed;
    right: 70px;
    top: 305px;
    z-index: 600;
    border: 1px thin #ddd; /* 테두리 색 */
    border-radius: 10px;
}

/* 우측 사이드바 버튼 리스트 스타일 */
#floating-menu ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

/* 버튼 스타일 */
#floating-menu ul li a,
.scroll-button li {
    text-decoration: none;
    color: #333; /* 텍스트 색상 */
    display: block;
    padding: 15px 20px;
    border-bottom: 1px solid #ddd;
    font-weight: bold;
    text-align: center;
    background-color: #ffffff; /* 버튼 배경색 */
    transition: background-color 0.3s ease, color 0.3s, box-shadow 0.3s;
}

/* 호버 시 스타일 */
#floating-menu ul li a:hover,
.scroll-button li:hover {
    color: #be241c;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.3); /* 호버 시 그림자 */
}

/* 스크롤 버튼 스타일 */
.scroll-button {
    text-decoration: none;
    color: #333;
    padding: 15px 20px;
    display: block;
    text-align: center;
    background-color: #ffffff;
    transition: color 0.3s ease, box-shadow 0.3s;
}

.scroll-button:hover {
    color: #be241c;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.3);
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
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