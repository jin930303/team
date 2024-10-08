<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
    pre {
        word-wrap: break-word;
        white-space: pre-wrap;
        background-color: transparent;
    }

body {
	font-family: Arial, sans-serif;
	background-color: #f0f0f0;
	margin: 0;
	padding: 20px;
	background-image: url('./resources/image/블루패브릭.jpg');
	background-size: cover; /* 이미지가 화면 전체를 덮도록 설정 */
	background-position: center; /* 이미지를 가운데에 배치 */
	background-repeat: no-repeat; /* 이미지를 반복하지 않음 */
	background-attachment: fixed; /* 배경이 고정된 상태로 스크롤 */
}

/* h3 {
 text-align: center;
 background-color: #fee1d1; 
 border-radius: 30px;
} */
p {
	text-align: right;
}

/* 기존 스타일 */
.navbar-inverse {
	font-family: Arial, sans-serif;
	font-size: 18px;
	background-color: rgba(255, 255, 255, 0.5) !important;
	border-color: rgba(255, 255, 255, 0.5) !important;
	border-bottom: 2px solid #94c3ef !important;
}

.navbar-inverse {
	font-family: Arial, sans-serif;
	font-size: 18px;
	background-color: rgba(255, 255, 255, 0.5) !important;
	/* 흰색, 투명도 50% */
	border-color: rgba(255, 255, 255, 0.5) !important;
	/* 테두리도 동일한 투명도 적용 */
	border-bottom: 2px solid #94c3ef !important; /* 바 하단 검은색 라인 */
}

/* 기본 링크 스타일 - hover 상태에서 색상 변화 없음 */
.navbar-inverse .navbar-nav>li>a {
	color: #000 !important; /* 기본 글씨 색상 검정 */
	background-color: transparent !important; /* 배경색 투명 */
}
/* 상단 메뉴바 (스크롤 내려오는거) */
/* hover 상태에서 색상 및 배경 변화 제거 */
.navbar-inverse .navbar-nav>li>a:hover {
	color: white !important; /* hover 상태에서도 색상 변화 없음 */
	background-color: #94c3ef !important; /* 배경색 변화 없음 */
}

/* Home 버튼 */
/* Active 상태에서만 스타일 적용 */
.navbar-inverse .navbar-nav>li.active>a {
	color: #white !important; /* active 상태에서 더 어두운 글씨색 */
	border-radius: 4px; /* 모서리 둥글게 */
}

/* 타이틀 영역 */
.navbar-inverse .container-fluid>a {
	font-family: Arial, sans-serif;
	font-size: 25px;
	font-weight: bold;
	letter-spacing: 2px;
	color: #666666;
	text-align: center;
}

.container-log {
	display: flex;
	font-size: 13px;
	justify-content: flex-start;
	color: #666666;
	align-items: center;
}

.container-head {
	display: flex;
	font-size: 60px;
	justify-content: center;
	align-items: center;
	color: black;
}

/* 두 컨테이너 사이의 공간을 확보하기 위해 추가 */
.container-fluid .row .container-head .container-log {
	display: flex;
	justify-content: space-between;
	align-items: center;
}
</style>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-inverse">

		<div class="container-log" style="text-align: left;">
			<ul class="nav navbar-nav navbar-left">
				<c:choose>
					<c:when test="${loginstate==true}">
						<li><a href="#"> 님 반갑습니다.</a></li>
						<li><a href="logout"> 로그아웃</a></li>
						<li><a href="myinfo"> 회원정보</a></li>
						<li><a href="#"> 장바구니</a></li>
						<li><a href="#"> 주문/배송조회</a></li>
						<li><a href="faq_community"> 고객센터</a></li>
					</c:when>

					<c:when test="${adminloginstate==true}">
						<li><a href="#"><span class="glyphicon glyphicon-user"></span>
								관리자님 반갑습니다.</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">상품등록<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="productin">상품자료입력</a></li>
								<li><a href="productout">상품자료출력</a></li>
							</ul></li>

						<li><a href="logout"><span class="glyphicon glyphicon-log-out"></span>
								로그아웃</a></li>
					</c:when>

					<c:otherwise>
						<li><a href="memberinput"> 회원가입</a></li>
						<li><a href="login"> 로그인</a></li>
						<li><a href="#"> 장바구니</a></li>
						<li><a href="#"> 주문/배송조회</a></li>
						<li><a href="faq_community"> 고객센터</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>


		<div class="container-head"
			style="text-align: center; font-size: 60px">
			<div class="navbar-header">
				<a class="navbar-brand" href="main"
					style="text-align: center; font-size: 40px">야구용품</a>
			</div>
		</div>


		<div class="container-fluid" style="text-align: center;">

			<ul class="nav navbar-nav" style="text-align: center;">

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Best<span class="caret"></span></a></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">New<span class="caret"></span></a></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Sale<span class="caret"></span></a></li>

				
				
				
			   <li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">글러브<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="pitcherallround">투수/올라운드</a></li>
						<li><a href="infielder">내야수</a></li>
						<li><a href="outfielder">외야수</a></li>
						<li><a href="catchersmitt">포수미트</a></li>
						<li><a href="youth">어린이/유소년용</a></li>
						<li><a href="glovecare">글러브 관리용품</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle" 
				 data-toggle="dropdown" href="">배트<span class="caret"></span></a>
				    <ul class="dropdown-menu">
				        <li><a href="arbat">알루미늄 배트</a></li>
				        <li><a href="carbonbat">카본/컴포짓</a></li>
				        <li><a href="woodbat">나무배트</a></li>
				        <li><a href="pungbat">펑고배트</a></li>
				        <li><a href="youngbat">유소년용 배트</a></li>
				        <li><a href="trainingbat">트레이닝 배트</a></li>						
				        <li><a href="batgrip">배트그립</a></li>
				        <li><a href="bataccessories">배트용품</a></li>
				    </ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="">장갑<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="batting-gloves">배팅장갑</a></li>
						<li><a href="fielding-gloves">수비장갑</a></li>
						<li><a href="base-running-gloves">주루장갑</a></li>
						<li><a href="thermal-gloves">방한장갑</a></li>
						<li><a href="youth-gloves">유소년용 장갑</a></li>
						<li><a href="other-gloves">기타 장갑</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="">야구화<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="integrated-spikes">징 일체형</a></li>
						<li><a href="turf-shoes">인조잔디화</a></li>
						<li><a href="youth-shoes">유소년용 야구화</a></li>
						<li><a href="running-training-shoes">런닝/트레이닝화</a></li>
						<li><a href="shoe-accessories">야구화부속품</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="">가방<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="backpacks">백팩</a></li>
						<li><a href="crossbody-bags">크로스백</a></li>						
						<li><a href="wheeled-bags">휠가방</a></li>
						<li><a href="bat-bags">배트가방</a></li>
						<li><a href="ball-bags">볼가방</a></li>
						<li><a href="other-bags">기타 가방</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="">의류<span class="caret"></span></a>
					<ul class="dropdown-menu">
					    <li><a href="national-team-authentic">국가대표 어센틱 유니폼</a></li>
						<li><a href="t-shirts">티셔츠</a></li>
						<li><a href="undershirts">언더셔츠</a></li>
						<li><a href="sliding-pants">슬라이딩팬츠</a></li>
						<li><a href="long-short-pants">롱/숏스판팬츠</a></li>
						<li><a href="icing-wear">아이싱웨어</a></li>
						<li><a href="windbreakers">바람막이</a></li>
						<li><a href="jackets">점퍼</a></li>
						<li><a href="training-wear">트레이닝복</a></li>
						<li><a href="hoodies">맨투맨/후디</a></li>
						<li><a href="hats-belts-socks">모자/벨트/양말</a></li>
						<li><a href="other-clothing">기타</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="">보호장비<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="batter-helmets">타자헬멧</a></li>
						<li><a href="arm-guards">암가드</a></li>
						<li><a href="foot-guards">풋가드</a></li>
						<li><a href="hand-guards">핸드가드</a></li>
						<li><a href="face-masks">안면마스크</a></li>
						<li><a href="other-protective-gear">기타 보호장비</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="">야구공<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="hard-balls">경식구</a></li>
						<li><a href="soft-balls">연식구</a></li>
						<li><a href="snap-balls">스냅볼</a></li>
						<li><a href="ball-storage">야구공 보관함</a></li>
					</ul></li>
	
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="">굿즈<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="keyring">키링</a></li>
						<li><a href="towel">타올</a></li>
						<li><a href="doll">인형</a></li>
						<li><a href="headbands-bracelets">슬리퍼</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="">기타용품<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="sunglasses">선글라스</a></li>
						<li><a href="accessories">악세사리</a></li>
						<li><a href="wristbands">손목밴드</a></li>
						<li><a href="rosin-bags">로진백</a></li>
						<li><a href="eye-patches">아이패치</a></li>
						<li><a href="figures">피규어</a></li>
						<li><a href="bases">베이스</a></li>
						<li><a href="other-products">기타용품</a></li>
					</ul></li>




				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">커뮤니티<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="gongjiboard">공지사항</a></li>
						<li><a href="board">자유게시판</a></li>
						<li><a href="sosickboard">야구소식</a></li>
						<li><a href="iljung">경기일정</a></li>
					</ul></li>

			</ul>
		</div>
	</nav>

</body>
</html>