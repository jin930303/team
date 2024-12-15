<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<script type="text/javascript">
function check(){
    var id = $("#id").val();
    var name = $("#name").val();
    var email = $("#email").val();
   
    if (id.trim() == "") {
        alert('아이디를 입력해주세요');
        $('#id').focus();
        return false; 
    }
    
    if (name.trim() == "") {
        alert('이름을 입력해주세요');
        $('#name').focus();
        return false; 
    }

    if (email.trim() == "") {
        alert('이메일을 입력해주세요');
        $('#email').focus();
        return false; 
    }
    return true; 
}
</script>
<link href="./css/login/findmypw.css" rel="stylesheet"/> 
</head>
<body>
<main class="container">
	<div class="title">
		<h2>비밀번호 변경</h2>
	</div>
	<form onsubmit="return check();" action="findpwcheck" method="post">
		<div class="input-container">
		    <div class="form-group">
		        <input type="text" name="id" id="id" placeholder="아이디">
		    </div>
		    <div class="form-group">
		        <input type="text" name="name" id="name" placeholder="이름">
		    </div>
		    <div class="form-group">
		        <input type="email" name="email" id="email" placeholder="이메일">
		    </div>
		    <div class="submitbutton">
			    <input type="submit" id="idfind" value="비밀번호 변경">
	    	</div>
		</div>
	</form>
	<br>
	<div id="memberinput" class="container" onclick="location.href='login'">
		<br><br>
		<strong>이미 회원이신가요?</strong>
		<p>로그인을 하고 다양한 혜택을 확인해보세요!<br>
		<strong>이 곳!</strong>클릭하여 <strong>로그인</strong>하러 바로가기!</p>
	</div>
</main>
</body>
</html>
