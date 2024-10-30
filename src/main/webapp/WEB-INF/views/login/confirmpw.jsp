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
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
<table border="6" align="center">
    <input type="hidden" name="id" value="${findpw.id}">
    <tr>
        <th>새 비밀번호</th>
        <td><input type="password" name="pw" id="pw" placeholder="비밀번호 입력" maxlength="16"></td>
    </tr>
    <tr>
        <th>비밀번호 확인</th>
        <td>
            <input type="password" name="pwconfirm" id="pwconfirm" placeholder="비밀번호 확인" maxlength="16">
            <span id="confirmMsg"></span>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="button" id="changePwBtn" value="비밀번호 변경"> 
            <input type="reset" value="취소">
        </td>
    </tr>
</table>
</body>
</html>