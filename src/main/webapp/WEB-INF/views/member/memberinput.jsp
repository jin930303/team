<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <script type="text/javascript">
    var isNicknameAvailable = false;
    var isIdAvailable = false;
	var isemailAvailable = false;
	var isPhoneAvailable = false;
	
    $(document).ready(function() {
        $("#idcheck").click(function() {
            var id = $("#id").val();
            var idRegex = /^[a-zA-Z0-9]{4,12}$/;
            if (!idRegex.test(id)) {
                alert('아이디는 4자 이상 12자 이하의 영문자 또는 숫자만 가능합니다');
                $("#id").focus();
                return;
            }
            $.ajax({
                type: "post",
                url: "idcheck1",
                data: { "id": id },
                async: true,
                success: function(data) {
                    if (data == "ok") {
                        alert("사용 가능한 아이디입니다.");
                        isIdAvailable = true;
                    } else {
                        alert("이미 사용중인 아이디입니다.");
                        isIdAvailable = false;
                        $("#id").focus();
                    }
                }
            });
        });

        $("#nicknamecheck").click(function() {
            var nickname = $("#nickname").val();
            if (nickname.trim() === "") {
                alert('닉네임을 입력해주세요');
                $("#nickname").focus();
                return; 
            }
            $.ajax({
                type: "post",
                url: "nicknamecheck1",
                data: { "nickname": nickname },
                async: true,
                success: function(data) {
                    if (data == "ok") {
                        alert("사용 가능한 닉네임입니다.");
                        isNicknameAvailable = true;
                    } else {
                        alert("이미 사용중인 닉네임입니다.");
                        isNicknameAvailable = false;
                        $("#nickname").focus();
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
        // 비밀번호 보이기/숨기기 기능
        $('.togglePassword').click(function() {
            const passwordInput = $(this).siblings('input');
            const type = passwordInput.attr('type') === 'password' ? 'text' : 'password';
            passwordInput.attr('type', type);
            $(this).find('i').toggleClass('fa-eye fa-eye-slash');
        });
        
        $("#phonecheck").click(function() {
        	var phone0 = $("#phone0").val();
            var phone1 = $("#phone1").val();
            var phone2 = $("#phone2").val();
            var phoneRegex = /^[0-9]{4}$/; // 전화번호 형식 체크 (4자리 숫자)
			
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

            var fullPhone = phone0 +"-"+ phone1 + "-" + phone2; // 전체 전화번호 조합

            $.ajax({
                type: "post",
                url: "phonecheck1", // 서버에서 처리할 URL
                data: { "phone": fullPhone },
                async: true,
                success: function(data) {
                    if (data == "ok") {
                        alert("사용 가능한 전화번호입니다.");
                        isPhoneAvailable = true; // 전화번호 사용 가능 플래그
                    } else {
                        alert("이미 사용중인 전화번호입니다.");
                        isPhoneAvailable = false; // 전화번호 사용 불가 플래그
                        $("#phone1").focus();
                    }
                }
            });
        });
        
    });

    function check() {
        var id = $("#id").val();
        var pw = $("#pw").val();
        var pwconfirm = $("#pwconfirm").val();
        var nickname = $("#nickname").val();
        var name = $("#name").val();
        var phone0 = $("#phone0").val();
        var phone1 = $("#phone1").val();
        var phone2 = $("#phone2").val();
        var fdomain = $("#fdomain").val();
        var idRegex = /^[a-zA-Z0-9]{4,12}$/;
        var pwRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{4,16}$/; // 영문자, 숫자, 특수문자 포함
        var correctColor = "#00ff00";
        var wrongColor = "#ff0000";
        var confirmMsg = document.getElementById('confirmMsg');
        
        
        if (id.length == 0) {
            alert('아이디를 입력해주세요');
            $('#id').focus();
            return false;
        }
        if (!idRegex.test(id)) {
            alert('아이디는 4자 이상 12자 이하의 영문자 또는 숫자만 가능합니다');
            $('#id').focus();
            return false;
        }
        if (!isIdAvailable) {
            alert('아이디 중복 확인을 해주세요');
            $('#idcheck').focus();
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
        } else {
            confirmMsg.style.color = correctColor;
            confirmMsg.innerHTML = "비밀번호 일치";
        }
        if (nickname.length == "") {
            alert('닉네임을 입력해주세요');
            $('#nickname').focus();
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
        alert('회원가입을 축하드립니다!');
        document.forms[0].submit();
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
<!-- table input css -->
<style type="text/css">
/* 전체 컨테이너 정렬 */
.container {
    width: 100%;
    max-width: 850px;
    margin: 0 auto; /* 가운데 정렬 */
    padding: 20px;
    border: 1px solid #ddd; 
}

/* 테이블 스타일 */
table {
    width: 100%; /* 테이블 너비 100% */
    margin-top: 10px; /* 상단 간격 */
    border-collapse: collapse; /* 테이블 경계 겹치지 않도록 */
    text-align: c
}

caption {
	text-align: center;
}
table tr th, 
table tr td {
    padding: 14px;
    text-align: left; /* 모든 셀의 정렬을 왼쪽으로 */
    vertical-align: middle; /* 수직 가운데 정렬 */
    border-bottom: 1px solid #ddd; /* 테두리 유지 */
    border: none;
}

/* tr 사이 선*/
table tr{
	padding: 24px;
	border-bottom: 1px solid #ddd;
}

table tr:last-child {
	border-bottom: none;
}
/* input 필드 공통 스타일 */
input[type="text"],
input[type="date"],
input[type="email"],
select {
    width: 100%;
    padding: 12px; /* 내부 여백 */
    border: 1px solid #ddd; /* 연한 테두리 */
    border-radius: 5px; /* 모서리 둥글게 */
    font-size: 14px; /* 글씨 크기 */
    margin-top: 8px; /* 입력 필드 간 간격 */
    box-sizing: border-box; /* 패딩과 테두리 포함한 전체 크기 */
    background-color: #fff;
    transition: border 0.3s ease; /* 테두리 변경 시 부드러운 전환 */
}
/* 비밀번호 입력 필드 스타일 */
.input-container input[type="password"] {
    width: 95%; /* 비밀번호 입력 필드 너비 */
	padding: 12px;
    border: 1px solid #ddd; /* 연한 테두리 */
    border-radius: 5px; /* 모서리 둥글게 */
    font-size: 14px; /* 글씨 크기 */
    margin-top: 8px;
    box-sizing: border-box; /* 패딩과 테두리 포함한 전체 크기 */
    transition: border 0.3s ease;
}
/* input 필드 포커스 시 스타일 */
input[type="text"]:hover,
input[type="password"]:hover,
input[type="date"]:hover,
input[type="email"]:hover,
select
 {
    border-color: #be241c; /* 포커스 시 붉은색 테두리 */
    outline: none; /* 포커스 시 외곽선 제거 */
}

/* input 필드 포커스 시 스타일 */
input[type="text"]:focus,
input[type="password"]:focus,
input[type="date"]:focus,
input[type="email"]:focus,
select {
    border-color: #be241c; /* 포커스 시 붉은색 테두리 */
    outline: none; /* 포커스 시 외곽선 제거 */
}


/* 아이콘 스타일 */
.input-container .togglePassword {
    position: absolute;
    right: 10%; /* 오른쪽 끝에서 10px 간격 */
    top: 55%; /* 세로 가운데 정렬 */
    transform: translateY(-50%); /* 중앙 정렬을 위한 변환 */
    font-size: 16px; /* 아이콘 크기 */
    color: #be241c; /* 아이콘 색상 */
    cursor: pointer;
    background: none;
    border: none;
    outline: none;
}

/* 아이콘 클릭 시 포커스 효과 제거 */
.input-container .togglePassword:focus {
    outline: none;
}
table tr td .phone-container {
    display: flex;
    align-items: center;
    justify-content: space-between; /* 필드 간 간격을 일정하게 유지 */
}
table tr td .email-container {
    display: flex;
    align-items: center;
    justify-content: space-between; /* 필드 간 간격을 일정하게 유지 */
}

/* 전화번호 입력 필드 및 버튼 크기 조정 */
.phone-container select,
.phone-container input[type="text"] {
    width: 30%; /* 필드 너비 30%로 균일하게 조정 */
}

.phone-container input[type="button"] {
    width: 100px; /* 버튼 너비를 고정 크기로 설정 */
    margin-left: 10px; /* 입력 필드와 버튼 간격 설정 */
}
/* 전화번호 입력 필드 및 버튼 크기 조정 */
.email-container select,
.email-container input[type="email"] {
    width: 45%; /* 필드 너비 30%로 균일하게 조정 */
}

.email-container input[type="button"] {
    width: 100px; /* 버튼 너비를 고정 크기로 설정 */
    margin-left: 10px; /* 입력 필드와 버튼 간격 설정 */
}
/* 중복확인 버튼 text 안에 넣기 */
/* input-container는 버튼과 텍스트 필드를 나란히 배치하기 위한 flexbox */
.input-container {
    display: flex;
    align-items: center; /* 수직 가운데 정렬 */
    position: relative;
    width: 100%; /* 컨테이너 전체 너비 */
}

/* id 입력 필드 스타일 수정 */
.input-container input[type="text"] {
    flex: 1; /* 텍스트 입력 필드가 남은 공간을 모두 차지하도록 설정 */
    margin-right: 10px; /* 버튼과의 간격 설정 */
}

/* 중복확인 버튼 스타일 */
#idcheck, #nicknamecheck, #phonecheck
, #emailcheck, #addresscheck,
input[type="button"],
input[type="reset"] {
    margin-top: 8px; /* 입력 필드 간 간격 */
	padding: 12px 20px; /* 버튼 내부 여백 */
	font-size: 14px; /* 버튼 글씨 크기 */
	background-color: #be241c; /* 버튼 배경색 */
	color: white; /* 글자 색상 */
	border: none; /* 테두리 제거 */
	border-radius: 5px; /* 둥근 모서리 */
	cursor: pointer; /* 포인터 모양 변경 */
	transition: background-color 0.3s ease; /* 배경색 전환 */
}

/* 중복확인 버튼 호버 효과 */
#idcheck:hover, #nicknamecheck:hover,
#phonecheck:hover, #emailcheck:hover,
#addresscheck:hover,
input[type="button"]:hover,
input[type="reset"]:hover {
	background-color: #8e1a14;
}

.submitbutton {
	text-align: center;
}

.star {
	color: #f09797;
	font-size: 12px;
}

</style>
    <meta charset="UTF-8">
    <title>회원가입 화면</title>
</head>
<body>
<div class="container">
    <form action="membersave" method="post" id="myform">
        <table>
            <caption><h2>회원가입</h2></caption>
            <tr>
			    <th><strong class="star">⁕ </strong>아이디</th>
			    <td>
			        <div class="input-container">
			            <input type="text" name="id" id="id" placeholder="아이디는 4자 이상 12자 이하의 영문자 또는 숫자만 가능합니다" maxlength="12">
			            <input type="button" name="idcheck" id="idcheck" value="중복확인">
			        </div>
			    </td>
			    
			</tr>
            <tr>
                <th><strong class="star">⁕ </strong>비밀번호</th>
                <td colspan="2">
                    <div class="input-container">
                        <input type="password" name="pw" id="pw" placeholder="비밀번호는 4자 이상 16자 이하로 영문자,숫자,특수문자를 포함해야합니다." maxlength="16">
                        <a class="togglePassword" style="cursor: pointer;"><i class="fas fa-eye-slash"></i></a>
                    </div>
                </td>
            </tr>
            <tr>
                <th><strong class="star">⁕ </strong>비밀번호 확인</th>
                <td colspan="2">
                    <div class="input-container">
                        <input type="password" name="pwconfirm" id="pwconfirm" placeholder="비밀번호 확인" maxlength="16">
                        <a class="togglePassword"><i class="fas fa-eye-slash"></i></a>
                    </div>
                    <span id="confirmMsg"></span>
                </td>
            </tr>
           
            <tr>
                <th><strong class="star">⁕ </strong>닉네임</th>
                <td>
                	<div class="input-container">
	                    <input type="text" name="nickname" id="nickname" placeholder="닉네임을 입력해주세요">
	                    <input type="button" name="nicknamecheck" id="nicknamecheck" value="중복확인">
                    </div>
                </td>
            </tr>
            
            <tr>
                <th><strong class="star">⁕ </strong>이름</th>
                <td>
                    <input type="text" name="name" id="name" placeholder="이름을 입력해주세요" maxlength="6">
                </td>
            </tr>
            
            <tr>
                <th>생년월일</th>
                <td>
                    <input type="date" name="birth" id="birth">
                </td>
            </tr>
            
            <tr>
                <th><strong class="star">⁕ </strong>전화번호</th>
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
	                    <input type="text" name="phone1" id="phone1" maxlength="4">
	                    	<span style="margin: 6px;"> - </span>
	                    <input type="text" name="phone2" id="phone2" maxlength="4">
	                 	<input type="button" name="phonecheck" id="phonecheck" value="중복확인">
                	</div>
                </td>
            </tr>
            
            <tr>
                <th><strong class="star">⁕ </strong>이메일</th>
                <td>
                <div class="email-container">
                    <input type="email" name="fdomain" id="fdomain">
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
                <td>
                </td>
            </tr>
            
            <tr>
                <th>주소</th>
                <td>
                <div class="input-container">
                    <input type="text" id="postcode" placeholder="우편번호">
                    <input type="button" id="addresscheck" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                </div><br>
                    <input type="text" id="mainaddress" placeholder="주소" name="mainaddress"><br>
                    <input type="text" id="detailAddress" placeholder="상세주소" name="detailaddress">
                    <input type="text" id="extraAddress" placeholder="참고항목" name="extraaddress">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                	<div class="submitbutton">
	                    <input type="button" value="회원가입" onclick="check()"> 
	                    <input type="reset" value="취소">
                    </div>
                </td>
            </tr>

        </table>
    </form>
</div>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>