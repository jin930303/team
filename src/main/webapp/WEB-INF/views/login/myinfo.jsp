<%@page import="com.mbc.team.login.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보</title>
<style>

    table {
        width: 70%;
        margin: auto;
        border-collapse: collapse;
        background-color: #ffffff;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
    caption {
        font-size: 1.5em;
        margin: 10px;
        font-weight: bold;
        color: black;
    }
    th, td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #dddddd;
    }
    th {
        background-color: #f2f2f2;
        color: black;
    }
    
    .button {
    background-color: black; 
    color: white; /* 버튼 글자 색상 */
    border: none; /* 테두리 제거 */
    padding: 12px 20px; /* 버튼 패딩 설정 */
    border-radius: 5px; /* 버튼 모서리 둥글게 */
    cursor: pointer; /* 커서 변경 */
    transition: background-color 0.3s; /* 배경 색상 변화 애니메이션 */
    margin: 5px; /* 여백 설정 */
    font-size: 16px; /* 버튼 글자 크기 */
}

.button:hover {
    background-color: #333; /* 호버 시 배경 색상 변화 */
}

.button1 {
    background-color: white; 
    color: black; /* 버튼 글자 색상 */
    border: 1px solid #ccc; /* 테두리 설정 */
    padding: 12px 20px; /* 버튼 패딩 설정 */
    border-radius: 5px; /* 버튼 모서리 둥글게 */
    cursor: pointer; /* 커서 변경 */
    transition: background-color 0.3s; /* 배경 색상 변화 애니메이션 */
    margin: 5px; /* 여백 설정 */
    font-size: 16px; /* 버튼 글자 크기 */
}

.button1:hover {
    background-color: #f0f0f0; /* 호버 시 배경 색상 변화 */
}

.button2 {
    background-color: #be241c; 
    color: white; /* 버튼 글자 색상 */
    border: 1px solid #ccc; /* 테두리 설정 */
    padding: 12px 20px; /* 버튼 패딩 설정 */
    border-radius: 5px; /* 버튼 모서리 둥글게 */
    cursor: pointer; /* 커서 변경 */
    transition: background-color 0.3s; /* 배경 색상 변화 애니메이션 */
    margin: 5px; /* 여백 설정 */
    font-size: 16px; /* 버튼 글자 크기 */
}

.button2:hover {
    background-color: #8e1a14; /* 호버 시 배경 색상 변화 */
}
    .btn-container {
        text-align: center;
    }
   
    .button3 {
    background-color: #f2f2f2; 
    color: black; /* 버튼 글자 색상 */
    border: 1px solid #ccc; /* 테두리 설정 */
    padding: 12px 20px; /* 버튼 패딩 설정 */
    border-radius: 5px; /* 버튼 모서리 둥글게 */
    cursor: pointer; /* 커서 변경 */
    transition: background-color 0.3s; /* 배경 색상 변화 애니메이션 */
    margin: 5px; /* 여백 설정 */
    font-size: 16px; /* 버튼 글자 크기 */
}

.button3:hover {
    background-color: white; /* 호버 시 배경 색상 변화 */
}
    .btn-container {
        text-align: center;
    }
</style>
</head>
<body>

<%
String grade="";
LoginDTO dto1=(LoginDTO)request.getAttribute("dto1");
String grade_code=dto1.getGrade_code();

if (grade_code.equals("004")) grade = "vvip";
else if (grade_code.equals("003")) grade = "vip";
else if (grade_code.equals("002")) grade = "우수회원";
else grade = "일반회원";
%>

<table>
    <caption>${dto1.nickname}님의 회원정보</caption>
    <input type="hidden" name="pw" value="${dto1.pw}">
    <tr>
        <th>당신의 현재 등급은</th>
        <td><%=grade%>입니다.</td>
    </tr>
    <tr>
        <th>당신의 닉네임은</th>
        <td>${dto1.nickname}입니다.</td>
    </tr>
    <tr>
        <th>당신의 주소는</th>
        <td>${dto1.address}입니다.</td>
    </tr>
    <tr>
        <th>당신의 핸드폰 번호는</th>
        <td>${dto1.phone}입니다.</td>
    </tr>
    <tr>
        <th>당신의 이메일 주소는</th>
        <td>${dto1.email}입니다.</td>
    </tr>
    <tr>
        <td colspan="2" class="btn-container">
            <input type="button" class="button" value="정보수정" onclick="location.href='update?id=${dto1.id}'"> 
            <input type="button" class="button3" value="회원탈퇴" onclick="location.href='delete?id=${dto1.id}&pw=${dto1.pw}'">
            <input type="button" class="button1" value="메인으로" onclick="location.href='main'"> 
            <input type="button" class="button2" value="장바구니" onclick="location.href='cart'"> 
        </td>
    </tr>
</table>

</body>
</html>
