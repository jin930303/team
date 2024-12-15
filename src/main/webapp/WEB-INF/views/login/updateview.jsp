<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
	var isPhoneAvailable = false;
	var isemailAvailable = false;
	var isNicknameAvailable = false;
	
	$(document).ready(function() {
		$("#nicknamecheck1").click(function() {
		    var nickname = $("#nickname").val();
		    $.ajax({
		        type: "post",
		        url: "nicknamecheck2",
		        data: { "nickname": nickname },
		        async: true,
		        success: function(data) {
		            if (data == "ok") {
		                alert("사용 가능한 닉네임입니다.");
		                isNicknameAvailable = true;  
		            } else {
		                alert("이미 사용중인 닉네임입니다.");
		                isNicknameAvailable = false;  
		            }
		        }
		    });
		});
		
		 $("#phonecheck").click(function() {
	            var phone0 = $("#phone0").val();
	            var phone1 = $("#phone1").val();
	            var phone2 = $("#phone2").val();
	            var phoneRegex = /^[0-9]{4}$/; 

	            if (phone0.trim() === "") {
	                alert('전화번호 앞자리를 선택해주세요.');
	                $("#phone0").focus();
	                return;
	            }
	            
	            if (!phoneRegex.test(phone1)) {
	                alert('전화번호 중간자리는 4자리 숫자만 가능합니다.');
	                $("#phone1").focus();
	                return;
	            }
	            if (!phoneRegex.test(phone2)) {
	                alert('전화번호 뒷자리는 4자리 숫자만 가능합니다.');
	                $("#phone2").focus();
	                return;
	            }

	            var fullPhone =  phone0 +"-"+ phone1 + "-" + phone2; 

	            $.ajax({
	                type: "post",
	                url: "phonecheck1", 
	                data: { "phone": fullPhone },
	                async: true,
	                success: function(data) {
	                    if (data == "ok") {
	                        alert("사용 가능한 전화번호입니다.");
	                        isPhoneAvailable = true; 
	                    } else {
	                        alert("이미 사용중인 전화번호입니다.");
	                        isPhoneAvailable = false; 
	                        $("#phone1").focus();
	                    }
	                }
	            });
	        });
		 
		 $("#emailcheck").click(function() {
	            var email = $("#fdomain").val()+"@"+$("#bdomain").val();
	            if ($("#fdomain").val().trim() === "") {
	                alert('이메일을 입력해 주세요');
	                $("#fdomain").focus();
	                return; 
	            }
	            $.ajax({
	                type: "post",
	                url: "emailcheck1",
	                data: { "email": email },
	                async: true,
	                success: function(data) {
	                    if (data == "ok") {
	                        alert("사용 가능한 이메일입니다.");
	                        isemailAvailable = true;
	                    } else {
	                        alert("이미 사용중인 이메일입니다.");
	                        isemailAvailable = false;
	                        $("#fdomain").focus();
	                    }
	                }
	            });
	        });
	});
	
	
	
	function check(){
		var pw = $("#pw").val();
		var pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{4,16}$/; 
		var koreanRegex = /^[가-힣]+$/;  
	    var name = $("#name").val();
	    var phone0 = $("#phone0").val();
	    var phone1 = $("#phone1").val();
	    var phone2 = $("#phone2").val();
	    var fdomain = $("#fdomain").val();
	    var nickname = $("#nickname").val();
		
	    if (!koreanRegex.test(name)) {
            alert("이름은 한글만 입력 가능합니다.");
            $("#name").focus();  
            return false;
        }
	    
	     if (pw.trim() == "") {
            alert('비밀번호를 입력해주세요');
            $('#pw').focus();
            return false;
        	}
		 if (!pwRegex.test(pw)) {
	            alert('비밀번호는 4자 이상 16자 이하로 영문자,숫자,특수문자를 포함해야합니다.');
	            $('#pw').focus();
	            return false;
	        }
		 if (!isNicknameAvailable) {
	            alert('닉네임 중복 확인해주세요');
	            $('#nickname').focus();
	            return false;
	        }
		 if (name.trim() == "") {
	            alert('이름을 입력해주세요');
	            $('#name').focus();
	            return false;
	        }
		 if (phone0.trim() == "") { 
	            alert('전화번호 앞자리를 선택해주세요');
	            $('#phone0').focus();
	            return false;
	        }
	        
	        if (phone1.trim() == "") {
	            alert('전화번호 가운데 자리를 입력해주세요');
	            $('#phone1').focus();
	            return false;
	        }
	        if (phone2.trim() == "") {
	            alert('전화번호 뒷자리를 입력해주세요');
	            $('#phone2').focus();
	            return false;
	        }
	        if (fdomain.trim() == "") {
	            alert('이메일을 입력해 주세요');
	            $('#fdomain').focus();
	            return false;
	        }
	        if (!isemailAvailable) {
	            alert('이메일 중복 확인해주세요');
	            $('#fdomain').focus();
	            return false;
	        }
	        if (!isPhoneAvailable) {
	            alert('전화번호 중복 확인해주세요');
	            $('#phonecheck').focus();
	            return false;
	        }
	        return true;
	}
</script>
 <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                    <script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("mainaddress").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }
</script>

<link href="./css/login/updateview.css" rel="stylesheet"/> 
</head>
<body>
<div class="flex_container">

	<div class="sidebar_container">
		<div class="sidebar_title"><h2>회원정보</h2></div>
		<aside class="sidebar">
			<ul>
				<li><a href="myinfo">마이페이지</a></li>
				<li><a href="cart">장바구니</a></li>
				<li><a href="like_product">관심상품</a></li>
				<li><a href="update?id=${sessionScope.dto3.id}">회원정보 수정</a></li>
				<li><a href="delete?id=${sessionScope.dto3.id}&pw=${sessionScope.dto3.pw}">회원탈퇴</a></li>
			</ul>
		</aside>
	</div>
    <main class="main-container">
    	<div class="title">
    		<h1>회원 정보 수정</h1>
    	</div>
        <form action="memberupdate2" method="post" onsubmit="return check()">
			<input type="hidden" name="id" id="id" readonly value="${updateview.id}">
            <table>
            	<tr>
                    <th>이름</th>
                    <td>
                    	<div class="input-container">
                    		<input type="text" name="name" id="name" placeholder="이름을 입력해주세요">
                		</div>
					</td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td>
                    	<div class="input-container">
                        	<input type="password" name="pw" id="pw" maxlength="16" placeholder="비밀번호를 입력해주세요">
                    	</div>
                    </td>
                </tr>
                <tr>
                    <th>닉네임</th>
                    <td>
                    	<div class="input-container">
	                        <input type="text" name="nickname" id="nickname" placeholder="닉네임을 입력해주세요" value="${updateview.nickname}">
	                        <input type="button" name="nicknamecheck" id="nicknamecheck1" value="중복확인">
                    	</div>
                    </td>
                </tr>
                
                <tr>
                    <th>생년월일</th>
                    <td>
						<div class="input-container">
                    		<input type="date" name="birth" id="birth" value="${updateview.birth}">
                    	</div>
                    </td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>
                        <div class="phone-container">
							<select name="phone0" id="phone0">
                			<option value="010">010</option>
                			<option value="011">011</option>
                			<option value="016">016</option>
                			<option value="017">017</option>
                			<option value="018">018</option>
                			<option value="019">019</option>
                		</select> 
                				<span style="margin: 6px;"> - </span>
                            <input type="text" name="phone1" id="phone1" value="${updateview.phone1}" maxlength="4">
                            	<span style="margin: 6px;"> - </span>
                            <input type="text" name="phone2" id="phone2" value="${updateview.phone2}" maxlength="4">
                            <input type="button" name="phonecheck" id="phonecheck" value="중복확인">
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <th>이메일</th>
                    <td>
                        <div class="email-container">
                            <input type="email" name="fdomain" id="fdomain" placeholder="이메일을 입력해 주세요">
                            	<span style="margin: 6px;"> @ </span>
                            <select name="bdomain" id="bdomain">
                                <option value="naver.com">naver.com</option>
                                <option value="daum.net">daum.net</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="kakao.com">kakao.com</option>
                                <option value="nate.com">nate.com</option>
                            </select>
                            <input type="button" name="emailcheck" id="emailcheck" value="중복확인">
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>
                        <div class="input-container">
							<input type="text" id="postcode" placeholder="우편번호">
                        	<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
						</div>
						<input type="text" id="mainaddress" placeholder="주소" name="mainaddress">
                        <input type="text" id="detailAddress" placeholder="상세주소" name="detailaddress">
                        <input type="text" id="extraAddress" placeholder="참고항목" name="extraaddress">
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
						<div class="submitbutton">
	                        <input type="submit" value="수정완료">
	                        <input type="reset" value="다시작성">
	                        <input type="button" onclick="window.history.back();" value="수정취소">
                    	</div>
                    </td>
                </tr>
            </table>
        </form>
    </main>
</div>
</body>
</html>
