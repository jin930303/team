<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보수정</title>
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
        text-align: left; /* 모든 셀의 정렬을 왼쪽으로 */
    }

    caption {
        text-align: center;
        font-size: 20px;
        padding: 10px;
        color: black;
    }

    table tr th, 
    table tr td {
        padding: 14px;
        vertical-align: middle; /* 수직 가운데 정렬 */
        border-bottom: 1px solid #ddd; /* 테두리 유지 */
    }

    /* 버튼이 포함된 셀의 하단 테두리 제거 */
    tr:last-child td {
        border-bottom: none; /* 하단 테두리 제거 */
    }

    /* input 필드 공통 스타일 */
    input[type="text"],
    input[type="number"],
    input[type="file"],
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

    /* input 필드 포커스 시 스타일 */
    input[type="text"]:focus,
    input[type="number"]:focus,
    input[type="file"]:focus,
    select:focus {
        border-color: #be241c; /* 포커스 시 붉은색 테두리 */
        outline: none; /* 포커스 시 외곽선 제거 */
    }

   /* 버튼 스타일 */
input[type="submit"], 
input[type="button"] {
    background-color: #be241c; /* 버튼 배경색 */
    color: white; /* 글자 색상 */
    border: none; /* 테두리 제거 */
    border-radius: 5px; /* 둥근 모서리 */
    padding: 12px 20px; /* 버튼 내부 여백 */
    font-size: 14px; /* 버튼 글씨 크기 */
    cursor: pointer; /* 포인터 모양 변경 */
    transition: background-color 0.3s ease; /* 배경색 전환 */
    margin-top: 10px;
}

/* 버튼 호버 효과 */
input[type="submit"]:hover, 
input[type="button"]:hover {
    background-color: #8e1a14;
}

</style>
<script>
function updateScgCode() {
    const cg_code = document.getElementById("cg_code").value;
    const scg_code = document.getElementById("scg_code");
   
    // 모든 scg_code 옵션 숨기기
    for (let i = 0; i < scg_code.options.length; i++) {
        scg_code.options[i].style.display = "none";
    }

    // 카테고리별 옵션 매핑
    const optionsMapping = {
        "fcg002": ["bat001", "bat002", "bat003", "bat004", "bat005", "bat006", "bat008", "bat009"],
        "fcg008": ["baseball001", "baseball002", "baseball004", "baseball007"],
        "fcg001": ["mitt001", "mitt002", "mitt003", "mitt004", "mitt005", "mitt006"],
        "fcg007": ["protect001", "protect002", "protect003", "protect004", "protect005", "protect006"],
        "fcg010": ["goods001", "goods002", "goods003", "goods004"],
        "fcg004": ["shoes001", "shoes003", "shoes004", "shoes005", "shoes006"],
        "fcg003": ["glove001", "glove002", "glove003", "glove004", "glove005", "glove006"],
        "fcg005": ["bag001", "bag002", "bag004", "bag005", "bag006", "bag009"],
        "fcg006": ["clothes001", "clothes002", "clothes003", "clothes004", "clothes005", "clothes006", "clothes007", "clothes008", "clothes009", "clothes010", "clothes011"],
        "fcg011": ["etc001", "etc002", "etc003", "etc004", "etc005", "etc006", "etc007", "etc008"]
    };

    // 선택된 cg_code에 해당하는 scg_code 옵션 표시
    if (optionsMapping[cg_code]) {
        optionsMapping[cg_code].forEach(value => {
            const option = Array.from(scg_code.options).find(opt => opt.value === value);
            if (option) {
                option.style.display = "";
            }
        });
    }
   
    // 기본 옵션 추가
    const defaultOption = document.createElement("option");
    defaultOption.value = "";
    defaultOption.textContent = "선택안함";
    
    // 첫 번째 scg_code 옵션으로 기본 선택
    scg_code.selectedIndex = 0;
}
</script>
</head>
<body>
<div class="container">
<form action="productupdatesave" method="post" enctype="multipart/form-data">
    <input type="hidden" name="itemnum" value="${dto.itemnum}">
    <table>
        <caption>상품정보수정</caption>
        <tr><th>상품이름</th><td><input type="text" name="product" value="${dto.product}"></td></tr>
        <tr>
            <th>야구용품/구단별용품</th>
            <td>
                <select name="cg_code" id="cg_code" onchange="updateScgCode()">
                    <option value="fcg002">배트</option>
                    <option value="fcg008">야구공</option>
                    <option value="fcg001">글러브</option>
                    <option value="fcg007">보호장비</option>
                    <option value="fcg010">굿즈</option>
                    <option value="fcg004">야구화</option>
                    <option value="fcg003">장갑</option>
                    <option value="fcg005">가방</option>
                    <option value="fcg006">의류</option>       
                    <option value="fcg011">기타용품</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>옵션선택</th>
            <td>
                <select name="scg_code" id="scg_code">
                    <!-- 배트 옵션 -->
                    <option value="bat001">알루미늄 배트</option>
                    <option value="bat002">카본/컴포짓</option>
                    <option value="bat003">나무배트</option>
                    <option value="bat004">펑고배트</option>
                    <option value="bat005">유소년용 배트</option>
                    <option value="bat006">트레이닝 배트</option>
                    <option value="bat008">배트그립</option>
                    <option value="bat009">배트용품</option>
                    <!-- 야구공 옵션 -->
                    <option value="baseball001">경식구</option>
                    <option value="baseball002">연식구</option>
                    <option value="baseball004">스냅볼</option>
                    <option value="baseball007">야구공 보관함</option>
                    <!-- 글러브 옵션 -->
                    <option value="mitt001">투수/올라운드</option>
                    <option value="mitt002">내야수</option>
                    <option value="mitt003">외야수</option>
                    <option value="mitt004">포수미트</option>
                    <option value="mitt005">어린이/유소년용</option>
                    <option value="mitt006">글러브 관리용품</option>
                    <!-- 보호장비 옵션 -->
                    <option value="protect001">타자헬멧</option>
                    <option value="protect002">암가드</option>
                    <option value="protect003">풋가드</option>
                    <option value="protect004">핸드가드</option>
                    <option value="protect005">안면마스크</option>
                    <option value="protect006">기타 보호장비</option>
                    <!-- 굿즈 옵션 -->
                    <option value="goods001">키링</option>
                    <option value="goods002">타올</option>
                    <option value="goods003">인형</option>
                    <option value="goods004">슬리퍼</option>
                    <!-- 야구화 옵션 -->
                    <option value="shoes001">징 일체형</option>
                    <option value="shoes003">인조잔디화</option>
                    <option value="shoes004">포인트화</option>
                    <option value="shoes006">야구화부속품</option>
                    <!-- 장갑 옵션 -->	
                    <option value="glove001">배팅장갑</option>
                    <option value="glove002">수비장갑</option>
                    <option value="glove003">주루장갑</option>
                    <option value="glove004">방한장갑</option>
                    <option value="glove005">유소년용 장갑</option>
                    <!-- 가방 옵션 -->
                    <option value="bag001">백팩</option>
                    <option value="bag002">크로스백</option>
                    <option value="bag004">휠가방</option>
                    <option value="bag005">배트가방</option>
                    <option value="bag006">볼가방</option>
                    <!-- 의류 옵션 -->
                    <option value="clothes001">티셔츠</option>
                    <option value="clothes002">언더셔츠</option>
                    <option value="clothes003">슬라이딩팬츠</option>
                    <option value="clothes004">롱/숏스판팬츠</option>
                    <option value="clothes005">아이싱웨어</option>
                    <option value="clothes006">바람막이</option>
                    <option value="clothes007">점퍼</option>
                    <option value="clothes008">트레이닝복</option>
                    <option value="clothes009">맨투맨/후디</option>
                    <option value="clothes010">모자/벨트/양말</option>
                    <!-- 기타 옵션 -->
                    <option value="etc001">선글라스</option>
                    <option value="etc002">악세사리</option>
                    <option value="etc003">손목밴드</option>
                    <option value="etc004">로진백</option>
                    <option value="etc007">베이스</option>
                </select>
            </td>
        </tr>
        <tr><th>상품가격</th><td><input type="number" name="price" value="${dto.price}"></td></tr>
        <tr>
            <th>할인율</th>
            <td>
                <select name="sale">
                    <option value="0">없음</option>
                    <option value="5">5%</option>
                    <option value="10">10%</option>
                    <option value="15">15%</option>
                    <option value="20">20%</option>
                    <option value="25">25%</option>
                    <option value="30">30%</option>
                </select>
            </td>
        </tr>
        <tr><th>상품이미지</th><td><span>${dto.image1}</span><input type="file" name="image1"></td></tr>
        <tr><th>상세내용이미지</th><td><span>${dto.dimage}</span><br><input type="file" name="dimage"></td></tr>
        <tr>
            <td colspan="2" style="text-align: center;">
                <input type="submit" value="수정 완료" style="margin-right: 10px;">
                <input type="button" value="취소" onclick="history.back();">
            </td>
        </tr>
    </table>
</form>
</div>
</body>
</html>
