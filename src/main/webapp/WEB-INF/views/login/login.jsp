<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript">
        $(document).ready(function(){
            $('#togglePassword').click(function(){
                const passwordInput = $('#pw');
                const type = passwordInput.attr('type') === 'password' ? 'text' : 'password'; // 'password'와 'text' 사이에서 토글
                passwordInput.attr('type', type);
                
                // 아이콘 전환 로직
                if (type === 'text') {
                    $(this).html('<i class="fas fa-eye-slash"></i>'); // 비밀번호 보이기 상태
                } else {
                    $(this).html('<i class="fas fa-eye"></i>'); // 비밀번호 숨기기 상태
                }
            });
        });
    </script>
  
    <style>
        /* 스타일 추가 */
        .input-container {
            position: relative;
            display: inline-block;
        }
        #togglePassword {
            position: absolute;
            right: 10px; /* 아이콘의 위치 조정 */
            top: 50%; /* 세로 중앙 정렬 */
            transform: translateY(-50%); /* 세로 중앙 정렬 */
            cursor: pointer;
        }
    </style>
</head>
<body>
<form action="logincheck" method="post">
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
</form>
</body>
</html>
