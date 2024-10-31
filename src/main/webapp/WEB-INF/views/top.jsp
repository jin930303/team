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

<!-- Noto Sans Korean -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- Gothic A1 -->
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- Nanum Gothic -->
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">

<!-- Noto Serif Korean -->
<link href="https://fonts.googleapis.com/css2?family=Gothic+A1&family=Nanum+Gothic+Coding&family=Noto+Sans+KR:wght@100..900&family=Noto+Serif+KR:wght@200..900&display=swap" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
/* body 전체 */
	body {
		font-family: Arial, sans-serif;
		margin: 0;
		padding: 20px;
		background-size: cover;			/* 이미지가 화면 전체를 덮도록 설정 */
		background-position: center;	/* 이미지를 가운데에 배치 */
		background-repeat: no-repeat;	/* 이미지를 반복하지 않음 */
		background-attachment: fixed;	/* 배경이 고정된 상태로 스크롤 */
	}
	
/* footer Style */
	footer {
		width: 100%;
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 12px;
		color: #333;
		background-color: #fafafa;
	}
	
/* pre Style */
	pre {
		font-family: 'Gothic A1', sans-serif;
		font-size: 15px;
		background-color: transparent;
		white-space: pre-wrap;
		overflow-wrap: break-word;
		text-align: left;
		max-width: 1000px;
		overflow: hidden;
		border: none !important;
	}

/* header 전체 */
	.navbar-inverse {
		font-family: 'Noto Sans KR', sans-serif;
		background-color: rgba(255, 255, 255, 0.5) !important;
		border-color: rgba(255, 255, 255, 0.5) !important;
		border-bottom: 2px solid #be241c !important;
	    position: relative;
	}
	
	.navbar-inverse::after {
	    content: "";
	    position: absolute;
	    bottom: 10px; /* 첫 번째 선과 간격 조정 */
	    left: 0;
	    width: 100%;
	    height: 2px;
	    background-color: #be241c; /* 두 번째 선 색상 */
	}

/* header 내 링크 section */
	.navbar-inverse .navbar-nav>li>a {
		padding-bottom: 35px;
		color: #000 !important;						/* 기본 글씨 색상 검정 */
		background-color: transparent !important;	/* 배경색 투명 */
		transition: color 0.3s ease, background-color 0.3s ease-out; 
	}
	
/* header 내 링크 section hover 시 */
	.navbar-inverse .navbar-nav>li>a:hover {
		color: #ddd !important;					/* hover 상태에서도 색상 변화 없음 */
		background-color: #be241c !important;	/* 배경색 변화 없음 */
	}

/* 좌측 상단 로그인쪽 */
.container-log {
    display: flex;
    font-size: 13px;
    justify-content: flex-end; /* 왼쪽에서 오른쪽으로 정렬 변경 */
    color: #666666;
    align-items: center;
}

/* 타이틀 */
	.container-head {
		font-family: 'Gothic A1', sans-serif;
		display: flex;
		font-size: 60px !important;
		justify-content: center;
		align-items: center;
		color: black;
	}
	
	.navbar-header {
	    font-family: 'Gothic A1', sans-serif;
	    background-size: contain;
	    background-repeat: no-repeat;
	    background-position: center;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    color: black;
	    width: 100%;
	    height: 120px;
	}
	
	.navbar-brand {
	    display: flex;
	    align-items: center;
	    justify-content: center;
	    font-size: 60px !important;
	    color: black;
	}
	
	.navbar-brand img {
	    height: 300px; /* 필요한 크기로 수정 */
	    object-fit: contain; /* 이미지 크기를 유지하며 영역에 맞게 조정 */
	}

	#search {
	    width: calc(100% - 100px); /* 버튼의 너비를 고려 */
	    padding: 4px;
	    border: 1px solid #ccc;
	    border-radius: 4px;
	    font-size: 1em;
	    transition: border-color 0.3s;
	    margin-top: 10px;
	}

	button[type="submit"] {
	    padding: 5px 12px;
	    margin-left: 5px;
	    border: none;
	    border-radius: 4px;
	    background-color: #be241c;
	    color: white;
	    font-size: 1em;
	    cursor: pointer;
	    transition: background-color 0.3s;
	}

	button[type="submit"]:hover {
	    background-color: #8e1a14; /* 호버 시 색상 변경 */
	}

	.navbar-header>a:hover {
		color: #ddd !important;	/* hover 상태에서도 색상 변화 없음 */
	}
	
	.container-fluid {
		font-size: 20px;
		display: flex;
		justify-content: center;
	}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 앞에 navbar 빼면 메인이미지 - 상품카테고리 사이 간격 사라짐 -->
	<nav class="navbar navbar-inverse">
		<div class="container-log" style="text-align: left;">
			<ul class="nav navbar-nav navbar-left">
				<c:choose>
					<c:when test="${loginstate==true}">
						<li><a href="#">
		            	<c:choose>
		               		<c:when test="${not empty sessionScope.kakaoname}">  
		               			${sessionScope.kakaoname}님 반갑습니다.
		               		</c:when>
		               		<c:otherwise>  
		               			${sessionScope.dto3.nickname}님 반갑습니다. 
		               		</c:otherwise>
		            	</c:choose>
            			</a></li>
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
						<!-- 
						<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">고객센터<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="faq_community">고객센터</a></li>
							</ul>
						</li>
						 -->
						<li><a href="faq_community">고객센터</a></li>
						<li><a href="logout"><span class="glyphicon glyphicon-log-out"></span>로그아웃</a></li>
					</c:when>

					<c:otherwise>
						<li><a href="memberinput">회원가입</a></li>
						<li><a href="login">로그인</a></li>
						<li><a href="cart">장바구니</a></li>
						<li><a href="faq_community">고객센터</a></li>
						<!-- <li>
							<form action="searchItem" method="get" style="display: inline;"
								onsubmit="return validateSearch()">
								<input type="text" name="query" id="search" placeholder="검색">
								<button type="submit">검색</button>
							</form>
						</li> -->
					</c:otherwise>
				</c:choose>
			</ul>
		</div>

		<div class="container-head">
			<div class="navbar-header">
				<a class="navbar-brand" href="main" style="font-size:60px; color: black;">
					<img src="./image/swings.png" height="250px">
				</a>
			</div>
		</div>

		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li><a href="bestitem">Best</a></li>
				<li><a href="newitem">New</a></li>
				<li><a href="saleitem">Sale</a></li>
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">글러브<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="pitcherallround">투수/올라운드</a></li>
						<li><a href="infielder">내야수</a></li>
						<li><a href="outfielder">외야수</a></li>
						<li><a href="catchersmitt">포수미트</a></li>
						<li><a href="youth">어린이/유소년용</a></li>
						<li><a href="glovecare">글러브 관리용품</a></li>
					</ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle"data-toggle="dropdown" href="#">배트<span class="caret"></span></a>
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

				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">장갑<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="batting-gloves">배팅장갑</a></li>
						<li><a href="fielding-gloves">수비장갑</a></li>
						<li><a href="base-running-gloves">주루장갑</a></li>
						<li><a href="thermal-gloves">방한장갑</a></li>
						<li><a href="youth-gloves">유소년용 장갑</a></li>
					</ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">야구화<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="integrated-spikes">징 일체형</a></li>
						<li><a href="turf-shoes">인조잔디화</a></li>
						<li><a href="point-shoes">포인트화</a></li>
						<li><a href="shoe-accessories">야구화부속품</a></li>
					</ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">가방<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="backpacks">백팩</a></li>
						<li><a href="crossbody-bags">크로스백</a></li>
						<li><a href="wheeled-bags">휠가방</a></li>
						<li><a href="bat-bags">배트가방</a></li>
						<li><a href="ball-bags">볼가방</a></li>
					</ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">의류<span class="caret"></span></a>
					<ul class="dropdown-menu">
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
					<ul class="dropdown-menu">
						<li><a href="batter-helmets">타자헬멧</a></li>
						<li><a href="arm-guards">암가드</a></li>
						<li><a href="foot-guards">풋가드</a></li>
						<li><a href="hand-guards">핸드가드</a></li>
						<li><a href="face-masks">안면마스크</a></li>
						<li><a href="other-protective-gear">기타 보호장비</a></li>
					</ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">야구공<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="hard-balls">경식구</a></li>
						<li><a href="soft-balls">연식구</a></li>
						<li><a href="snap-balls">스냅볼</a></li>
						<li><a href="ball-storage">야구공 보관함</a></li>
					</ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">굿즈<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="keyring">키링</a></li>
						<li><a href="towel">타올</a></li>
						<li><a href="doll">인형</a></li>
						<li><a href="headbands-bracelets">슬리퍼</a></li>
					</ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">기타용품<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="sunglasses">선글라스</a></li>
						<li><a href="accessories">악세사리</a></li>
						<li><a href="wristbands">손목밴드</a></li>
						<li><a href="rosin-bags">로진백</a></li>
						<li><a href="bases">베이스</a></li>
					</ul>
				</li>

				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">커뮤니티<span class="caret"></span></a>
					<ul class="dropdown-menu">
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