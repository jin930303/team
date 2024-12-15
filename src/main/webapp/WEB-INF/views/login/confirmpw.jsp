<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
   
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    function check() {
        var pw = $("#pw").val();
        var pwconfirm = $("#pwconfirm").val();
        var pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{4,16}$/; 
        var correctColor = "#00ff00";
        var wrongColor = "#ff0000";
        var id = $("input[name='id']").val();
        var confirmMsg = document.getElementById("confirmMsg");

        if (pw.length == 0) {
            alert('비밀번호를 입력하세요');
            $('#pw').focus();
            return false;
        }
        if (pwconfirm.length == 0) {
            alert('비밀번호 확인을 입력하세요');
            $('#pwconfirm').focus();
            return false;
        }
        if (!pwRegex.test(pw)) {
            alert('비밀번호는 4자 이상 16자 이하로 영문자, 숫자, 특수문자를 포함해야 합니다.');
            $('#pw').focus();
            return false;
        }
        if (pw !== pwconfirm) {
            confirmMsg.style.color = wrongColor;
            confirmMsg.innerHTML = "비밀번호 불일치";
            $('#pwconfirm').focus();
            return false;
        } else {
            confirmMsg.style.color = correctColor;
            confirmMsg.innerHTML = "비밀번호 일치";
        }
        
        $.ajax({
            type: "post",
            url: "updatepw", 
            async: true,
            data: {id:id,pw:pw},  
            success: function(response) {
                alert("비밀번호가 변경되었습니다.");
                window.location.href = "login"; 
            },
            error: function() {
                alert("비밀번호 변경에 실패하였습니다.");
            }
        });
    }
    $("#changePwBtn").click(check);
});
</script>

<link href="./css/login/confirmpw.css" rel="stylesheet"/> 

<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
	<main class="container">
		<div class="title">
			<h2>비밀번호 변경</h2>
		</div>
		<div class="input-container">
			<input type="hidden" name="id" value="${findpw.id}">
			<div>
				<input type="password" name="pw" id="pw" placeholder="새로운 비밀번호 입력" maxlength="16"></div>
			<div>
			    <input type="password" name="pwconfirm" id="pwconfirm" placeholder="비밀번호 확인" maxlength="16">
			    <span id="confirmMsg"></span>
			</div>
			<div class="submitbutton">
				<input type="button" id="changePwBtn" value="비밀번호 변경"> 
			</div>
		</div>
		<div id="memberinput" class="container" onclick="location.href='login'">
			<br><br>
			<strong>새로운 비밀번호로 보안을 강화하세요!</strong>
			<p>비밀번호를 변경하지 않으시겠다면?<br>
			<strong>이 곳!</strong>클릭하여 <strong>로그인</strong>바로 하러 바로가기!</p>
		</div>
	</main>
</body>
</html>