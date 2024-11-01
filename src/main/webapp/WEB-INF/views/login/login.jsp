<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
    <meta charset="UTF-8">
    <title>로그인</title>
    <script type="text/javascript">
    $(document).ready(function() {
        $('#togglePassword').click(function() {
            const passwordInput = $('#pw');
            const type = passwordInput.attr('type') === 'password' ? 'text' : 'password';
            passwordInput.attr('type', type);

            if (type === 'text') {
                $(this).html('<i class="fas fa-eye-slash"></i>');
            } else {
                $(this).html('<i class="fas fa-eye"></i>');
            }
        });

        // Kakao SDK 초기화
        window.Kakao.init('969b228828d14995f1545967c5c77212');
        console.log(Kakao.isInitialized());

        $('#kakao-login-btn').click(function() {
            KakaoLogin();
        });
    });

    // 카카오 로그인 처리
    function KakaoLogin() {
        window.Kakao.Auth.login({
            scope: 'profile_nickname',
            success: function(authObj) {
                window.Kakao.API.request({
                    url: '/v2/user/me',
                    success: function(res) {
                        const name = res.properties.nickname;
                        $('#kakaoname').val(name);

                        $.ajax({
                            type: "POST",
                            url: "kakaoLoginCheck",
                            data: { kakaoname: name },
                            success: function(response) {
                                if (response.redirect) {
                                    window.location.href = response.redirect;
                                } else if (response.error) {
                                    alert(response.error);
                                }
                            },
                            error: function(jqXHR, textStatus, errorThrown) {
                                console.error("Error:", textStatus, errorThrown);
                            }
                        });
                    }
                });
            },
            fail: function(err) {
                console.error(err);
            }
        });
    }
    </script>
<style type="text/css">
/* 전체 컨테이너 정렬 */
.container {
    width: 100%;
    max-width: 400px;
    margin: 0 auto; /* 가운데 정렬 */
    padding: 20px;
    border: 1px solid #ddd; 
}

/* 테이블 스타일 */
table {
    width: 100%; /* 테이블 너비 100% */
    margin-top: 10px; /* 상단 간격 */
    border-collapse: collapse; /* 테이블 경계 겹치지 않도록 */
    text-align: center;
}

caption {
	text-align: center;
}

table tr td {
    padding: 10px; /* 입력창 사이 간격 */
    text-align: center;
    border: none;
}

/* input 필드 공통 스타일 */
input[type="text"],
input[type="password"] {
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

/* input 필드 포커스 시 스타일 */
input[type="text"]:hover,
input[type="password"]:hover {
    border-color: #be241c; /* 포커스 시 붉은색 테두리 */
    outline: none; /* 포커스 시 외곽선 제거 */
}

/* input 필드 포커스 시 스타일 */
input[type="text"]:focus,
input[type="password"]:focus {
    border-color: #be241c; /* 포커스 시 붉은색 테두리 */
    outline: none; /* 포커스 시 외곽선 제거 */
}

/* 로그인 버튼 스타일 */
input[type="submit"] {
    width: 100%;
    padding: 12px;
    background-color: #be241c; /* 버튼 색상 */
    color: white; /* 버튼 텍스트 색상 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 둥근 모서리 */
    font-size: 16px;
    cursor: pointer; /* 커서를 포인터로 변경 */
    margin-top: 10px; /* 상단 간격 */
    transition: background-color 0.3s ease; /* 색상 전환 효과 */
    
}

/* 로그인 버튼 hover 시 스타일 */
input[type="submit"]:hover {
    background-color: #8e1a14; /* hover 시 어두운 붉은색 */
}

/* '아이디 찾기', '비밀번호 찾기' 버튼 스타일 */
input[type="button"] {
    padding: 10px 20px;
    margin: 10px 2.5%;
    background-color: #6c757d; /* 중간 회색 */
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

/* '아이디 찾기', '비밀번호 찾기' 버튼 hover 시 스타일 */
input[type="button"]:hover {
    background-color: #5a6268; /* hover 시 어두운 회색 */
}

/* 패스워드 input과 아이콘 감싸는 div */
.input-container {
    position: relative; /* 아이콘 위치를 조정하기 위해 부모 요소를 기준으로 */
}

/* 패스워드 토글 아이콘 */
#togglePassword {
    position: absolute;
    right: 10px; /* 오른쪽 정렬 */
    top: 50%; /* 수직 가운데 정렬 */
    transform: translateY(-50%); /* 수직 가운데 정렬 보정 */
    cursor: pointer;
    color: #888; /* 아이콘 색상 */
}

/* 카카오 로그인 버튼 스타일 */
#kakao-login-btn {
    display: block;
    margin: 20px auto; /* 가운데 정렬 */
    text-align: center;
}

/* 네이버 로그인 버튼 */
a img {
    margin-top: 10px;
    border-radius: 5px; /* 이미지 모서리 둥글게 */
    display: block;
    margin: 0 auto; /* 가운데 정렬 */
}

#left-cell {
	color: black;
    border-right: 1px solid #ddd; /* 좌측 셀에 세로선 추가 */
    padding-right: 10px; /* 텍스트와 선 사이 간격 */
    vertical-align: middle; /* 수직 가운데 정렬 */
}

#right-cell {
	color: black;
    padding-left: 10px; /* 선과 우측 셀의 텍스트 간격 */
    vertical-align: middle; /* 수직 가운데 정렬 */
}

#left-cell:hover, #right-cell:hover {
    font-weight: bold;
}
#memberinput{
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
</head>
<body>
<div class="container">
    <form action="logincheck" method="post">
        <input type="hidden" name="kakaoname" id="kakaoname">
        <table>
        <caption><h2>LOGIN</h2></caption>
            <tr>
                <td colspan="2"><input type="text" name="id" placeholder="아이디를 입력해주세요"></td>
            </tr>
            <tr>
                <td colspan="2">
                    <div class="input-container">
                        <input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요">
                        <a id="togglePassword"><i class="fas fa-eye"></i></a>
                    </div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="submit" value="로그인">
                </td>
            </tr>
            <tr>
			    <td id="left-cell"><a href="findmyid">아이디 찾기</a></td>
			    <td id="right-cell"><a href="findmypw">비밀번호 찾기</a></td>
			</tr>

        </table>
        <a id="kakao-login-btn" href="javascript:void(0);">
            <img src="./image/kakao login.png" width="222" alt="카카오 로그인 버튼" height="50px">
        </a>

        <% 
        String clientId = "PtxqAuJgt0ECukbGfDgR"; // 네이버 클라이언트 ID
        String redirectURI = URLEncoder.encode("http://localhost:8092/team/main", "UTF-8");
        SecureRandom random = new SecureRandom();
        String state = new BigInteger(130, random).toString();
        String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"
             + "&client_id=" + clientId
             + "&redirect_uri=" + redirectURI
             + "&state=" + state;
        session.setAttribute("loginstate", state);
        %>
       <!--  <a href="<%=apiURL%>"><img src="./image/naver login.png" alt="네이버 로그인 버튼" height="60px"></a>  --> 
    </form>
    <br>
	<div id="memberinput" class="container" onclick="location.href='memberinput'">
		<strong>아직 회원이 아니신가요?</strong>
		<p>회원가입을 하여 다양한 혜택을 받아보세요!<br>
		<strong>이 곳!</strong>클릭하여 <strong>회원가입</strong>하러 바로가기!</p>
	</div>
</div>
</body>
</html>
