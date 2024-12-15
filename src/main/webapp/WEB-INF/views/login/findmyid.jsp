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

<link href="./css/login/findmyid.css" rel="stylesheet"/> 

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
			<p>로그인을 하고 다양한 혜택을 확인해보세요!<br>
			<strong>이 곳!</strong>클릭하여 <strong>로그인</strong>하러 바로가기!</p>
		</div>
    </div>
</body>
</html>
