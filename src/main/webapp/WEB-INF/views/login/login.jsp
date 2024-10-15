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
</head>
<body>
    <form action="logincheck" method="post">
        <input type="hidden" name="kakaoname" id="kakaoname">
        <table border="6" align="center">
            <tr>
                <td><input type="text" name="id" placeholder="아이디를 입력해주세요"></td>
            </tr>
            <tr>
                <td>
                    <div class="input-container">
                        <input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요">
                        <a id="togglePassword"><i class="fas fa-eye"></i></a>
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="로그인">
                </td>
            </tr>
        </table>
        <table align="center">
            <tr>
                <th colspan="2">
                    <input type="button" value="아이디 찾기" onclick="location.href='findmyid'">
                    <input type="button" value="비밀번호 찾기" onclick="location.href='findmypw'">
                </th>
            </tr>
        </table>
        <a id="kakao-login-btn" href="javascript:void(0);">
            <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222" alt="카카오 로그인 버튼">
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
        session.setAttribute("state", state);
        %>
        <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"></a>
    </form>
</body>
</html>
