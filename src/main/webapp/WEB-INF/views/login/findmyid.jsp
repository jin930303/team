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
		

		// 이름 입력 체크
		if (name.trim() == "") {
			alert('이름을 입력해주세요');
			document.getElementById("name").focus();
			return false; // 유효성 검사 실패 시 폼 제출 중지
		}

		// 이메일 입력 체크
		if (email.trim() == "") {
			alert('이메일을 입력해주세요');
			document.getElementById("email").focus();
			return false; // 유효성 검사 실패 시 폼 제출 중지
		}

		return true; 
	}
</script>
</head>
<body>
	  <h2>아이디 찾기</h2>
    <form onsubmit="return check();" action="findidcheck" method="post">
        <div class="form-group">
            <input type="text" name="name" id="name" placeholder="이름">
        </div>
        <div class="form-group">
            <input type="email" name="email" id="email" placeholder="이메일">
        </div>
        <button type="submit" id="idfind">아이디 찾기</button>
    </form>
</body>
</html>
