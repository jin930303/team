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
			themeSystem : 'bootstrap5',
			headerToolbar:{
				left : 'prev',
				center : 'title',
				right : 'next'
			},
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
				info.el.style.backgroundColor = 'orange';
				info.el.style.borderColor = 'orange';
          	} 
        	else if (info.event.title.includes("예정")) {
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
        justify-content: center; 
        margin-top: 50px; 
	}

    #calendar {
        width: 60%;
        height: 80%;
    }

    th, td {
        text-align: center;
    }

    .add-event-button {
        display: block;
        margin: 20px auto; 
        padding: 10px 20px;
        background-color: #007BFF;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    .add-event-button:hover {
        background-color: #0056b3;
    }
</style>
<meta charset="UTF-8">
</head>
<body>
<h2>KBO 일정</h2>
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
