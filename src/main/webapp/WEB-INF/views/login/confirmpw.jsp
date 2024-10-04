<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function check(){
	var pw=$("#pw").val();
	var pwconfirm=$("#pwconfirm").val();
	var pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{4,16}$/; // 영문자, 숫자, 특수문자 포함
	var correctColor = "#00ff00";
    var wrongColor = "#ff0000";
	if(pw.length==0)
		{
		alert('비밀번호를 입력하세요');
		$('#pw').focus();
		return false;
		}
	if(pwconfirm.length==0)
	{
	alert('비밀번호를 입력하세요');
	$('#pw').focus();
	return false;
	}
	if (!pwRegex.test(pw)) {
         alert('비밀번호는 4자 이상 16자 이하로 영문자,숫자,특수문자를 포함해야합니다.');
         $('#pw').focus();
         return false;
     }
	 if (pw !== pwconfirm) {
         confirmMsg.style.color = wrongColor;
         confirmMsg.innerHTML = "비밀번호 불일치";
         $('#pwconfirm').focus();
         return false;
     }
	 else {
         confirmMsg.style.color = correctColor;
         confirmMsg.innerHTML = "비밀번호 일치";
     }
	 document.forms[0].submit();
}
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input type="hidden" name="id" value="${findpw.id}">
<form action="updatepw" method="post">
<table border="6" align="center">
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
                    <input type="button" value="비밀번호 변경" onclick="check()"> 
                    <input type="reset" value="취소">
                </td>
            </tr>
</table>
</form>
</body>
</html>