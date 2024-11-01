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
input[type="password"] {
    width: 100%;
    margin: 16px 0;
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
input[type="text"]:focus,
input[type="password"]:focus {
    border-color: #be241c;
    outline: none;
}

.submitbutton {
	text-align: center;
}

/* 버튼 스타일 */
input[type="button"] {
    width: 100%;
    margin: 16px 0;
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
input[type="button"]:hover {
    background-color: #8e1a14;
}

#memberinput{
	margin-top: 70px;
	width: 360px;
	height: 170px;
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