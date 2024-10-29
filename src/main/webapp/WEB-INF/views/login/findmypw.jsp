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
</head>
<body>
<form onsubmit="return check();" action="findpwcheck" method="post">
    <div class="form-group">
        <input type="text" name="id" id="id" placeholder="아이디">
    </div>
    <div class="form-group">
        <input type="text" name="name" id="name" placeholder="이름">
    </div>
    <div class="form-group">
        <input type="email" name="email" id="email" placeholder="이메일">
    </div>
    <button type="submit" id="idfind">비밀번호 변경</button>
</form>
</body>
</html>
