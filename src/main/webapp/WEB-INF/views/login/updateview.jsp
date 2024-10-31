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

    <style>
        
        body {
		    font-family: 'Roboto', sans-serif;
		}
   
        .title{
         text-align: center;
         font-size: 30px;
        }

        .form-container {
            max-width: 850px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            background-color: white;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        caption {
            font-size: 1.5em;
            margin-bottom: 20px;
            font-weight: bold;
        }

        th, td {
            padding: 15px;
            text-align: left;
        }

        th {
            font-weight: bold;
            width: 20%;
            padding-left: 70px; /* 왼쪽 여백 추가 */
        }

        .form-container input[type="text"], 
		.form-container input[type="password"], 
		.form-container input[type="date"], 
		.form-container select {
		    width: calc(100% - 100px);
		    padding: 8px;
		    border: 1px solid #ccc;
		    border-radius: 4px;
		    font-size: 1em;
		}

        .button-inline {
            width: auto;
            margin-left: 10px;
            padding: 8px 12px;
            font-size: 1em;
            color: white; /* 버튼 글자 색상 */
            background-color: #be241c;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .address-section input[type="text"] {
		    width: calc(100% - 100px);
		    margin-bottom: 8px;
		}


        .address-section .button-inline {
            margin-top: 4px;
            width: 120px;
        }
        .address-section1 input[type="text"] {
            width: calc(100% - 120px);
            margin-bottom: 8px;
        }

        .button-container input[type="submit"], .button-container button[type="button"] {
            width: 100px;
            padding: 10px;
            font-size: 1em;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .button-container input[type="submit"] {
            background-color: #be241c;
            color: white;
            margin-right: 10px;
        }

        .button-container button[type="button"] {
            background-color: #777;
            color: #fff;
        }
        
        #nickname {
		    width: calc(100% - 190px); /* 기존보다 조금 줄임 */
		}
		#postcode {
		    width: calc(100% - 235px); /* 우편번호 입력 칸 너비 조정 */
		}
		.address-section1{
		   width: calc(100% - -20px);
		}
		     
    </style>
    
</head>
<body>
    <div class="form-container">
    <h1 class="title">회원 정보 수정</h1>
        <form action="memberupdate2" method="post" onsubmit="return check()">
            <table>
                <tr>
                    <th>아이디</th>
                    <td>
                        <input type="text" name="id" id="id" readonly value="${updateview.id}">
                    </td>
                </tr>
                <tr>
                    <th>비밀번호</th>
                    <td>
                        <input type="password" name="pw" id="pw" maxlength="16" placeholder="비밀번호를 입력해주세요">
                    </td>
                </tr>
                <tr>
                    <th>이름</th>
                    <td><input type="text" name="name" id="name" placeholder="이름을 입력해주세요"></td>
                </tr>
                <tr>
                    <th>닉네임</th>
                    <td>
                        <input type="text" name="nickname" id="nickname" placeholder="닉네임을 입력해주세요" value="${updateview.nickname}">
                        <button type="button" name="nicknamecheck" id="nicknamecheck1" class="button-inline">중복확인</button>
                    </td>
                </tr>
                <tr>
                    <th>생년월일</th>
                    <td><input type="date" name="birth" id="birth" value="${updateview.birth}"></td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td>
                        <div style="display: flex; align-items: center;">
                           <select name="phone0" id="phone0" style="width: 128px;">
                			<option value="010">010</option>
                			<option value="011">011</option>
                			<option value="016">016</option>
                			<option value="017">017</option>
                			<option value="018">018</option>
                			<option value="019">019</option>
                		</select> 
                		<span style="margin-left: 6px;"> - </span>
                            <input type="text" name="phone1" id="phone1" value="${updateview.phone1}" maxlength="4" style="width: 128px; margin-left: 9px; margin-right: 9px;">
                            <span> - </span>
                            <input type="text" name="phone2" id="phone2" value="${updateview.phone2}" maxlength="4" style="width: 128px; margin-left: 9px;">
                            <button type="button" name="phonecheck" id="phonecheck" class="button-inline">중복확인</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>주소</th>
                    <td>
                        <div class="address-section">
                            <input type="text" id="postcode" placeholder="우편번호">
                            <button type="button" onclick="sample6_execDaumPostcode()" class="button-inline">우편번호 찾기</button>
                         </div>
                          <div class="address-section1">
                            <input type="text" id="mainaddress" placeholder="주소" name="mainaddress">
                            <input type="text" id="detailAddress" placeholder="상세주소" name="detailaddress">
                            <input type="text" id="extraAddress" placeholder="참고항목" name="extraaddress">
                        </div>
                    </td>
                </tr>
                
                <tr>
                    <th>이메일</th>
                    <td>
                        <div style="display: flex; align-items: center;">
                            <input type="text" name="fdomain" id="fdomain" placeholder="이메일을 입력해 주세요" style="width: 35%;">
                            <span style="margin: 0 5px;">@</span>
                            <select name="bdomain" id="bdomain" style="width: 30%;">
                                <option value="naver.com">naver.com</option>
                                <option value="daum.net">daum.net</option>
                                <option value="gmail.com">gmail.com</option>
                                <option value="kakao.com">kakao.com</option>
                                <option value="nate.com">nate.com</option>
                            </select>
                            <button type="button" name="emailcheck" id="emailcheck" class="button-inline">중복확인</button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container" style="text-align: center;">
                        <input type="submit" value="수정">
                        <button type="button" onclick="window.history.back();">취소</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>
