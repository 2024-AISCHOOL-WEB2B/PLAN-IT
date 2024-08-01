<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=360, height=740, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>회원가입</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            overflow: hidden;
        }
        .container {
            width: 360px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            box-sizing: border-box;
            text-align: center;
            height: 100vh;
            overflow-y: auto;
        }
        .logo {
            margin-bottom: 20px;
           	color: #8ab7ff;
        }
        .logo img {
            width: 100px;
        }
        .form-container {
            text-align: left;
        }
        .form-container input, .form-container select, .form-container button {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        .checkbox-container {
            text-align: left;
        }
        .checkbox-container label {
            display: block;
            margin-bottom: 5px;
        }
        .radio-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }
        .radio-container label {
            flex: 1;
            text-align: center;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px 0;
            margin-right: 5px;
            cursor: pointer;
        }
        .radio-container label:last-child {
            margin-right: 0;
        }
        .radio-container input {
            display: none;
        }
        .radio-container input:checked + label {
            background-color: #8ab7ff;
            color: white;
            border-color: #8ab7ff;
        }
        .footer {
            margin-top: 20px;
            font-size: 12px;
            color: #888;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="logo">
            <h1>플랜잇</h1>
        </div>
        <form id="signup-form">
            <div class="form-container">
                <input type="text" id="username" name="username" placeholder="아이디">
                <input type="password" id="password" name="password" placeholder="비밀번호">
                <input type="text" id="name" name="name" placeholder="이름">
                <input type="text" id="birthdate" name="birthdate" placeholder="생년월일 8자리">
                <input type="text" id="phone" name="phone" placeholder="휴대전화번호">
                
                <div class="radio-container">
                    <input type="radio" id="male" name="gender" value="male">
                    <label for="male">남자</label>
                    <input type="radio" id="female" name="gender" value="female">
                    <label for="female">여자</label>
                </div>
                <div class="radio-container">
                    <input type="radio" id="domestic" name="nationality" value="domestic">
                    <label for="domestic">내국인</label>
                    <input type="radio" id="foreign" name="nationality" value="foreign">
                    <label for="foreign">외국인</label>
                </div>
        
                <div class="radio-container">
                    <input type="radio" id="single" name="marital_status" value="single">
                    <label for="single">미혼</label>
                    <input type="radio" id="married" name="marital_status" value="married">
                    <label for="married">기혼</label>
                </div>
                
                <button type="button" onclick="saveSignupData()">선호도 조사하기</button>
                <button type="submit" onclick="location.href='page1login.jsp'">회원가입 완료</button>
            </div>
            <div class="footer">
                <p>&copy; Team PlanIt. All Rights Reserved.</p>
            </div>
        </form>
    </div>
    <script>
        // 저장된 데이터를 불러오는 함수
        function loadSignupData() {
            const referrer = document.referrer;
            if (referrer.includes('page1survey2.jsp')) {
                const signupData = JSON.parse(localStorage.getItem('signupData'));
                if (signupData) {
                    document.getElementById('username').value = signupData.username;
                    document.getElementById('password').value = signupData.password;
                    document.getElementById('name').value = signupData.name;
                    document.getElementById('birthdate').value = signupData.birthdate;
                    document.getElementById('phone').value = signupData.phone;
                    document.getElementById(signupData.gender).checked = true;
                    document.getElementById(signupData.nationality).checked = true;
                    document.getElementById(signupData.marital_status).checked = true;
                }
            } else {
                localStorage.removeItem('signupData');
            }
        }

        // 데이터를 저장하는 함수
        function saveSignupData() {
            const signupData = {
                username: document.getElementById('username').value,
                password: document.getElementById('password').value,
                name: document.getElementById('name').value,
                birthdate: document.getElementById('birthdate').value,
                phone: document.getElementById('phone').value,
                gender: document.querySelector('input[name="gender"]:checked').id,
                nationality: document.querySelector('input[name="nationality"]:checked').id,
                marital_status: document.querySelector('input[name="marital_status"]:checked').id,
            };

            localStorage.setItem('signupData', JSON.stringify(signupData));
            location.href = 'page1survey2.jsp';
        }

        document.getElementById('signup-form').addEventListener('submit', function(event) {
            event.preventDefault();
            alert('회원가입이 완료되었습니다.');
        });

        // 페이지 로드 시 저장된 데이터 불러오기
        window.onload = loadSignupData;
    </script>
</body>
</html>
