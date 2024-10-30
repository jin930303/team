<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 
<style type="text/css">

/* ======================여기서부터 사이드바(우측) */
/* 우측 사이드바 */
#floating-menu {
	position: fixed; /* 고정 */
	right: 100px; /* 우측 기준 30px 떨어짐 */
	top: 285px; /* 상단에서 250px 떨어짐 */
	z-index: 600;
	border: 1px solid #ddd;
	border-radius: 10px;
	padding: 10px; /* 버튼과 테두리 사이 간격 */
	
}

/* 우측 사이드바 버튼 리스트 스타일 */
#floating-menu ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

/* 우측 사이드바 버튼 사이 간격 */
#floating-menu ul li {
	margin-bottom: 10px;
}

/* 우측 사이드바 버튼 style */
#floating-menu ul li a {
	text-decoration: none;
	color: #333;
	padding: 10px 20px;
	display: block;
	border: 1px solid #ddd;
	border-radius: 5px;
	text-align: center;
	background-color: white; /* 배경색 변경 */
	transition: background-color 0.3s;
}

#floating-menu ul li a:hover {
	background-color: #c9302c;  /*메인에 호버랑 색 똑같게 맞출려고*/
}

/* 맨 위로 맨 아래로 */
.scroll-button {
	text-decoration: none;
	color: #333;
	padding: 10px 20px;
	display: block;
	border: 1px solid #ddd;
	border-radius: 5px;
	text-align: center;
	transition: background-color 0.3s;
	background-color: white; /* 배경색 변경 */
}

.scroll-button:hover {
	background-color: #c9302c;  /*메인에 호버랑 색 똑같게 맞출려고*/
}
</style>
 -->


<style type="text/css">
/* 우측 사이드바 */
#floating-menu {
    position: fixed;
    right: 70px;
    top: 305px;
    z-index: 600;
    background-color: #ffffff; /* 화이트 배경 */
    border: 2px solid #be241c; /* 테두리 색 */
    border-radius: 10px;
    padding: 15px; /* 버튼과 테두리 간격 */
    box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15); /* 그림자 추가 */
}

/* 우측 사이드바 버튼 리스트 스타일 */
#floating-menu ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

/* 버튼 간 간격 */
#floating-menu ul li {
    margin-bottom: 12px;
}

/* 버튼 스타일 */
#floating-menu ul li a {
    text-decoration: none;
    color: #be241c; /* 텍스트 색상 */
    padding: 10px 20px;
    display: block;
    border: 2px solid #be241c; /* 버튼 테두리 */
    border-radius: 5px;
    text-align: center;
    background-color: #ffffff; /* 버튼 배경색 */
    transition: background-color 0.3s, color 0.3s, box-shadow 0.3s;
}

/* 호버 시 스타일 */
#floating-menu ul li a:hover {
    background-color: #be241c;
    color: #ffffff; /* 호버 시 텍스트 색상 */
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 */
}

/* 스크롤 버튼 스타일 */
.scroll-button {
    text-decoration: none;
    color: #be241c;
    padding: 10px 20px;
    display: block;
    border: 2px solid #be241c;
    border-radius: 5px;
    text-align: center;
    background-color: #ffffff;
    transition: background-color 0.3s, color 0.3s, box-shadow 0.3s;
}

.scroll-button:hover {
    background-color: #be241c;
    color: #ffffff;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="floating-menu">
		<ul>
			<li><a href="cart">장바구니</a></li>
			<li><a href="https://open.kakao.com/o/suixDsUg">KAKAO문의</a></li>
			<li><a href="like_product">관심상품</a></li>
			<li><a href="myinfo">마이페이지</a></li>
			<li class="scroll-button"
				onclick="window.scrollTo({top: 0, behavior: 'smooth'});">△</li>
			<li class="scroll-button"
				onclick="window.scrollTo({top: document.body.scrollHeight, behavior: 'smooth'});">▽</li>
		</ul>
	</div>
</body>
</html>