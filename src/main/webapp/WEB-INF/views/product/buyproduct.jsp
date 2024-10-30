<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <script type="text/javascript">
        function confirmproduct(){
            if(confirm("구매를 확정하시겠습니까?")){
                alert("구매가 완료 되었습니다.");
                location.href="/team/main";
            }
        }
    </script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <title>구매 확인 페이지</title>

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
        }

        .action-button:hover {
            background-color: #8e1a14; /* 마우스를 올렸을 때 버튼 배경색 변경 */
        }
    </style>
</head>
<body>
    <h1>구매 확인</h1>
    <table>
        <tr>
            <th>상품번호</th>
            <td>${itemnum}</td>
        </tr>
        <tr>
            <th>상품명</th>
            <td>${product}</td>
        </tr>
        <tr>
            <th>옵션</th>
            <td>${op1}</td>
        </tr>
        <tr>
            <th>수량</th>
            <td>${count}</td>
        </tr>
        <tr>
            <th>가격</th>
            <td>
                <fmt:formatNumber value="${price}" type="number" pattern="#,##0원"/>
            </td>
        </tr>
    </table>
    <br>
    <button class="action-button" onclick="confirmproduct()">구매 확정</button>
</body>
</html>
