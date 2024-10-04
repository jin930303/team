<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<table border="6" align="center">
		<caption>${deleteview.nickname}님의회원삭제 정보</caption>
		<tr>
			<th>당신의 현재 등급은</th>
			<td>${deleteview.grade}입니다.</td>
		</tr>
		
		<tr>
			<td colspan="2">
			<input type="button" value="삭제" onclick="confirmdelete('${deleteview.id}')"> 
			<input type="button" value="메인으로" onclick="location.href='main'"> 
			</td>
			
		</tr>
	</table>
</body>
</html>