<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보등록</title>
<script>
function updateCat2() {
    const cat1 = document.getElementById("cat1").value;
    const cat2 = document.getElementById("cat2");
    const op1 = document.getElementsByName("op1")[0];

    // 모든 cat2 옵션 숨기기
    for (let i = 0; i < cat2.options.length; i++) {
        cat2.options[i].style.display = "none";
    }

    // 카테고리별 옵션 매핑
    const optionsMapping = {
        "배트": ["알루미늄 배트", "카본/컴포짓", "나무배트", "펑고배트", "유소년용 배트", "트레이닝 배트", "배트그립", "배트용품"],
        "야구공": ["경식구", "연식구",  "스냅볼", "야구공 보관함"],
        "글러브": ["투수/올라운드", "내야수", "외야수", "1루/포수미트", "어린이/유소년용", "글러브 관리용품"],
        "보호장비": ["타자헬멧", "암가드", "풋가드", "핸드가드", "안면마스크", "기타 보호장비"],
        "유니폼": ["국가대표 어센틱 유니폼", "KBO 어센틱 유니폼", "MLB 어센틱 유니폼", "NPB 어센틱 유니폼", "기타 유니폼", "키즈 유니폼"],
        "굿즈": ["인형", "쿠션", "키링", "머리띠/팔찌", "기타"],
        "야구화": ["징 일체형", "징 교체형", "인조잔디화", "유소년용 야구화", "런닝/트레이닝화", "야구화부속품"],
        "장갑": ["배팅장갑", "수비장갑", "주루장갑", "방한장갑", "유소년용 장갑", "기타 장갑"],
        "가방": ["백팩", "크로스백", "팀장비 가방", "휠가방", "배트가방", "볼가방", "유소년용 가방", "주머니", "기타 가방"],
        "의류": ["티셔츠", "언더셔츠", "슬라이딩팬츠", "롱/숏스판팬츠", "아이싱웨어", "바람막이", "점퍼", "트레이닝복", "맨투맨/후디", "모자/벨트/양말", "기타"],
        "기타용품": ["선글라스", "악세사리", "손목밴드", "로진백", "아이패치", "피규어", "베이스", "기타용품"]
    };

    // 선택된 cat1에 해당하는 cat2 옵션 표시
    if (optionsMapping[cat1]) {
        optionsMapping[cat1].forEach(value => {
            const option = Array.from(cat2.options).find(opt => opt.value === value);
            if (option) {
                option.style.display = "";
            }
        });
    }

    // op1 옵션 초기화
    op1.innerHTML = "";

    // 기본 옵션 추가
    const defaultOption = document.createElement("option");
    defaultOption.value = "";
    defaultOption.textContent = "선택안함";
    op1.appendChild(defaultOption);

    // op1 옵션 추가
    let options = [];
    if (cat1 === "배트") {
        options = ["32-27", "32.5-27.5", "33-28", "33.5-28.5"];
    } else if (cat1 === "글러브") {
        options = ["우투(왼손착용)", "좌투(오른손착용)"];
    } else if (cat1 === "야구화") {
        options = ["250", "255", "260", "265", "270", "275", "280", "285", "290", "295", "300"];
    }

    // op1에 옵션 추가
    options.forEach(option => {
        const newOption = document.createElement("option");
        newOption.value = option;
        newOption.textContent = option;
        op1.appendChild(newOption);
    });

    // 첫 번째 cat2 옵션으로 기본 선택
    cat2.selectedIndex = 0;
}
</script>
</head>
<body>

<form action="productsave" method="post" enctype="multipart/form-data">
<table border="1" width="600px" align="center">
<caption>상품정보등록</caption>

<tr><th>상품이미지</th><td><input type="file" name="image1"></td></tr>

<tr>
    <th>야구용품/구단별용품</th>
    <td>
        <select name="cat1" id="cat1" onchange="updateCat2()">
            <option value="배트">배트</option>
            <option value="야구공">야구공</option>
            <option value="글러브">글러브</option>
            <option value="보호장비">보호장비</option>
            <option value="유니폼">유니폼</option>
            <option value="굿즈">굿즈</option>
            <option value="야구화">야구화</option>
            <option value="장갑">장갑</option>
            <option value="가방">가방</option>
            <option value="의류">의류</option>       
            <option value="기타용품">기타용품</option>
        </select>
    </td>
</tr>
<tr>
    <th></th>
    <td>
        <select name="cat2" id="cat2">
            <!-- 배트 옵션 -->
            <option value="알루미늄 배트">알루미늄 배트</option>
            <option value="카본/컴포짓">카본/컴포짓</option>
            <option value="나무배트">나무배트</option>
            <option value="펑고배트">펑고배트</option>
            <option value="유소년용 배트">유소년용 배트</option>
            <option value="트레이닝 배트">트레이닝 배트</option>
            <option value="배트그립">배트그립</option>
            <option value="배트용품">배트용품</option>
            
            <!-- 야구공 옵션 -->
            <option value="경식구">경식구</option>
            <option value="연식구">연식구</option>
            <option value="스냅볼">스냅볼</option>
            <option value="야구공 보관함">야구공 보관함</option>
            
            <!-- 글러브 옵션 -->
            <option value="투수/올라운드">투수/올라운드</option>
            <option value="내야수">내야수</option>
            <option value="외야수">외야수</option>
            <option value="1루/포수미트">1루/포수미트</option>
            <option value="어린이/유소년용">어린이/유소년용</option>
            <option value="글러브 관리용품">글러브 관리용품</option>
            
            <!-- 보호장비 옵션 -->
            <option value="타자헬멧">타자헬멧</option>
            <option value="암가드">암가드</option>
            <option value="풋가드">풋가드</option>
            <option value="핸드가드">핸드가드</option>
            <option value="안면마스크">안면마스크</option>
            <option value="기타 보호장비">기타 보호장비</option>
            
            <!-- 유니폼 옵션 -->
            <option value="국가대표 어센틱 유니폼">국가대표 어센틱 유니폼</option>
            <option value="KBO 어센틱 유니폼">KBO 어센틱 유니폼</option>
            <option value="MLB 어센틱 유니폼">MLB 어센틱 유니폼</option>
            <option value="NPB 어센틱 유니폼">NPB 어센틱 유니폼</option>
            <option value="기타 유니폼">기타 유니폼</option>
            <option value="키즈 유니폼">키즈 유니폼</option>
            
            <!-- 굿즈 옵션 -->
            <option value="인형">인형</option>
            <option value="쿠션">쿠션</option>
            <option value="키링">키링</option>
            <option value="머리띠/팔찌">머리띠/팔찌</option>
            <option value="기타">기타</option>
            
            <!-- 야구화 옵션 -->
            <option value="징 일체형">징 일체형</option>
            <option value="징 교체형">징 교체형</option>
            <option value="인조잔디화">인조잔디화</option>
            <option value="유소년용 야구화">유소년용 야구화</option>
            <option value="런닝/트레이닝화">런닝/트레이닝화</option>
            <option value="야구화부속품">야구화부속품</option>
            
            <!-- 장갑 옵션 -->
            <option value="배팅장갑">배팅장갑</option>
            <option value="수비장갑">수비장갑</option>
            <option value="주루장갑">주루장갑</option>
            <option value="방한장갑">방한장갑</option>
            <option value="유소년용 장갑">유소년용 장갑</option>
            <option value="기타 장갑">기타 장갑</option>
            
            <!-- 가방 옵션 -->
            <option value="백팩">백팩</option>
            <option value="크로스백">크로스백</option>
            <option value="팀장비 가방">팀장비 가방</option>
            <option value="휠가방">휠가방</option>
            <option value="배트가방">배트가방</option>
            <option value="볼가방">볼가방</option>
            <option value="유소년용 가방">유소년용 가방</option>
            <option value="주머니">주머니</option>
            <option value="기타 가방">기타 가방</option>
            
            <!-- 의류 옵션 -->
            <option value="티셔츠">티셔츠</option>
            <option value="언더셔츠">언더셔츠</option>
            <option value="슬라이딩팬츠">슬라이딩팬츠</option>
            <option value="롱/숏스판팬츠">롱/숏스판팬츠</option>
            <option value="아이싱웨어">아이싱웨어</option>
            <option value="바람막이">바람막이</option>
            <option value="점퍼">점퍼</option>
            <option value="트레이닝복">트레이닝복</option>
            <option value="맨투맨/후디">맨투맨/후디</option>
            <option value="모자/벨트/양말">모자/벨트/양말</option>
            <option value="기타">기타</option>
            
            <!-- 기타 옵션 -->
            <option value="선글라스">선글라스</option>
            <option value="악세사리">악세사리</option>
            <option value="손목밴드">손목밴드</option>
            <option value="로진백">로진백</option>
            <option value="아이패치">아이패치</option>
            <option value="피규어">피규어</option>
            <option value="베이스">베이스</option>
            <option value="기타용품">기타용품</option>

        </select>
    </td>
</tr>

<tr><th>상품이름</th><td><input type="text" name="product"></td></tr>
<tr><th>상품가격</th><td><input type="number" name="price"></td></tr>
<tr><th>상세내용이미지</th><td><input type="file" name="dimage"></td></tr>

<tr><td><input type="submit" value="전송"></td></tr>

</table>
</form>
</body>
</html>
