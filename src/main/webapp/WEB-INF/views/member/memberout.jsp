<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$(".delete_btn").click(function(e){
		e.preventDefault();
		var memberId=$(this).data("id");
		
		if(confirm("정말로 삭제하시겠습니까?")){
			$.ajax({
				url : "memberdelete",
				type: "post",
				data: {id:memberId},
				async: true,
				 success: function(response) {
	                    if (response === 'success') {
	                        $("#row-" + memberId).remove();  
	                    } else {
	                        alert("회원 삭제에 실패했습니다.");
	                    }
	                },
	                error: function() {
	                    alert("서버 오류가 발생했습니다.");
	                }
			});
		}
	});
});
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./css/member/memberout.css" rel="stylesheet"/> 	
    
</head>
<body>
<table>
	<tr>
				<th>아이디</th>
				<th>닉네임</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>이메일</th>
				<th>회원등급</th>
				<th>회원삭제</th>
			</tr>
	<c:forEach items="${list}" var="my">
		
		
			<tr id="row-${my.id}">
				<td>${my.id}</td>
				<td>${my.nickname}</td>
				<td>${my.name}</td>
				<td>${my.phone}</td>
				<td>${my.address}</td>
				<td>${my.email}</td>
				<td>${my.grade_name}</td>
				<td><button class="delete_btn" data-id="${my.id}">삭제</button></td>
	


	</c:forEach>
		</table>
</body>
</html>