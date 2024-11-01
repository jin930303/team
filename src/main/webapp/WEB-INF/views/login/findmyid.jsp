<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script type="text/javascript">
	function check() {
		var name = document.getElementById("name").value;
		var email = document.getElementById("email").value;
		
		if (name.trim() == "") {
			alert('이름을 입력해주세요');
			document.getElementById("name").focus();
			return false; 
		}

		if (email.trim() == "") {
			alert('이메일을 입력해주세요');
			document.getElementById("email").focus();
			return false; 
		}
	
	$.ajax({
		type:"post",
		url:"findidcheck",
		async:true,
		data:{name:name,email:email},
		success:function(response){
			if(response.id){
				alert("당신의 아이디는 : "+response.id+"입니다");
				window.location.href="login";
			}
			else{
				alert(response.message);
			}
		},
		  error: function(xhr, status, error) {
              console.error("Error: " + error); // 추가적인 오류 정보
              alert("아이디 찾기에 실패하였습니다.");
          }
	});
	return false;
	}
</script>

<style type="text/css">
/* 전체 컨테이너 스타일 */
.container {
    max-width: 400px;
    height: 605px;
    margin: 0 auto;
    padding: 20px; /* 패딩 조정 */
    border: 1px solid #ddd;
    box-sizing: border-box;
}

/* 제목 스타일 */
.title {
    padding: 20px;
}

.title h2 {
    color: #686868;
    font-size: 30px;
    font-family: inherit;
    font-weight: 500;
    text-align: center;
    padding-top: 12px;
}

/* 공통 input 필드 스타일 */
input[type="text"],
input[type="email"] {
    width: 100%;
    padding: 12px;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 14px;
    margin-top: 8px;
    box-sizing: border-box;
    background-color: #fff;
    transition: border 0.3s ease;
}

/* input 필드 hover, focus 스타일 */
input[type="text"]:hover,
input[type="email"]:hover,
input[type="text"]:focus,
input[type="email"]:focus {
    border-color: #be241c;
    outline: none;
}

.submitbutton {
	text-align: center;
}

/* 버튼 스타일 */
input[type="submit"],
input[type="button"] {
    width: 100%;
    padding-top: 12px;
    padding: 12px;
    background-color: #be241c;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    margin-top: 8px; /* 필드 간 간격 통일 */
    box-sizing: border-box;
    transition: background-color 0.3s ease;
}

/* 버튼 hover 스타일 */
input[type="submit"]:hover,
input[type="button"]:hover {
    background-color: #8e1a14;
}

#memberinput{
	width: 360px;
	height: 220px;
    padding: 12px; /* 내부 여백 */
    border: 2px solid #ddd; /* 연한 테두리 */
    border-radius: 3px; /* 모서리 둥글게 */
    box-sizing: border-box; /* 패딩과 테두리 포함한 전체 크기 */
    transition: border 0.3s ease; /* 테두리 변경 시 부드러운 전환 */
}

#memberinput:hover{
	cursor: pointer;
	border-color: #be241c; /* 포커스 시 붉은색 테두리 */
    outline: none; /* 포커스 시 외곽선 제거 */
    background-color: #f2ecec;
}

</style>

</head>
<body>
	<div class="container">
		<div class="title">
			<h2>아이디 찾기</h2>
		</div>
	    <form onsubmit="return check();"  method="post">
	        <div class="input-container">
		        <div class="form-group">
		            <input type="text" name="name" id="name" placeholder="이름">
		        </div>
		        <div class="form-group">
		            <input type="email" name="email" id="email" placeholder="이메일">
		        </div>
		        <div class="submitbutton">
			        <input type="submit" id="idfind" value="아이디 찾기">
	    		</div>
	    		<br>
	    	</div>
	    </form>
	    <br>
		<div id="memberinput" class="container" onclick="location.href='login'">
			<br><br><br>
			<strong>이미 회원이신가요?</strong>
			<p>로그을 하고 다양한 혜을 확인해보세요!<br>
			<strong>이 곳!</strong>클릭하여 <strong>로그인</strong>하러 바로가기!</p>
		</div>
    </div>
</body>
</html>
