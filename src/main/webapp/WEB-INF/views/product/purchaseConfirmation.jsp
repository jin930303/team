<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Gowun+Batang&family=Nanum+Gothic&family=Noto+Sans+KR:wght@100..900&family=Song+Myung&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>구매 완료</title>
    <style>
        h1 {
            font-family: "Noto Sans KR", sans-serif;
            text-align: center; /* 제목을 중앙 정렬 */
            color: black; /* 제목 색상 검정 */
            margin-bottom: 30px; /* 아래 여백 설정 */
        }

        table {
            width: 70%; /* 테이블 너비 설정 */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 효과 추가 */
            text-align: center; /* 텍스트 중앙 정렬 */
            margin: 0 auto 20px; /* 중앙에 위치하도록 설정 */ 
        }

        th, td {
            font-family: "Noto Sans KR", sans-serif;
            padding: 16px; /* 셀의 패딩 설정 */
            text-align: left; /* 텍스트 왼쪽 정렬 */
            border-bottom: 1px solid #ddd; /* 하단 테두리 설정 */
            font-size: 15px;
        }

        th {
            background-color: #be241c; /* 헤더 배경색을 어두운 회색으로 설정 */
            color: white; /* 헤더 글자색을 흰색으로 설정 */
        }

        tr:hover {
            background-color: #f1f1f1; /* 마우스를 올렸을 때 행 배경색 변경 */
        }

        img {
            border-radius: 5px; /* 이미지에 둥근 모서리 적용 */
        }

        /* 버튼 스타일 */
        .action-button {
            background-color: #be241c; /* 버튼 배경색 */
            color: white; /* 버튼 글자색을 흰색으로 설정 */
            border: none; /* 테두리 제거 */
            padding: 10px 15px; /* 버튼 내부 여백 설정 */
            text-align: center; /* 텍스트 중앙 정렬 */
            cursor: pointer; /* 커서를 포인터로 변경 */
            border-radius: 5px; /* 버튼에 둥근 모서리 적용 */
            transition: background-color 0.3s; /* 배경색 변화에 애니메이션 추가 */
            margin-top: 30px; /* 상단 여백 설정 */
            display: inline-block; /* 버튼을 인라인 블록으로 설정 */
        }

        .action-button:hover {
            background-color: #8e1a14; /* 마우스를 올렸을 때 버튼 배경색 변경 */
        }
    </style>
</head>
<body>
    <h1>구매가 완료되었습니다!</h1>
    <p>선택하신 상품이 성공적으로 구매되었습니다. 감사합니다!</p>
    <table>
        <thead>
            <tr>
                <th>상품명</th>
                <th>상품이미지</th>
                <th>옵션</th>
                <th>수량</th>
                <th>가격</th>
                <th>총 가격</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="item" items="${purchasedItems}">
                <tr>
                    <td>${item.product}</td>
                    <td><img src="./image/${item.image1}" alt="${item.image1}" width="100"></td>
                    <td>${item.op1}</td>
                    <td>${item.count}</td>
                    <td><fmt:formatNumber value="${item.price}" type="number" pattern="#,##0원"/></td>
                    <td><fmt:formatNumber value="${item.price * item.count}" type="number" pattern="#,##0원"/></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
<<<<<<< HEAD
    <p>총 금액: <strong>${totalPrice}원</strong></p>
    <a href="${pageContext.request.contextPath}/main">메인 페이지로 돌아가기</a>
=======

    <p>총 금액: <strong><fmt:formatNumber value="${totalPrice}" type="number" pattern="#,##0원"/></strong></p>

    <a class="action-button" href="${pageContext.request.contextPath}/main">메인 페이지로 돌아가기</a>
>>>>>>> refs/heads/lte
</body>
</html>
