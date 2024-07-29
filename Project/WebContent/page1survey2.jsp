<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=360, height=740, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>여행 선호도 조사</title>
    <style>
        html, body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            width: 100%;
            height: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
            justify-content: center;
            align-items: center;
        }
        .modal-content {
            background-color: #fff;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 360px;
            height: 740px;
            max-width: 90%;
            max-height: 90%;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            animation: fadeIn 0.5s;
            overflow-y: auto;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        @keyframes fadeIn {
            from {opacity: 0;}
            to {opacity: 1;}
        }
        .container {
            width: 100%;
            background-color: #fff;
            box-sizing: border-box;
        }
        .container h1 {
            margin-bottom: 20px;
        }
        .question {
            margin-bottom: 20px;
            text-align: left;
        }
        .question label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .question select {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .button-container {
            text-align: center;
            margin-top: 20px;
        }
        .button-container button {
            background-color: #8ab7ff;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 12px;
        }
    </style>
</head>
<body>
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <div class="container">
                <h1>여행 선호도 조사</h1>
                <form id="survey-form">
                    <div class="question">
                        <label for="q1">1. 어느 환경을 더 선호하시나요?</label>
                        <select id="q1" name="q1">
                            <option value="mountain">산</option>
                            <option value="sea">바다</option>
                        </select>
                    </div>
                    <div class="question">
                        <label for="q2">2. 평소 활동 수준은 어느 정도 입니까?</label>
                        <select id="q2" name="q2">
                            <option value="high">고강도 활동(스포츠, 모험)</option>
                            <option value="medium">중간 강도 활동</option>
                            <option value="low">저강도 활동(휴식, 독서)</option>
                        </select>
                    </div>
                    <div class="question">
                        <label for="q3">3. 주로 누구와 함께 여행하시나요?</label>
                        <select id="q3" name="q3">
                            <option value="alone">혼자</option>
                            <option value="friends">친구</option>
                            <option value="partner">연인</option>
                            <option value="family">가족</option>
                        </select>
                    </div>
                    <div class="question">
                        <label for="q4">4. 주로 여행 하는 방법은 무엇입니까?</label>
                        <select id="q4" name="q4">
                            <option value="public_transport">도보, 대중교통</option>
                            <option value="car">자동차</option>
                        </select>
                    </div>
                    <div class="question">
                        <label for="q5">5. 여행 할 때 가장 중요하게 생각하는 것은?</label>
                        <select id="q5" name="q5">
                            <option value="cost">비용</option>
                            <option value="accommodation">숙소</option>
                            <option value="food">맛집</option>
                            <option value="experiences">체험</option>
                            <option value="relaxation">휴식</option>
                        </select>
                    </div>
                    <div class="button-container">
                        <button type="submit">제출</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        const modal = document.getElementById("myModal");
        const span = document.getElementsByClassName("close")[0];

        window.onload = function() {
            modal.style.display = "flex";
        }

        span.onclick = function() {
            modal.style.display = "none";
        }

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        document.getElementById('survey-form').addEventListener('submit', function(event) {
            event.preventDefault();
            
            // 폼 데이터 저장
            const formData = {
                q1: document.getElementById('q1').value,
                q2: document.getElementById('q2').value,
                q3: document.getElementById('q3').value,
                q4: document.getElementById('q4').value,
                q5: document.getElementById('q5').value
            };

            localStorage.setItem('surveyData', JSON.stringify(formData));

            alert('선호도가 여행일정에 반영중입니다...ing ');

            modal.style.display = "none";
            location.href = 'page1sign.jsp';
        });
    </script>
</body>
</html>
