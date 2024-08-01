<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>여행 기간 선택</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .calendar-container {
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 360px;
            height: 740px;
            overflow-y: auto;
            margin-top: 100px;
        }
        .month {
            margin-top: 20px;
        }
        .month-name {
            font-weight: bold;
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 5px;
            text-align: center;
            font-size: 12px;
        }
        td {
            cursor: pointer;
        }
        td.selected {
            background-color: #007bff;
            color: white;
        }
        td.next-selected {
            background-color: #80bdff;
            color: white;
        }
        #select-button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            margin-top: 20px;
            cursor: pointer;
        }
        .navigation {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
        .navigation button {
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="calendar-container">
    	<br>
    	<br>
        <h3>여행일정을 만들어드립니다</h3>
        <p>출발 날짜를 선택해주세요.</p>
        <p>(현재 1박2일 서비스만 이용가능합니다.)</p>
        <form id="date-form" action="page3.jsp" method="post">
            <div class="navigation">
                <button type="button" id="prev-month">이전 달</button>
                <button type="button" id="next-month">다음 달</button>
            </div>
            <div id="calendar">
                <div class="month">
                    <div class="month-name" id="month-name"></div>
                    <table>
                        <thead>
                            <tr>
                                <th>일</th>
                                <th>월</th>
                                <th>화</th>
                                <th>수</th>
                                <th>목</th>
                                <th>금</th>
                                <th>토</th>
                            </tr>
                        </thead>
                        <tbody id="dates">
                            <!-- 날짜가 JavaScript로 삽입됩니다 -->
                        </tbody>
                    </table>
                </div>
            </div>
            <input type="hidden" id="selected-date" name="selectedDate">
            <input type="hidden" id="next-selected-date" name="nextSelectedDate">
            <button type="button" id="select-button">선택</button>
        </form>
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const today = new Date();
            let currentMonth = today.getMonth();
            let currentYear = today.getFullYear();
            
            const monthNames = ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"];
            const dayNames = ["일", "월", "화", "수", "목", "금", "토"];
            
            function updateCalendar() {
                document.getElementById("month-name").innerText = currentYear + "년 " + monthNames[currentMonth];
                const dates = document.getElementById("dates");
                dates.innerHTML = "";
                generateDates(dates, daysInMonth(currentMonth + 1, currentYear), new Date(currentYear, currentMonth, 1).getDay());
            }

            function daysInMonth(month, year) {
                return new Date(year, month, 0).getDate();
            }

            function generateDates(element, days, startDay) {
                let date = 1;
                for (let i = 0; i < 6; i++) {
                    let row = document.createElement("tr");
                    for (let j = 0; j < 7; j++) {
                        let cell = document.createElement("td");
                        if (i === 0 && j < startDay) {
                            cell.appendChild(document.createTextNode(""));
                        } else if (date > days) {
                            break;
                        } else {
                            cell.appendChild(document.createTextNode(date));
                            cell.addEventListener("click", function(event) {
                                selectDate(event, currentMonth, currentYear);
                            });
                            date++;
                        }
                        row.appendChild(cell);
                    }
                    element.appendChild(row);
                }
            }

            function selectDate(event) {
                let selected = document.querySelectorAll("td.selected, td.next-selected");
                selected.forEach(cell => cell.classList.remove("selected", "next-selected"));
                
                let currentCell = event.target;
                let date = parseInt(currentCell.textContent);
                
                if (!currentCell.classList.contains("selected")) {
                    currentCell.classList.add("selected");
                    
                    let nextCell;
                    let nextDate, nextMonth, nextYear;
                    
                    if (date === daysInMonth(currentMonth + 1, currentYear)) {
                        if (currentMonth === 11) {
                            nextMonth = 0;
                            nextYear = currentYear + 1;
                        } else {
                            nextMonth = currentMonth + 1;
                            nextYear = currentYear;
                        }
                        nextDate = 1;

                        let nextMonthDates = document.querySelectorAll("#calendar .month")[1]?.querySelectorAll("tbody tr td");
                        if (nextMonthDates && nextMonthDates.length > 0) {
                            nextCell = nextMonthDates[0];
                        }
                    } else {
                        nextDate = date + 1;
                        nextMonth = currentMonth;
                        nextYear = currentYear;
                        
                        if (currentCell.cellIndex === 6) { // 토요일인 경우
                            nextCell = currentCell.parentNode.nextSibling ? currentCell.parentNode.nextSibling.cells[0] : null;
                        } else {
                            nextCell = currentCell.nextSibling;
                        }
                    }
                    
                    if (nextCell && nextCell instanceof HTMLTableCellElement) {
                        nextCell.classList.add("next-selected");
                    }

                    const selectedDay = new Date(currentYear, currentMonth, date).getDay();
                    const nextSelectedDay = new Date(nextYear, nextMonth, nextDate).getDay();

                    document.getElementById("selected-date").value = currentYear + "년 " + monthNames[currentMonth] + " " + date + "일 " + dayNames[selectedDay] + "요일";
                    document.getElementById("next-selected-date").value = nextYear + "년 " + monthNames[nextMonth] + " " + nextDate + "일 " + dayNames[nextSelectedDay] + "요일";
                } else {
                    currentCell.classList.remove("selected");

                    let nextCell;
                    let nextDate, nextMonth, nextYear;

                    if (date === daysInMonth(currentMonth + 1, currentYear)) {
                        if (currentMonth === 11) {
                            nextMonth = 0;
                            nextYear = currentYear + 1;
                        } else {
                            nextMonth = currentMonth + 1;
                            nextYear = currentYear;
                        }
                        nextDate = 1;

                        let nextMonthDates = document.querySelectorAll("#calendar .month")[1]?.querySelectorAll("tbody tr td");
                        if (nextMonthDates && nextMonthDates.length > 0) {
                            nextCell = nextMonthDates[0];
                        }
                    } else {
                        nextDate = date + 1;
                        nextMonth = currentMonth;
                        nextYear = currentYear;

                        if (currentCell.cellIndex === 6) { // 토요일인 경우
                            nextCell = currentCell.parentNode.nextSibling ? currentCell.parentNode.nextSibling.cells[0] : null;
                        } else {
                            nextCell = currentCell.nextSibling;
                        }
                    }

                    if (nextCell && nextCell instanceof HTMLTableCellElement) {
                        nextCell.classList.remove("next-selected");
                    }

                    document.getElementById("selected-date").value = "";
                    document.getElementById("next-selected-date").value = "";
                }
            }

            document.getElementById("prev-month").addEventListener("click", function() {
                if (currentMonth === 0) {
                    currentMonth = 11;
                    currentYear--;
                } else {
                    currentMonth--;
                }
                updateCalendar();
            });

            document.getElementById("next-month").addEventListener("click", function() {
                if (currentMonth === 11) {
                    currentMonth = 0;
                    currentYear++;
                } else {
                    currentMonth++;
                }
                updateCalendar();
            });

            document.getElementById("select-button").addEventListener("click", function() {
                const startDate = document.getElementById("selected-date").value;
                const endDate = document.getElementById("next-selected-date").value;
                if (startDate && endDate) {
                    alert("출발 날짜: " + startDate + "\n도착 날짜: " + endDate);
                } else {
                    alert("출발 날짜와 도착 날짜를 선택해 주세요.");
                }
                document.getElementById("date-form").submit();
            });

            updateCalendar();
        });
    </script>
</body>
</html>
