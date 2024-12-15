<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function confirmdelete(id){
	var pw=prompt("비밀번호를 입력해주세요:");
	if(pw!=null && pw.trim()!==""){
		if(confirm("정말로 삭제하겠습니까?")){
			location.href='delete2?id='+id+'&pw='+pw;
		}
	 	}else
			{
			alert("비밀번호를 입력해주세요");
			}
}

</script>
<link href="./css/login/deleteview.css" rel="stylesheet"/> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="flex_container">
	<div class="sidebar_container">
		<div class="sidebar_title"><h2>회원탈퇴</h2></div>
		<aside class="sidebar">
			<ul>
				<li><a href="myinfo">마이페이지</a></li>
				<li><a href="cart">장바구니</a></li>
				<li><a href="like_product">관심상품</a></li>
				<li><a href="update?id=${sessionScope.dto3.id}">회원정보 수정</a></li>
				<li><a href="delete?id=${sessionScope.dto3.id}&pw=${sessionScope.dto3.pw}">회원탈퇴</a></li>
			</ul>
		</aside>
	</div>
	
	<main class="main-container">
		<div class="title">
			<h1>" ${deleteview.nickname} " 님의 정보</h1>
		</div>
			<p><h2> 회원님의 현재 등급은 
				<strong>
					<c:choose>
			        	<c:when test="${grade_code == '004'}">vvip</c:when>
			            <c:when test="${grade_code == '003'}">vip</c:when>
			            <c:when test="${grade_code == '002'}">우수회원</c:when>
			            <c:otherwise>일반회원</c:otherwise>
					</c:choose>
				</strong>
				입니다.</h2>
			</p> 
					
					<!-- 
						<input type="button" value="삭제 하겠습니다." onclick="confirmdelete('${deleteview.id}')">
						<input type="button" value="삭제 하지않겠습니다." onclick="location.href='main'"> 
					 --> 
		<div class="submitbutton">
			<ul>
				<li>
					<button onclick="confirmdelete('${deleteview.id}')"> 
						<h1>삭제하겠습니다.</h1>
						<br>
						<br>
						<span>그동안 많은 관심주셔서 감사했습니다.</span>
						<br>
						<strong>회원탈퇴 완료</strong>
					</button>
				</li>
				<li>
					<button onclick="location.href='main'"> 
						<h1>삭제하지 않겠습니다.</h1>
						<br>
						<br>
						<span>앞으로도 더 나은 서비스를 제공하겠습니다.</span>
						<br>
						<strong>메인으로 돌아가기</strong>
					</button>
				</li>
			</ul>
		</div>
	</main>
</div>
</body>
</html>