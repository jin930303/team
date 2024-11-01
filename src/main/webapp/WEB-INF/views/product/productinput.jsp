<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>상품정보등록</title>
   <style>

    table {      
        width: 100%; /* 테이블 너비를 100%로 설정 */
        max-width: 600px; /* 최대 너비를 600px로 설정 */
        margin: auto; /* 테이블을 중앙 정렬 */
        background: white; /* 배경색을 흰색으로 설정 */
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 테이블에 그림자 효과 추가 */
    }

    caption {
        font-size: 1.5em; /* 글꼴 크기를 1.5em으로 설정 */
        margin: 10px 0; /* 위아래 여백 추가 */
        color: #333; /* 글자색을 어두운 회색으로 설정 */
        font-weight: bold;
    }

    th, td {
        padding: 12px; /* 셀 안쪽 여백을 12px로 설정 */
        border: 1px solid #ddd; /* 경계선을 연한 회색으로 설정 */
        text-align: left; /* 텍스트를 왼쪽 정렬 */
    }

    th {
        background-color: #be241c; 
        color: white; 
    }

    input[type="text"],
    input[type="number"],
    select {
        width: 100%; /* 입력 필드와 선택 상자의 너비를 100%로 설정 */
        padding: 8px; /* 안쪽 여백을 8px로 설정 */
        margin: 4px 0; /* 위아래 여백을 4px로 설정 */
        border: 1px solid #ccc; /* 경계선을 연한 회색으로 설정 */
        border-radius: 4px; /* 모서리를 둥글게 설정 */
        box-sizing: border-box; /* 패딩과 테두리를 포함한 전체 너비 계산 */
    }

    input[type="file"] {
        padding: 4px; /* 안쪽 여백을 4px로 설정 */
    }

    /* 제출 버튼 스타일 설정 */
    input[type="submit"] {
        background-color: #be241c; /* 버튼 배경색을 붉은색으로 설정 */
        color: white; /* 글자색을 흰색으로 설정 */
        padding: 10px 15px; /* 버튼 안쪽 여백을 10px 위아래, 15px 좌우로 설정 */
        border: none; /* 테두리 없음 */
        border-radius: 4px; /* 모서리를 둥글게 설정 */
        cursor: pointer; /* 마우스 커서를 포인터로 변경 */
        font-size: 1em; /* 글꼴 크기를 기본 크기로 설정 */
        margin-top: 10px; /* 위쪽 여백을 10px로 설정 */
    }

    input[type="submit"]:hover {
        background-color: #8e1a14; /* 마우스를 올렸을 때 배경색을 더 어두운 붉은색으로 변경 */
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

<form action="productsave" method="post" enctype="multipart/form-data">
    <table>
        <caption>상품정보등록</caption>

        <tr><th>상품이미지</th><td><input type="file" name="image1"></td></tr>

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

        <tr><th>상품이름</th><td><input type="text" name="product"></td></tr>
        <tr><th>상품가격</th><td><input type="number" name="price"></td></tr>
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
        <tr><th>상세내용이미지</th><td><input type="file" name="dimage"></td></tr>

        <tr><td colspan="2" style="text-align: center;"><input type="submit" value="전송"></td></tr>

    </table>
</form>
</body>
</html>
