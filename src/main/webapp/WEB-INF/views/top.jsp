<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
	function validateSearch() {
		var searchInput = document.getElementById("search").value.trim();
		if (searchInput === "") {
			alert("검색어를 입력하세요.");
			return false; // 폼 제출 중단
		}
		return true; // 폼 제출 진행
	}
</script>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"	rel="stylesheet">
<!-- 좀 뽀짝한거 -->
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<!-- Mulish -->
<link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,599;1,599&display=swap" rel="stylesheet">

<!-- Noto Sans Korean -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- Gothic A1 -->
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- Nanum Gothic -->
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- Noto Serif Korean -->
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR:wght@200..900&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="./css/top.css" rel="stylesheet"/> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- <li class="left-top">
		            		<c:choose>
			               		<c:when test="${not empty sessionScope.kakaoname}">  
			               			${sessionScope.kakaoname}님 반갑습니다 
			               		</c:when>
			               		<c:otherwise>  
			               			${sessionScope.dto3.nickname}님 반갑습니다 
			               		</c:otherwise>
		            		</c:choose>
            			</li> -->
<!-- 앞에 navbar 빼면 메인이미지 - 상품카테고리 사이 간격 사라짐 -->
	<nav class="navbar navbar-inverse">
		<div class="container-log">
			<ul class="nav navbar-nav" id="right-top">
				<c:choose>
					<c:when test="${loginstate==true}">
						
						<li><a href="logout">로그아웃</a></li>
						<li><a href="myinfo">마이페이지</a></li>

<!-- 로그인 상태에서만 접근 가능하도록 카트 링크 처리 -->
						<c:choose>
							<c:when test="${loginstate == true}">
								<li><a href="cart">장바구니</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="login?redirect=cart">장바구니 (로그인 필요)</a></li>
							</c:otherwise>
						</c:choose>
						<li><a href="faq_community"> 고객센터</a></li>
						<li><a href="like_product"> 관심상품</a></li>
						<li>
							<form action="searchItem" method="get" style="display: inline;" onsubmit="return validateSearch()">
								<input type="text" name="query" id="search" placeholder="검색">
								<button type="submit">검색</button>
							</form>
						</li>
					</c:when>

					<c:when test="${adminloginstate==true}">
						<li><a href="#"><span class="glyphicon glyphicon-user"></span>관리자님 반갑습니다.</a></li>
						<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">사이트 관리<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="productin">상품자료입력</a></li>
								<li><a href="productdelete">상품자료출력</a></li>
								<li><a href="memberout">회원정보관리</a></li>
							</ul></li>
						<li><a href="faq_community">고객센터</a></li>
						<li><a href="logout"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>
					</c:when>

					<c:otherwise>
						<li><a href="login">로그인</a></li>
						<li><a href="memberinput">회원가입</a></li>
						<li><a href="cart">장바구니</a></li>
						<li><a href="faq_community">고객센터</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>

		<div class="container-head">
			<div class="navbar-header">
				<a class="navbar-brand" href="main">
					<img src="./image/swings.png">
				</a>
			</div>
		</div>

		<div class="container-fluid">
			<ul class="nav navbar-nav" id="dropdown-title">
				<li><a href="bestitem">BEST</a></li>
				<li><a href="newitem">NEW</a></li>
				<li><a href="saleitem">SALE</a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">글러브<span class="caret"></span></a>
					<ul class="dropdown-menu" id="dropdown-menubar">
						<li><a href="pitcherallround">투수/올라운드</a></li>
						<li><a href="infielder">내야수</a></li>
						<li><a href="outfielder">외야수</a></li>
						<li><a href="catchersmitt">포수미트</a></li>
						<li><a href="youth">어린이/유소년용</a></li>
						<li><a href="glovecare">글러브 관리용품</a></li>
					</ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle"data-toggle="dropdown" href="#">배트<span class="caret"></span></a>
					<ul class="dropdown-menu" id="dropdown-menubar">
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

				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">장갑<span class="caret"></span></a>
					<ul class="dropdown-menu" id="dropdown-menubar">
						<li><a href="batting-gloves">배팅장갑</a></li>
						<li><a href="fielding-gloves">수비장갑</a></li>
						<li><a href="base-running-gloves">주루장갑</a></li>
						<li><a href="thermal-gloves">방한장갑</a></li>
						<li><a href="youth-gloves">유소년용 장갑</a></li>
					</ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">야구화<span class="caret"></span></a>
					<ul class="dropdown-menu" id="dropdown-menubar">
						<li><a href="integrated-spikes">징 일체형</a></li>
						<li><a href="turf-shoes">인조잔디화</a></li>
						<li><a href="point-shoes">포인트화</a></li>
						<li><a href="shoe-accessories">야구화부속품</a></li>
					</ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">가방<span class="caret"></span></a>
					<ul class="dropdown-menu" id="dropdown-menubar">
						<li><a href="backpacks">백팩</a></li>
						<li><a href="crossbody-bags">크로스백</a></li>
						<li><a href="wheeled-bags">휠가방</a></li>
						<li><a href="bat-bags">배트가방</a></li>
						<li><a href="ball-bags">볼가방</a></li>
					</ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">의류<span class="caret"></span></a>
					<ul class="dropdown-menu" id="dropdown-menubar">
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
					</ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">보호장비<span class="caret"></span></a>
					<ul class="dropdown-menu" id="dropdown-menubar">
						<li><a href="batter-helmets">타자헬멧</a></li>
						<li><a href="arm-guards">암가드</a></li>
						<li><a href="foot-guards">풋가드</a></li>
						<li><a href="hand-guards">핸드가드</a></li>
						<li><a href="face-masks">안면마스크</a></li>
						<li><a href="other-protective-gear">기타 보호장비</a></li>
					</ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">야구공<span class="caret"></span></a>
					<ul class="dropdown-menu" id="dropdown-menubar">
						<li><a href="hard-balls">경식구</a></li>
						<li><a href="soft-balls">연식구</a></li>
						<li><a href="snap-balls">스냅볼</a></li>
						<li><a href="ball-storage">야구공 보관함</a></li>
					</ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">굿즈<span class="caret"></span></a>
					<ul class="dropdown-menu" id="dropdown-menubar">
						<li><a href="keyring">키링</a></li>
						<li><a href="towel">타올</a></li>
						<li><a href="doll">인형</a></li>
						<li><a href="headbands-bracelets">슬리퍼</a></li>
					</ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">기타용품<span class="caret"></span></a>
					<ul class="dropdown-menu" id="dropdown-menubar">
						<li><a href="sunglasses">선글라스</a></li>
						<li><a href="accessories">악세사리</a></li>
						<li><a href="wristbands">손목밴드</a></li>
						<li><a href="rosin-bags">로진백</a></li>
						<li><a href="bases">베이스</a></li>
					</ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티<span class="caret"></span></a>
					<ul class="dropdown-menu" id="dropdown-menubar">
						<li><a href="gongjiboard">공지사항</a></li>
						<li><a href="eventboard">이벤트</a></li>
						<li><a href="board">자유게시판</a></li>
						<li><a href="sosickboard">야구소식</a></li>
						<li><a href="iljung">경기일정</a></li> 
					</ul>
				</li>
			</ul>
		</div>
	</nav>
</body>
</html>