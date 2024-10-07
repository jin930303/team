<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.min.js"></script>
<script>
  document.addEventListener('DOMContentLoaded', function () {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      locale: 'ko',  // 한국어 설정
      initialView: 'dayGridMonth',
      events: {
        url: 'gameiljung',  // 서버에서 일정 데이터를 불러옴
        method: 'GET',
        dataType: 'json',
      },
      dayCellContent: function (info) {
        var number = document.createElement("a");
        number.classList.add("fc-daygrid-day-number");
        number.innerHTML = info.dayNumberText.replace("일", "").replace("日", "");
        return {
          html: number.outerHTML
        };
      },
      eventDidMount: function(info) {
        // 이벤트 제목에 '취소'가 포함되어 있는지 확인
        if (info.event.title.includes("취소")) {
          // '취소'가 포함된 일정의 색상을 주황색으로 변경
          info.el.style.backgroundColor = 'orange';
          info.el.style.borderColor = 'orange';
        }
        else if (info.event.title.includes("예정")) {
            // '취소'가 포함된 일정의 색상을 주황색으로 변경
            info.el.style.backgroundColor = 'green';
            info.el.style.borderColor = 'green';
          }
      }
    });

    calendar.render();
  });
</script>

  <style type="text/css">
    .calendar-container {
        display: flex;
        justify-content: center; /* 가로 중앙 정렬 */
        margin-top: 50px; /* 캘린더 상단에 여백 추가 */
    }

    #calendar {
        width: 60%;
        height: 80%;
    }

    th, td {
        text-align: center;
    }

    /* 버튼 스타일 */
    .add-event-button {
        display: block;
        margin: 20px auto; /* 버튼을 화면 가운데 정렬 */
        padding: 10px 20px;
        background-color: #007BFF; /* 버튼 색상 */
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    .add-event-button:hover {
        background-color: #0056b3; /* 버튼 호버 시 색상 변경 */
    }
</style>
<meta charset="UTF-8">
<h2>경기일정</h2>
</head>
<body>
    <div class="calendar-container">
        <div id="calendar"></div>
    </div>

<c:choose>
<c:when test="${adminloginstate==true}">
    <input type="button" class="add-event-button" onclick="location.href='iljunginput'" value="일정추가">
</c:when>
</c:choose>
</body>
</html>
