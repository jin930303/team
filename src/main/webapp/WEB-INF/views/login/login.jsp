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
<link href="./css/login/login.css" rel="stylesheet"/> 
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
        String clientId = "#"; // 네이버 클라이언트 ID
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
