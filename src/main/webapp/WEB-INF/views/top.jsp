<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
pre{
	white-space: pre-wrap; 
	word-wrap: break-word; 
	background-color: transparent !important;
	border: none;
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
						<li><a href="faq_comunity"> 고객센터</a></li>
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
						<li><a href="faq_comunity"> 고객센터</a></li>
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
						<li><a href="#">투수/올라운드</a></li>
						<li><a href="#">내야수</a></li>
						<li><a href="#">외야수</a></li>
						<li><a href="#">1루/포수미트</a></li>
						<li><a href="#">어린이/유소년용</a></li>
						<li><a href="#">글러브 관리용품</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">배트<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">알루미늄 배트</a></li>
						<li><a href="#">카본/컴포짓</a></li>
						<li><a href="#">나무배트</a></li>
						<li><a href="#">펑고배트</a></li>
						<li><a href="#">유소년용 배트</a></li>
						<li><a href="#">트레이닝 배트</a></li>
						<li><a href="#">소프트볼 배트</a></li>
						<li><a href="#">배트그립</a></li>
						<li><a href="#">배트용품</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">장갑<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">배팅장갑</a></li>
						<li><a href="#">수비장갑</a></li>
						<li><a href="#">주루장갑</a></li>
						<li><a href="#">방한장갑</a></li>
						<li><a href="#">유소년용 장갑</a></li>
						<li><a href="#">기타 장갑</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">야구화<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">징 일체형</a></li>
						<li><a href="#">징 교체형</a></li>
						<li><a href="#">인조잔디화</a></li>
						<li><a href="#">유소년용 야구화</a></li>
						<li><a href="#">런닝/트레이닝화</a></li>
						<li><a href="#">야구화부속품</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">가방<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">백팩</a></li>
						<li><a href="#">크로스백</a></li>
						<li><a href="#">팀장비 가방</a></li>
						<li><a href="#">휠가방</a></li>
						<li><a href="#">배트가방</a></li>
						<li><a href="#">볼가방</a></li>
						<li><a href="#">유소년용 가방</a></li>
						<li><a href="#">주머니</a></li>
						<li><a href="#">기타 가방</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">의류<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">티셔츠</a></li>
						<li><a href="#">언더셔츠</a></li>
						<li><a href="#">슬라이딩팬츠</a></li>
						<li><a href="#">롱/숏스판팬츠</a></li>
						<li><a href="#">아이싱웨어</a></li>
						<li><a href="#">바람막이</a></li>
						<li><a href="#">점퍼</a></li>
						<li><a href="#">트레이닝복</a></li>
						<li><a href="#">맨투맨/후디</a></li>
						<li><a href="#">모자/벨트/양말</a></li>
						<li><a href="#">기타</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">보호장비<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">타자헬멧</a></li>
						<li><a href="#">암가드</a></li>
						<li><a href="#">풋가드</a></li>
						<li><a href="#">핸드가드</a></li>
						<li><a href="#">안면마스크</a></li>
						<li><a href="#">기타 보호장비</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">야구공<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">경식구</a></li>
						<li><a href="#">연식구</a></li>
						<li><a href="#">캐치볼용</a></li>
						<li><a href="#">스냅볼</a></li>
						<li><a href="#">소프트볼</a></li>
						<li><a href="#">피칭머신볼</a></li>
						<li><a href="#">기념구</a></li>
						<li><a href="#">야구공 보관함</a></li>
						<li><a href="#">배팅장갑</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">유니폼<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">국가대표 어센틱 유니폼</a></li>
						<li><a href="#">KBO 어센틱 유니폼</a></li>
						<li><a href="#">MLB 어센틱 유니폼</a></li>
						<li><a href="#">NPB 어센틱 유니폼</a></li>
						<li><a href="#">기타 유니폼</a></li>
						<li><a href="#">키즈 유니폼</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">굿즈<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">인형</a></li>
						<li><a href="#">쿠션</a></li>
						<li><a href="#">키링</a></li>
						<li><a href="#">머리띠/팔찌</a></li>
						<li><a href="#">기타</a></li>
					</ul></li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">기타용품<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="#">선글라스</a></li>
						<li><a href="#">악세사리</a></li>
						<li><a href="#">손목밴드</a></li>
						<li><a href="#">로진백</a></li>
						<li><a href="#">아이패치</a></li>
						<li><a href="#">피규어</a></li>
						<li><a href="#">베이스</a></li>
						<li><a href="#">기타용품</a></li>
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